@interface GDPersonTaggingOptions
- (GDPersonTaggingOptions)initWithTagThresholds:(id)a3;
- (NSDictionary)tagThresholds;
- (void)setTagThresholds:(id)a3;
@end

@implementation GDPersonTaggingOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagThresholds, 0);

  objc_storeStrong((id *)&self->inner, 0);
}

- (void)setTagThresholds:(id)a3
{
}

- (NSDictionary)tagThresholds
{
  return (NSDictionary *)((uint64_t (*)(GDPersonEntityTaggingOptionsInner *, char *))MEMORY[0x1F4181798])(self->inner, sel_tagNameThresholds);
}

- (GDPersonTaggingOptions)initWithTagThresholds:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDPersonTaggingOptions;
  v5 = [(GDPersonTaggingOptions *)&v13 init];
  if (v5)
  {
    v6 = [GDPersonEntityTaggingOptionsInner alloc];
    uint64_t v10 = objc_msgSend_initWithTagNameThresholds_(v6, v7, (uint64_t)v4, v8, v9);
    inner = v5->inner;
    v5->inner = (GDPersonEntityTaggingOptionsInner *)v10;
  }
  return v5;
}

@end