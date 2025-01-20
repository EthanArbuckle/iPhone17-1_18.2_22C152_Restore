@interface MTRModeSelectClusterModeOptionStruct
- (MTRModeSelectClusterModeOptionStruct)init;
- (NSArray)semanticTags;
- (NSNumber)mode;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLabel:(NSString *)label;
- (void)setMode:(NSNumber *)mode;
- (void)setSemanticTags:(NSArray *)semanticTags;
@end

@implementation MTRModeSelectClusterModeOptionStruct

- (MTRModeSelectClusterModeOptionStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRModeSelectClusterModeOptionStruct;
  v2 = [(MTRModeSelectClusterModeOptionStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    label = v2->_label;
    v2->_label = (NSString *)&stru_26F969DC8;

    mode = v3->_mode;
    v3->_mode = (NSNumber *)&unk_26F9C8620;

    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF8C0], v6, v7);
    semanticTags = v3->_semanticTags;
    v3->_semanticTags = (NSArray *)v8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRModeSelectClusterModeOptionStruct);
  uint64_t v7 = objc_msgSend_label(self, v5, v6);
  objc_msgSend_setLabel_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_mode(self, v9, v10);
  objc_msgSend_setMode_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_semanticTags(self, v13, v14);
  objc_msgSend_setSemanticTags_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: label:%@; mode:%@; semanticTags:%@; >",
    v5,
    self->_label,
    self->_mode,
  uint64_t v7 = self->_semanticTags);

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
}

- (NSNumber)mode
{
  return self->_mode;
}

- (void)setMode:(NSNumber *)mode
{
}

- (NSArray)semanticTags
{
  return self->_semanticTags;
}

- (void)setSemanticTags:(NSArray *)semanticTags
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticTags, 0);
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end