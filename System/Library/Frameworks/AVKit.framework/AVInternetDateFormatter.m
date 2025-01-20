@interface AVInternetDateFormatter
+ (id)internetDateFormatter;
- (AVInternetDateFormatter)init;
- (id)dateFromString:(id)a3;
- (id)stringFromDate:(id)a3;
@end

@implementation AVInternetDateFormatter

- (void).cxx_destruct
{
}

- (id)dateFromString:(id)a3
{
  return [(NSISO8601DateFormatter *)self->_dateFormatter dateFromString:a3];
}

- (id)stringFromDate:(id)a3
{
  return [(NSISO8601DateFormatter *)self->_dateFormatter stringFromDate:a3];
}

- (AVInternetDateFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVInternetDateFormatter;
  v2 = [(AVInternetDateFormatter *)&v6 init];
  if (v2)
  {
    v3 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E4F28D48]);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;
  }
  return v2;
}

+ (id)internetDateFormatter
{
  if (internetDateFormatter_onceToken != -1) {
    dispatch_once(&internetDateFormatter_onceToken, &__block_literal_global_23925);
  }
  v2 = (void *)internetDateFormatter__shared;

  return v2;
}

uint64_t __48__AVInternetDateFormatter_internetDateFormatter__block_invoke()
{
  v0 = objc_alloc_init(AVInternetDateFormatter);
  uint64_t v1 = internetDateFormatter__shared;
  internetDateFormatter__shared = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end