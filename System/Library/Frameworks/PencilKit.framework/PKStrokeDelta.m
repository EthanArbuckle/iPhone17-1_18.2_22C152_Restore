@interface PKStrokeDelta
- (NSUUID)_strokeUUID;
- (PKStrokeDelta)initWithArchive:(const void *)a3 error:(id *)a4;
- (PKStrokeDelta)initWithData:(id)a3 error:(id *)a4;
- (PKStrokePath)deltaStrokeData;
- (_PKStrokeConcrete)deltaStroke;
- (id)dataRepresentation;
- (id)description;
- (void)saveToArchive:(void *)a3;
- (void)setDeltaStroke:(id)a3;
- (void)setDeltaStrokeData:(id)a3;
- (void)set_strokeUUID:(id)a3;
@end

@implementation PKStrokeDelta

- (PKStrokeDelta)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v9 = &unk_1F1FB0740;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (PKProtobufUtilitiesParseArchiveFromNSDataWithHeader<drawing::StrokeDelta>((uint64_t)&v9, v6, a4))
  {
    self = [(PKStrokeDelta *)self initWithArchive:&v9 error:a4];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v9);

  return v7;
}

- (PKStrokeDelta)initWithArchive:(const void *)a3 error:(id *)a4
{
  id v6 = [(PKStrokeDelta *)self init];
  if (v6)
  {
    if (*((void *)a3 + 6))
    {
      uint64_t v7 = +[PKStrokePath strokeDataFromDataArchive:](PKStrokePath, "strokeDataFromDataArchive:");
      deltaStrokeData = v6->_deltaStrokeData;
      v6->_deltaStrokeData = (PKStrokePath *)v7;

      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:**((void **)a3 + 2)];
      strokeUUID = v6->_strokeUUID;
      v6->_strokeUUID = (NSUUID *)v9;
    }
    else
    {
      long long v11 = [[_PKStrokeConcrete alloc] initWithArchive:a3 error:a4];
      strokeUUID = v6->_deltaStroke;
      v6->_deltaStroke = v11;
    }
  }
  return v6;
}

- (id)dataRepresentation
{
  v3 = [(PKStrokeDelta *)self deltaStroke];

  if (v3)
  {
    v4 = [(PKStrokeDelta *)self deltaStroke];
    v5 = [v4 dataRepresentation];
  }
  else
  {
    uint64_t v7 = &unk_1F1FB0740;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    [(PKStrokeDelta *)self saveToArchive:&v7];
    v5 = PKProtobufUtilitiesNSDataFromArchiveWithHeader<drawing::StrokeDelta>((uint64_t)&v7);
    drawing::StrokeDelta::~StrokeDelta((drawing::StrokeDelta *)&v7);
  }

  return v5;
}

- (void)saveToArchive:(void *)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  drawing::StrokeDelta::makeStrokeData((uint64_t)a3);
  [(PKStrokePath *)self->_deltaStrokeData saveToDataArchive:*((void *)a3 + 6)];
  [v5 addObject:self->_strokeUUID];
  unint64_t v6 = *((void *)a3 + 4);
  uint64_t v7 = (PB::Data **)((char *)a3 + 16);
  long long v8 = (char *)*((void *)a3 + 3);
  if ((unint64_t)v8 >= v6)
  {
    uint64_t v10 = (v8 - (char *)*v7) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v6 - (void)*v7;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[2] = (char *)a3 + 32;
    if (v13) {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)a3 + 32, v13);
    }
    else {
      v14 = 0;
    }
    v15 = &v14[16 * v10];
    v16 = v14;
    v17 = v15;
    v18[1] = &v14[16 * v13];
    *(void *)v15 = 0;
    *((void *)v15 + 1) = 0;
    v18[0] = v15 + 16;
    std::vector<PB::Data>::__swap_out_circular_buffer((uint64_t *)a3 + 2, &v16);
    long long v9 = (void *)*((void *)a3 + 3);
    std::__split_buffer<PB::Data>::~__split_buffer((uint64_t)&v16);
  }
  else
  {
    *(void *)long long v8 = 0;
    *((void *)v8 + 1) = 0;
    long long v9 = v8 + 16;
    *((void *)a3 + 3) = v8 + 16;
  }
  *((void *)a3 + 3) = v9;
  v16 = 0;
  v17 = 0;
  [(NSUUID *)self->_strokeUUID getUUIDBytes:&v16];
  PB::Data::assign(*v7, (const unsigned __int8 *)&v16, (const unsigned __int8 *)v18);
}

- (id)description
{
  v3 = [(PKStrokeDelta *)self deltaStroke];

  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  if (v3)
  {
    uint64_t v7 = [(PKStrokeDelta *)self deltaStroke];
    long long v8 = [v4 stringWithFormat:@"<%@: %p stroke=%@>", v6, self, v7];
  }
  else
  {
    uint64_t v7 = [(PKStrokeDelta *)self _strokeUUID];
    long long v9 = objc_msgSend(v7, "PK_shortDescription");
    uint64_t v10 = [(PKStrokeDelta *)self deltaStrokeData];
    uint64_t v11 = [v10 _startIndex];
    uint64_t v12 = [(PKStrokeDelta *)self deltaStrokeData];
    long long v8 = [v4 stringWithFormat:@"<%@: %p strokeID=%@ %ld->%ld>", v6, self, v9, v11, objc_msgSend(v12, "_immutablePointsCount")];
  }

  return v8;
}

- (_PKStrokeConcrete)deltaStroke
{
  return self->_deltaStroke;
}

- (void)setDeltaStroke:(id)a3
{
}

- (PKStrokePath)deltaStrokeData
{
  return self->_deltaStrokeData;
}

- (void)setDeltaStrokeData:(id)a3
{
}

- (NSUUID)_strokeUUID
{
  return self->_strokeUUID;
}

- (void)set_strokeUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeUUID, 0);
  objc_storeStrong((id *)&self->_deltaStrokeData, 0);

  objc_storeStrong((id *)&self->_deltaStroke, 0);
}

@end