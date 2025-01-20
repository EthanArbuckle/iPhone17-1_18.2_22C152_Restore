@interface PHASEEnvelope
+ (PHASEEnvelope)new;
- (NSArray)segments;
- (PHASEEnvelope)init;
- (PHASEEnvelope)initWithStartPoint:(simd_double2)startPoint segments:(NSArray *)segments;
- (PHASENumericPair)domain;
- (PHASENumericPair)range;
- (double)evaluateForValue:(double)x;
- (id).cxx_construct;
- (simd_double2)startPoint;
@end

@implementation PHASEEnvelope

- (PHASEEnvelope)init
{
  return 0;
}

+ (PHASEEnvelope)new
{
  return 0;
}

- (PHASEEnvelope)initWithStartPoint:(simd_double2)startPoint segments:(NSArray *)segments
{
  simd_double2 v16 = startPoint;
  v25[4] = *MEMORY[0x263EF8340];
  v5 = segments;
  v21.receiver = self;
  v21.super_class = (Class)PHASEEnvelope;
  if ([(PHASEEnvelope *)&v21 init])
  {
    unint64_t v6 = 0;
    simd_double2 v20 = v16;
    uint64_t v17 = 0;
    v18 = 0;
    unint64_t v19 = 0;
    while ([(NSArray *)v5 count] > v6)
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      v25[0] = &unk_26D471430;
      v25[3] = v25;
      v7 = [(NSArray *)v5 objectAtIndexedSubscript:v6];
      [v7 endPoint];
      uint64_t v23 = v8;

      v9 = [(NSArray *)v5 objectAtIndexedSubscript:v6];
      [v9 endPoint];
      uint64_t v24 = v10;

      v11 = [(NSArray *)v5 objectAtIndexedSubscript:v6];
      Phase::Controller::GetCurveFunctionFromCurveType<double>((Phase::Logger *)[v11 curveType], v22);
      std::__function::__value_func<double ()(double)>::operator=[abi:ne180100](v25, (uint64_t)v22);
      std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100](v22);

      v12 = v18;
      if ((unint64_t)v18 >= v19)
      {
        uint64_t v13 = std::vector<Phase::Envelope<double>::Segment,std::allocator<Phase::Envelope<double>::Segment>>::__push_back_slow_path<Phase::Envelope<double>::Segment const&>(&v17, &v23);
      }
      else
      {
        void *v18 = v23;
        v12[1] = v24;
        std::__function::__value_func<double ()(double)>::__value_func[abi:ne180100]((uint64_t)(v12 + 2), (uint64_t)v25);
        uint64_t v13 = (uint64_t)(v12 + 6);
      }
      v18 = (void *)v13;
      std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100](v25);
      ++v6;
    }
    operator new();
  }
  v14 = (PHASEEnvelope *)0;

  return v14;
}

- (double)evaluateForValue:(double)x
{
  return Phase::Envelope<double>::operator()((double **)self->_envelope.__ptr_.__value_, x);
}

- (simd_double2)startPoint
{
  return *(simd_double2 *)self->_startPoint;
}

- (NSArray)segments
{
  return self->_segments;
}

- (PHASENumericPair)domain
{
  return self->_domain;
}

- (PHASENumericPair)range
{
  return self->_range;
}

- (void).cxx_destruct
{
  std::unique_ptr<Phase::Envelope<double>>::reset[abi:ne180100]((void ***)&self->_envelope, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_segments, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

@end