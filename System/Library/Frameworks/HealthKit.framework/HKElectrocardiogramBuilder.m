@interface HKElectrocardiogramBuilder
- (HKElectrocardiogramBuilder)initWithStartDate:(id)a3 frequency:(id)a4;
- (HKQuantity)frequency;
- (NSDate)startDate;
- (id).cxx_construct;
- (id)finishWithDevice:(id)a3 metadata:(id)a4;
- (void)addAverageHeartRate:(id)a3;
- (void)addClassification:(unint64_t)a3;
- (void)addValue:(float)a3 lead:(int64_t)a4;
- (void)setFrequency:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation HKElectrocardiogramBuilder

- (HKElectrocardiogramBuilder)initWithStartDate:(id)a3 frequency:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKElectrocardiogramBuilder;
  v9 = [(HKElectrocardiogramBuilder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_frequency, a4);
  }

  return v10;
}

- (void)addValue:(float)a3 lead:(int64_t)a4
{
  int v30 = a4;
  left = (char *)self->_leads.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_leads.__tree_.__pair1_;
  v6 = left;
  id v8 = (uint64_t **)&p_pair1[-1];
  if (!left) {
    goto LABEL_11;
  }
  v9 = p_pair1;
  do
  {
    int v10 = *((_DWORD *)v6 + 8);
    BOOL v11 = v10 < (int)a4;
    if (v10 >= (int)a4) {
      objc_super v12 = (void **)v6;
    }
    else {
      objc_super v12 = (void **)(v6 + 8);
    }
    if (!v11) {
      v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<binarysample::ElectrocardiogramLead_Name, binarysample::ElectrocardiogramLead>, void *>>> *)v6;
    }
    v6 = (char *)*v12;
  }
  while (*v12);
  if (v9 == p_pair1 || SLODWORD(v9[4].__value_.__left_) > (int)a4)
  {
LABEL_11:
    v31 = &v30;
    v13 = std::__tree<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::__map_value_compare<binarysample::ElectrocardiogramLead_Name,std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::less<binarysample::ElectrocardiogramLead_Name>,true>,std::allocator<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>>>::__emplace_unique_key_args<binarysample::ElectrocardiogramLead_Name,std::piecewise_construct_t const&,std::tuple<binarysample::ElectrocardiogramLead_Name const&>,std::tuple<>>((uint64_t **)&p_pair1[-1], &v30, (uint64_t)&std::piecewise_construct, &v31);
    int v14 = v30;
    *((unsigned char *)v13 + 100) |= 1u;
    *((_DWORD *)v13 + 24) = v14;
  }
  v31 = &v30;
  v15 = std::__tree<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::__map_value_compare<binarysample::ElectrocardiogramLead_Name,std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::less<binarysample::ElectrocardiogramLead_Name>,true>,std::allocator<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>>>::__emplace_unique_key_args<binarysample::ElectrocardiogramLead_Name,std::piecewise_construct_t const&,std::tuple<binarysample::ElectrocardiogramLead_Name const&>,std::tuple<>>(v8, &v30, (uint64_t)&std::piecewise_construct, &v31);
  v16 = v15;
  v17 = (float *)v15[10];
  uint64_t v18 = (uint64_t)(v15 + 11);
  v19 = v15[11];
  if (v17 >= (float *)v19)
  {
    v21 = (float *)v15[9];
    uint64_t v22 = v17 - v21;
    if ((unint64_t)(v22 + 1) >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v23 = (char *)v19 - (char *)v21;
    unint64_t v24 = ((char *)v19 - (char *)v21) >> 1;
    if (v24 <= v22 + 1) {
      unint64_t v24 = v22 + 1;
    }
    if (v23 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v24;
    }
    if (v25)
    {
      v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v18, v25);
      v21 = (float *)v16[9];
      v17 = (float *)v16[10];
    }
    else
    {
      v26 = 0;
    }
    v27 = (float *)&v26[4 * v22];
    v28 = (uint64_t *)&v26[4 * v25];
    float *v27 = a3;
    v20 = v27 + 1;
    while (v17 != v21)
    {
      int v29 = *((_DWORD *)v17-- - 1);
      *((_DWORD *)v27-- - 1) = v29;
    }
    v16[9] = (uint64_t *)v27;
    v16[10] = (uint64_t *)v20;
    v16[11] = v28;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    float *v17 = a3;
    v20 = v17 + 1;
  }
  v16[10] = (uint64_t *)v20;
}

- (void)addAverageHeartRate:(id)a3
{
}

- (void)addClassification:(unint64_t)a3
{
  self->_classification = a3;
}

- (id)finishWithDevice:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  binarysample::Electrocardiogram::Electrocardiogram((uint64_t)v15);
  id v8 = +[HKUnit hertzUnit];
  v9 = [(HKElectrocardiogramBuilder *)self frequency];
  [v9 doubleValueForUnit:v8];
  v17 |= 1u;
  uint64_t v16 = v10;

  if (self->_leads.__tree_.__begin_node_ != &self->_leads.__tree_.__pair1_) {
    PB::PtrVector<binarysample::ElectrocardiogramLead>::emplace_back<binarysample::ElectrocardiogramLead const>();
  }
  BOOL v11 = [(HKElectrocardiogramBuilder *)self startDate];
  objc_super v12 = +[HKElectrocardiogram _electrocardiogramWithStartDate:v11 device:v6 metadata:v7];

  binarysample::Electrocardiogram::Electrocardiogram((binarysample::Electrocardiogram *)v14, (const binarysample::Electrocardiogram *)v15);
  [v12 setReading:v14];
  binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)v14);
  [v12 _setPrivateClassification:self->_classification];
  [v12 _setAverageHeartRate:self->_averageHeartRate];

  binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)v15);

  return v12;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (HKQuantity)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  left = self->_leads.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::__map_value_compare<binarysample::ElectrocardiogramLead_Name,std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>,std::less<binarysample::ElectrocardiogramLead_Name>,true>,std::allocator<std::__value_type<binarysample::ElectrocardiogramLead_Name,binarysample::ElectrocardiogramLead>>>::destroy((uint64_t)&self->_leads, left);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end