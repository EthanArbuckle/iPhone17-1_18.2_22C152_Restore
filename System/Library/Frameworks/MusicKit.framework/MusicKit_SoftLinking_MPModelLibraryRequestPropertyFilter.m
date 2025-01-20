@interface MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter
+ (int64_t)_underlyingComparisonTypeForComparisonType:(int64_t)a3;
- (MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter)initWithKeys:(id)a3 value:(id)a4 type:(int64_t)a5;
- (id)_underlyingPropertyFilter;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter

- (MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter)initWithKeys:(id)a3 value:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter;
  v10 = [(MusicKit_SoftLinking_MPModelLibraryRequestPropertyFilter *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [(id)objc_opt_class() _underlyingComparisonTypeForComparisonType:a5];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v12 = (void *)get_MPModelLibraryRequestPropertyFilterClass_softClass;
    uint64_t v22 = get_MPModelLibraryRequestPropertyFilterClass_softClass;
    if (!get_MPModelLibraryRequestPropertyFilterClass_softClass)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __get_MPModelLibraryRequestPropertyFilterClass_block_invoke;
      v18[3] = &unk_26443F950;
      v18[4] = &v19;
      __get_MPModelLibraryRequestPropertyFilterClass_block_invoke((uint64_t)v18);
      v12 = (void *)v20[3];
    }
    v13 = v12;
    _Block_object_dispose(&v19, 8);
    uint64_t v14 = [[v13 alloc] initWithKeys:v8 value:v9 comparisonType:v11];
    underlyingPropertyFilter = v10->_underlyingPropertyFilter;
    v10->_underlyingPropertyFilter = (_MPModelLibraryRequestPropertyFilter *)v14;
  }
  return v10;
}

- (id)_underlyingPropertyFilter
{
  return self->_underlyingPropertyFilter;
}

+ (int64_t)_underlyingComparisonTypeForComparisonType:(int64_t)a3
{
  return a3 == 1;
}

- (void).cxx_destruct
{
}

@end