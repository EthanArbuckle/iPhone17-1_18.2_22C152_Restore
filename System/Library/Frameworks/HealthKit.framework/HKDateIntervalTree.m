@interface HKDateIntervalTree
- (BOOL)hasOverlapWithInterval:(id)a3;
- (BOOL)hasOverlapWithStartTime:(double)a3 endTime:(double)a4;
- (BOOL)mergeIntervals;
- (HKDateIntervalTree)init;
- (id).cxx_construct;
- (id)mergedIntervals;
- (uint64_t)mergedIntervals;
- (void)insertInterval:(id)a3;
- (void)insertIntervalWithStartTime:(double)a3 endTime:(double)a4;
- (void)mergedIntervals;
- (void)setMergeIntervals:(BOOL)a3;
@end

@implementation HKDateIntervalTree

- (HKDateIntervalTree)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKDateIntervalTree;
  if ([(HKDateIntervalTree *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)setMergeIntervals:(BOOL)a3
{
  *((unsigned char *)self->_tree.__ptr_.__value_ + 8) = a3;
}

- (BOOL)mergeIntervals
{
  return *((unsigned char *)self->_tree.__ptr_.__value_ + 8);
}

- (void)insertIntervalWithStartTime:(double)a3 endTime:(double)a4
{
  value = (uint64_t *)self->_tree.__ptr_.__value_;
  if (a4 >= a3) {
    double v5 = a3;
  }
  else {
    double v5 = a4;
  }
  if (a3 < a4) {
    a3 = a4;
  }
  v6[0] = v5;
  v6[1] = a3;
  HKIntervalTree<double>::insertInterval(value, v6, *(__n128 *)&a3);
}

- (void)insertInterval:(id)a3
{
  id v9 = a3;
  v4 = [v9 startDate];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  v7 = [v9 endDate];
  [v7 timeIntervalSinceReferenceDate];
  [(HKDateIntervalTree *)self insertIntervalWithStartTime:v6 endTime:v8];
}

- (BOOL)hasOverlapWithInterval:(id)a3
{
  id v4 = a3;
  double v5 = [v4 startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  double v8 = [v4 endDate];
  [v8 timeIntervalSinceReferenceDate];
  LOBYTE(self) = [(HKDateIntervalTree *)self hasOverlapWithStartTime:v7 endTime:v9];

  return (char)self;
}

- (BOOL)hasOverlapWithStartTime:(double)a3 endTime:(double)a4
{
  value = (uint64_t *)self->_tree.__ptr_.__value_;
  if (a4 >= a3) {
    double v5 = a3;
  }
  else {
    double v5 = a4;
  }
  if (a3 < a4) {
    a3 = a4;
  }
  v7[0] = v5;
  v7[1] = a3;
  return HKIntervalTree<double>::hasOverlapWithInterval(value, v7);
}

- (id)mergedIntervals
{
  v7[4] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  value = (uint64_t *)self->_tree.__ptr_.__value_;
  v7[0] = &unk_1EEC59418;
  v7[1] = &v6;
  v7[3] = v7;
  HKIntervalTree<double>::_enumeratePreOrder((uint64_t)value, *value, (uint64_t)v7);
  std::__function::__value_func<void ()(HKIntervalTreeNode<double> *)>::~__value_func[abi:ne180100](v7);
  id v4 = (void *)[v6 copy];

  return v4;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)mergedIntervals
{
}

- (uint64_t)mergedIntervals
{
    return a1 + 8;
  else {
    return 0;
  }
}

@end