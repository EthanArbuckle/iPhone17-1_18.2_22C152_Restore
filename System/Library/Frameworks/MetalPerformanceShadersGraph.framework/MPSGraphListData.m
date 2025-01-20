@interface MPSGraphListData
- (MPSGraphListData)initWithDevice:(id)a3 list:(id)a4 maxSize:(int64_t)a5 elementType:(id)a6;
- (id)clonedList;
- (id)elementType;
- (id)initEmptyListWithDevice:(id)a3 maxSize:(int64_t)a4 elementType:(id)a5;
- (id)list;
- (id)mpsndarray;
- (id)popBackElement;
- (int64_t)maxSize;
- (void)pushBackElement:(id)a3;
@end

@implementation MPSGraphListData

- (id)mpsndarray
{
}

- (MPSGraphListData)initWithDevice:(id)a3 list:(id)a4 maxSize:(int64_t)a5 elementType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(MPSGraphTensorData *)self initEmptyWithShape:MEMORY[0x1E4F1CBF0] dataType:268435488 device:v10];
  uint64_t v14 = [v11 mutableCopy];
  list = v13->_list;
  v13->_list = (NSMutableArray *)v14;

  v13->_maxSize = a5;
  objc_storeStrong((id *)&v13->_elementType, a6);
  if (v13->_maxSize != -1 && (unint64_t)[v11 count] > v13->_maxSize) {
    __assert_rtn("-[MPSGraphListData initWithDevice:list:maxSize:elementType:]", "MPSGraphList.mm", 50, "_maxSize == -1 || list.count <= _maxSize");
  }

  return v13;
}

- (id)initEmptyListWithDevice:(id)a3 maxSize:(int64_t)a4 elementType:(id)a5
{
  return [(MPSGraphListData *)self initWithDevice:a3 list:MEMORY[0x1E4F1CBF0] maxSize:a4 elementType:a5];
}

- (void)pushBackElement:(id)a3
{
  id v4 = a3;
  if (self->_maxSize != -1 && (unint64_t)[(NSMutableArray *)self->_list count] >= self->_maxSize) {
    __assert_rtn("-[MPSGraphListData pushBackElement:]", "MPSGraphList.mm", 66, "_maxSize == -1 || _list.count < _maxSize");
  }
  [(NSMutableArray *)self->_list addObject:v4];
}

- (id)popBackElement
{
  if (![(NSMutableArray *)self->_list count]) {
    __assert_rtn("-[MPSGraphListData popBackElement]", "MPSGraphList.mm", 72, "_list.count != 0");
  }
  v3 = [(NSMutableArray *)self->_list lastObject];
  [(NSMutableArray *)self->_list removeLastObject];

  return v3;
}

- (int64_t)maxSize
{
  return self->_maxSize;
}

- (id)elementType
{
  return self->_elementType;
}

- (id)list
{
  return self->_list;
}

- (id)clonedList
{
  v3 = [MPSGraphListData alloc];
  id v4 = [(MPSGraphTensorData *)self device];
  v5 = [(MPSGraphListData *)v3 initWithDevice:v4 list:self->_list maxSize:self->_maxSize elementType:self->_elementType];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementType, 0);

  objc_storeStrong((id *)&self->_list, 0);
}

@end