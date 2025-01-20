@interface PCNativeAssetInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)autoloop;
- (NSURL)url;
- (PCNativeAssetInfo)init;
- (PCNativeAssetInfo)initWithCoder:(id)a3;
- (double)bitrate;
- (int64_t)contentType;
- (int64_t)height;
- (int64_t)length;
- (int64_t)width;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoloop:(BOOL)a3;
- (void)setBitrate:(double)a3;
- (void)setContentType:(int64_t)a3;
- (void)setHeight:(int64_t)a3;
- (void)setLength:(int64_t)a3;
- (void)setUrl:(id)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation PCNativeAssetInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeAssetInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCNativeAssetInfo;
  result = [(PCNativeAssetInfo *)&v3 init];
  if (result) {
    result->_contentType = -1;
  }
  return result;
}

- (PCNativeAssetInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v14 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v14)
  {
    *(void *)(v14 + 16) = (int)objc_msgSend_decodeInt32ForKey_(v4, v11, @"contentType", v12, v13, v15, v16);
    *(void *)(v14 + 24) = (int)objc_msgSend_decodeInt32ForKey_(v4, v17, @"width", v18, v19, v20, v21);
    *(void *)(v14 + 32) = (int)objc_msgSend_decodeInt32ForKey_(v4, v22, @"height", v23, v24, v25, v26);
    *(void *)(v14 + 48) = (int)objc_msgSend_decodeInt32ForKey_(v4, v27, @"length", v28, v29, v30, v31);
    objc_msgSend_decodeDoubleForKey_(v4, v32, @"bitrate", v33, v34, v35, v36);
    *(void *)(v14 + 56) = v37;
    uint64_t v38 = objc_opt_class();
    uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"url", v40, v41, v42);
    v44 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v43;

    *(unsigned char *)(v14 + 8) = objc_msgSend_decodeBoolForKey_(v4, v45, @"autoloop", v46, v47, v48, v49);
  }

  return (PCNativeAssetInfo *)v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v81 = a3;
  uint64_t v10 = objc_msgSend_contentType(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInt32_forKey_(v81, v11, v10, @"contentType", v12, v13, v14);
  uint64_t v21 = objc_msgSend_width(self, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeInt32_forKey_(v81, v22, v21, @"width", v23, v24, v25);
  uint64_t v32 = objc_msgSend_height(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeInt32_forKey_(v81, v33, v32, @"height", v34, v35, v36);
  uint64_t v43 = objc_msgSend_url(self, v37, v38, v39, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v81, v44, (uint64_t)v43, @"url", v45, v46, v47);

  uint64_t v54 = objc_msgSend_length(self, v48, v49, v50, v51, v52, v53);
  objc_msgSend_encodeInt32_forKey_(v81, v55, v54, @"length", v56, v57, v58);
  objc_msgSend_bitrate(self, v59, v60, v61, v62, v63, v64);
  objc_msgSend_encodeDouble_forKey_(v81, v65, @"bitrate", v66, v67, v68, v69);
  uint64_t v76 = objc_msgSend_autoloop(self, v70, v71, v72, v73, v74, v75);
  objc_msgSend_encodeBool_forKey_(v81, v77, v76, @"autoloop", v78, v79, v80);
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (double)bitrate
{
  return self->_bitrate;
}

- (void)setBitrate:(double)a3
{
  self->_bitrate = a3;
}

- (BOOL)autoloop
{
  return self->_autoloop;
}

- (void)setAutoloop:(BOOL)a3
{
  self->_autoloop = a3;
}

- (void).cxx_destruct
{
}

@end