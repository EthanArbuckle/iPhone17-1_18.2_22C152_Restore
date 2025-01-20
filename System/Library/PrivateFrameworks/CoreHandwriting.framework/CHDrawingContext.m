@interface CHDrawingContext
- (CHClassifiableDrawing)classifiableDrawing;
- (CHDrawingContext)initWithEdgeIndex:(unint64_t)a3 numberOfSubstrokes:(int64_t)a4 numberOfSegments:(int64_t)a5 classifiableDrawing:(id)a6 strokeGroup:()set<long;
- (id).cxx_construct;
- (int64_t)numberOfSegments;
- (int64_t)numberOfSubstrokes;
- (set<long,)strokeGroup;
- (unint64_t)edgeIndex;
@end

@implementation CHDrawingContext

- (CHDrawingContext)initWithEdgeIndex:(unint64_t)a3 numberOfSubstrokes:(int64_t)a4 numberOfSegments:(int64_t)a5 classifiableDrawing:(id)a6 strokeGroup:()set<long
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CHDrawingContext;
  v14 = [(CHDrawingContext *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_edgeIndex = a3;
    v14->_numberOfSubstrokes = a4;
    v14->_numberOfSegments = a5;
    objc_storeStrong((id *)&v14->_classifiableDrawing, a6);
    if (&v15->_strokeGroup != a7) {
      sub_1C499CDB0((uint64_t)&v15->_strokeGroup, a7->__tree_.__begin_node_, &a7->__tree_.__pair1_.__value_.__left_);
    }
  }

  return v15;
}

- (unint64_t)edgeIndex
{
  return self->_edgeIndex;
}

- (int64_t)numberOfSubstrokes
{
  return self->_numberOfSubstrokes;
}

- (int64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (CHClassifiableDrawing)classifiableDrawing
{
  return self->_classifiableDrawing;
}

- (set<long,)strokeGroup
{
  retstr->__tree_.__pair3_.__value_ = 0;
  retstr->__tree_.__pair1_.__value_.__left_ = 0;
  retstr->__tree_.__begin_node_ = &retstr->__tree_.__pair1_;
  return (set<long, std::less<long>, std::allocator<long>> *)sub_1C49A0A6C(retstr, (void *)self->_strokeGroup.__tree_.__begin_node_, &self->_strokeGroup.__tree_.__pair1_.__value_.__left_);
}

- (void).cxx_destruct
{
  sub_1C4999C7C((uint64_t)&self->_strokeGroup, (void *)self->_strokeGroup.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_classifiableDrawing, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = (char *)self + 48;
  return self;
}

@end