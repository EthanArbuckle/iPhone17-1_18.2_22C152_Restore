@interface _ACComponentVector
+ (BOOL)supportsSecureCoding;
- (_ACComponentVector)initWithCoder:(id)a3;
- (_ACComponentVector)initWithVector:(const void *)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ACComponentVector

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ACComponentVector)initWithCoder:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v6 = [v4 setWithArray:v5];
  v27 = [v28 decodeObjectOfClasses:v6 forKey:@"components"];

  v7 = v27;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v27;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      p_mVector = &self->mVector;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            end = (char *)self->mVector.__end_;
            value = (char *)self->mVector.__end_cap_.__value_;
            if (end >= value)
            {
              uint64_t v18 = (end - (char *)p_mVector->__begin_) >> 4;
              unint64_t v19 = v18 + 1;
              if ((unint64_t)(v18 + 1) >> 60) {
                std::vector<float>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v20 = value - (char *)p_mVector->__begin_;
              if (v20 >> 3 > v19) {
                unint64_t v19 = v20 >> 3;
              }
              if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v21 = v19;
              }
              v33[4] = &self->mVector.__end_cap_;
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<applesauce::CF::StringRef,applesauce::CF::StringRef>>>(v21);
              v23 = &v22[16 * v18];
              v33[0] = v22;
              v33[1] = v23;
              v33[3] = &v22[16 * v24];
              long long v25 = *(_OWORD *)(v13 + 8);
              *(_OWORD *)v23 = v25;
              if (*((void *)&v25 + 1)) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v25 + 1) + 8), 1uLL, memory_order_relaxed);
              }
              v33[2] = v23 + 16;
              std::vector<std::shared_ptr<APComponent>>::__swap_out_circular_buffer((uint64_t *)&self->mVector, v33);
              v17 = self->mVector.__end_;
              std::__split_buffer<std::shared_ptr<unsigned char []>>::~__split_buffer((uint64_t)v33);
            }
            else
            {
              *(void *)end = *(void *)(v13 + 8);
              uint64_t v16 = *(void *)(v13 + 16);
              *((void *)end + 1) = v16;
              if (v16) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
              }
              v17 = end + 16;
              self->mVector.__end_ = end + 16;
            }
            self->mVector.__end_ = v17;
            self->mVector.mSorted = 0;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }

    v7 = v27;
  }

  return self;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((unsigned char *)self + 32) = 1;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = objc_opt_new();
  begin = (char *)self->mVector.__begin_;
  for (uint64_t i = (char *)self->mVector.__end_; begin != i; begin += 16)
  {
    v7 = [[_ACComponentWrapper alloc] initWithComponent:begin];
    [v4 addObject:v7];
  }
  [v8 encodeObject:v4 forKey:@"components"];
}

- (_ACComponentVector)initWithVector:(const void *)a3
{
  p_mVector = (uint64_t *)&self->mVector;
  if (p_mVector != a3) {
    std::vector<std::shared_ptr<APComponent>>::__assign_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>(p_mVector, *(uint64_t **)a3, *((uint64_t **)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  }
  self->mVector.mSorted = *((unsigned char *)a3 + 24);
  return self;
}

- (void).cxx_destruct
{
  p_mVector = &self->mVector;
  std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_mVector);
}

@end