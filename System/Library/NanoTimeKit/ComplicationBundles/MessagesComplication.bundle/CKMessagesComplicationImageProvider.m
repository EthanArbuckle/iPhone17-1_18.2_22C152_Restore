@interface CKMessagesComplicationImageProvider
+ (id)sharedInstance;
- (CGSize)imageSize;
- (CKMessagesComplicationImageProvider)init;
- (NSMapTable)imageCache;
- (OS_os_log)log;
- (id)_simpleTintableImageOverImage:(id)a3 withContext:(id)a4;
- (id)imageForUnreadCount:(unint64_t)a3 family:(int64_t)a4 complicationTemplate:(id)a5 specs:(id)a6;
- (os_unfair_lock_s)lock;
- (void)setImageCache:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
@end

@implementation CKMessagesComplicationImageProvider

+ (id)sharedInstance
{
  if (qword_26897B620 != -1) {
    dispatch_once(&qword_26897B620, &unk_26EB84168);
  }
  v2 = (void *)qword_26897B618;

  return v2;
}

- (CKMessagesComplicationImageProvider)init
{
  v14.receiver = self;
  v14.super_class = (Class)CKMessagesComplicationImageProvider;
  v2 = [(CKMessagesComplicationImageProvider *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08968]);
    uint64_t v9 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v3, v4, v5, v6, v7, v8, 0, 5, 0);
    imageCache = v2->_imageCache;
    v2->_imageCache = (NSMapTable *)v9;

    os_log_t v11 = os_log_create("com.apple.Messages", "CKMessagesComplicationImageProvider");
    log = v2->_log;
    v2->_log = (OS_os_log *)v11;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)imageForUnreadCount:(unint64_t)a3 family:(int64_t)a4 complicationTemplate:(id)a5 specs:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [CKMessagesComplicationDataContext alloc];
  objc_msgSend_imageSize(self, v13, v14, v15, v16, v17);
  v23 = objc_msgSend_initWithUnreadCount_family_template_specs_imageSize_(v12, v18, v19, v20, v21, v22, a3, a4, v10, v11);
  os_unfair_lock_lock(&self->_lock);
  v29 = objc_msgSend_objectForKey_(self->_imageCache, v24, v25, v26, v27, v28, v23);
  v35 = v29;
  if (v29)
  {
    id v36 = v29;
  }
  else
  {
    v37 = objc_msgSend_systemImageNamed_(MEMORY[0x263F1C6B0], v30, v31, v32, v33, v34, @"message.fill");
    v43 = objc_msgSend_imageWithRenderingMode_(v37, v38, v39, v40, v41, v42, 2);
    objc_msgSend__simpleTintableImageOverImage_withContext_(self, v44, v45, v46, v47, v48, v43, v23);
    id v36 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKey_(self->_imageCache, v49, v50, v51, v52, v53, v36, v23);
  }

  os_unfair_lock_unlock(&self->_lock);

  return v36;
}

- (id)_simpleTintableImageOverImage:(id)a3 withContext:(id)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_imageFrame(v7, v8, v9, v10, v11, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  if (objc_msgSend_unreadCount(v7, v21, v13, v15, v17, v19))
  {
    double v27 = objc_msgSend_textAttributes(v7, v22, v23, v24, v25, v26);
    BOOL v28 = v27 != 0;
  }
  else
  {
    BOOL v28 = 0;
  }
  v29 = objc_msgSend_preferredFormat(MEMORY[0x263F1C688], v22, v23, v24, v25, v26);
  objc_msgSend_setPreferredRange_(v29, v30, v31, v32, v33, v34, 2);
  double v40 = objc_msgSend_log(self, v35, v36, v37, v38, v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_backgroundFrame(v7, v41, v42, v43, v44, v45);
    double v47 = v46;
    objc_msgSend_backgroundFrame(v7, v48, v49, v50, v51, v46);
    *(_DWORD *)buf = 134219008;
    double v85 = v47;
    __int16 v86 = 2048;
    double v87 = v56;
    __int16 v88 = 2048;
    double v89 = v20;
    __int16 v90 = 2048;
    double v91 = v18;
    __int16 v92 = 2048;
    uint64_t v93 = objc_msgSend_unreadCount(v7, v52, v53, v54, v56, v55);
    _os_log_impl(&dword_23883B000, v40, OS_LOG_TYPE_DEFAULT, "generating image with background size: (%f, %f), imageSize: (%f, %f), unreadCount: %lu", buf, 0x34u);
  }

  id v57 = objc_alloc(MEMORY[0x263F1C680]);
  objc_msgSend_backgroundFrame(v7, v58, v59, v60, v61, v62);
  v66 = objc_msgSend_initWithSize_format_(v57, v63, v64, v65, v64, v65, v29);
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = sub_23883FD34;
  v76[3] = &unk_264D48B50;
  double v79 = v14;
  double v80 = v16;
  double v81 = v18;
  double v82 = v20;
  BOOL v83 = v28;
  id v77 = v6;
  id v78 = v7;
  id v67 = v7;
  id v68 = v6;
  v74 = objc_msgSend_imageWithActions_(v66, v69, v70, v71, v72, v73, v76);

  return v74;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (width == *MEMORY[0x263F001B0] && height == v4)
  {
    id v7 = objc_msgSend_systemImageNamed_(MEMORY[0x263F1C6B0], a2, width, height, *MEMORY[0x263F001B0], v4, @"message.fill");
    objc_msgSend_size(v7, v8, v9, v10, v11, v12);
    self->_imageSize.double width = v13;
    self->_imageSize.double height = v14;

    double width = self->_imageSize.width;
    double height = self->_imageSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSMapTable)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end