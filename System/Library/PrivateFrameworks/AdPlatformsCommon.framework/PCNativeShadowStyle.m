@interface PCNativeShadowStyle
+ (BOOL)supportsSecureCoding;
- (NSArray)offsets;
- (PCNativeColor)color;
- (PCNativeShadowStyle)initWithCoder:(id)a3;
- (double)opacity;
- (double)radius;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setOffsets:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation PCNativeShadowStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeShadowStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"color", v14, v15, v16);
    v18 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = v17;

    objc_msgSend_decodeDoubleForKey_(v4, v19, @"opacity", v20, v21, v22, v23);
    *(double *)(v11 + 16) = v24;
    objc_msgSend_decodeDoubleForKey_(v4, v25, @"radius", v26, v27, v24, v28);
    *(void *)(v11 + 24) = v29;
    v30 = (void *)MEMORY[0x263EFFA08];
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    v38 = objc_msgSend_setWithObjects_(v30, v33, v31, v34, v35, v36, v37, v32, 0);
    uint64_t v43 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v39, (uint64_t)v38, @"offsets", v40, v41, v42);
    v44 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v43;
  }
  return (PCNativeShadowStyle *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_color(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"color", v13, v14, v15);

  objc_msgSend_opacity(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeDouble_forKey_(v4, v22, @"opacity", v23, v24, v25, v26);
  objc_msgSend_radius(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeDouble_forKey_(v4, v33, @"radius", v34, v35, v36, v37);
  objc_msgSend_offsets(self, v38, v39, v40, v41, v42, v43);
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v48, @"offsets", v45, v46, v47);
}

- (PCNativeColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (NSArray)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end