@interface MTREnergyEVSEModeClusterModeOptionStruct
- (MTREnergyEVSEModeClusterModeOptionStruct)init;
- (NSArray)modeTags;
- (NSNumber)mode;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLabel:(id)a3;
- (void)setMode:(id)a3;
- (void)setModeTags:(id)a3;
@end

@implementation MTREnergyEVSEModeClusterModeOptionStruct

- (MTREnergyEVSEModeClusterModeOptionStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTREnergyEVSEModeClusterModeOptionStruct;
  v2 = [(MTREnergyEVSEModeClusterModeOptionStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    label = v2->_label;
    v2->_label = (NSString *)&stru_26F969DC8;

    mode = v3->_mode;
    v3->_mode = (NSNumber *)&unk_26F9C8620;

    uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF8C0], v6, v7);
    modeTags = v3->_modeTags;
    v3->_modeTags = (NSArray *)v8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyEVSEModeClusterModeOptionStruct);
  uint64_t v7 = objc_msgSend_label(self, v5, v6);
  objc_msgSend_setLabel_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_mode(self, v9, v10);
  objc_msgSend_setMode_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_modeTags(self, v13, v14);
  objc_msgSend_setModeTags_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: label:%@; mode:%@; modeTags:%@; >",
    v5,
    self->_label,
    self->_mode,
  uint64_t v7 = self->_modeTags);

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSNumber)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSArray)modeTags
{
  return self->_modeTags;
}

- (void)setModeTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeTags, 0);
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end