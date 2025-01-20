@interface IMAssociatedStickerChatItem
- (BOOL)canDelete;
- (BOOL)supportsCommunicationSafety;
- (NSString)transferGUID;
- (id)_initWithItem:(id)a3 sender:(id)a4 transferGUID:(id)a5;
- (id)commSafetyMessageGUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)stickerPositionVersion;
- (void)_refreshGeometryDescriptorFromStickerUserInfo;
@end

@implementation IMAssociatedStickerChatItem

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (id)commSafetyMessageGUID
{
  v4 = objc_msgSend_message(self, a2, v2, v3);
  v8 = objc_msgSend_guid(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMAssociatedStickerChatItem;
  v4 = [(IMTranscriptChatItem *)&v9 description];
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[[%@] transferGUID: %@]", v6, v4, self->_transferGUID);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v12 = objc_msgSend_sender(self, v9, v10, v11);
  v14 = objc_msgSend__initWithItem_sender_transferGUID_(v4, v13, (uint64_t)v8, (uint64_t)v12, self->_transferGUID);

  return v14;
}

- (BOOL)canDelete
{
  return 1;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 transferGUID:(id)a5
{
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IMAssociatedStickerChatItem;
  v12 = [(IMAssociatedMessageChatItem *)&v19 _initWithItem:a3 sender:a4];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = (void *)v12[20];
    v12[20] = v13;

    objc_msgSend__refreshGeometryDescriptorFromStickerUserInfo(v12, v15, v16, v17);
  }

  return v12;
}

- (void)_refreshGeometryDescriptorFromStickerUserInfo
{
  v5 = objc_msgSend_sharedInstance(IMFileTransferCenter, a2, v2, v3);
  id v8 = objc_msgSend_transferForGUID_(v5, v6, (uint64_t)self->_transferGUID, v7);

  if (objc_msgSend_isSticker(v8, v9, v10, v11))
  {
    v15 = objc_msgSend_stickerUserInfo(v8, v12, v13, v14);
    v18 = objc_msgSend_objectForKey_(v15, v16, *MEMORY[0x1E4F6E368], v17);
    v22 = v18;
    if (v18) {
      uint64_t v64 = objc_msgSend_unsignedIntValue(v18, v19, v20, v21);
    }
    else {
      uint64_t v64 = 0;
    }
    v23 = objc_msgSend_objectForKey_(v15, v19, *MEMORY[0x1E4F6E358], v21);
    v27 = v23;
    if (v23) {
      uint64_t v63 = objc_msgSend_unsignedIntValue(v23, v24, v25, v26);
    }
    else {
      uint64_t v63 = 0;
    }
    v28 = objc_msgSend_objectForKey_(v15, v24, *MEMORY[0x1E4F6E370], v26);
    v32 = v28;
    double v33 = 0.0;
    double v34 = 0.0;
    if (v28)
    {
      objc_msgSend_floatValue(v28, v29, v30, v31);
      double v34 = v35;
    }
    v36 = objc_msgSend_objectForKey_(v15, v29, *MEMORY[0x1E4F6E3D0], v31);
    v40 = v36;
    if (v36)
    {
      objc_msgSend_floatValue(v36, v37, v38, v39);
      double v33 = v41;
    }
    v42 = objc_msgSend_objectForKey_(v15, v37, *MEMORY[0x1E4F6E3D8], v39);
    v46 = v42;
    double v47 = 0.0;
    double v48 = 0.0;
    if (v42)
    {
      objc_msgSend_floatValue(v42, v43, v44, v45);
      double v48 = v49;
    }
    v50 = objc_msgSend_objectForKey_(v15, v43, *MEMORY[0x1E4F6E380], v45);
    v54 = v50;
    if (v50)
    {
      objc_msgSend_floatValue(v50, v51, v52, v53);
      double v47 = v55;
    }
    v56 = objc_msgSend_objectForKey_(v15, v51, *MEMORY[0x1E4F6E378], v53);
    v60 = v56;
    if (v56)
    {
      objc_msgSend_floatValue(v56, v57, v58, v59);
      double v62 = v61;
    }
    else
    {
      double v62 = 0.0;
    }
    v65[0] = v64;
    v65[1] = v63;
    *(double *)&v65[2] = v34;
    *(double *)&v65[3] = v33;
    *(double *)&v65[4] = v48;
    *(double *)&v65[5] = v47;
    *(double *)&v65[6] = v62;
    objc_msgSend__setGeometryDescriptor_(self, v57, (uint64_t)v65, v59);
  }
}

- (unint64_t)stickerPositionVersion
{
  v5 = objc_msgSend_sharedInstance(IMFileTransferCenter, a2, v2, v3);
  id v8 = objc_msgSend_transferForGUID_(v5, v6, (uint64_t)self->_transferGUID, v7);

  if (objc_msgSend_isSticker(v8, v9, v10, v11))
  {
    v15 = objc_msgSend_stickerUserInfo(v8, v12, v13, v14);
    v18 = objc_msgSend_valueForKey_(v15, v16, *MEMORY[0x1E4F6E3C0], v17);
    unint64_t v22 = objc_msgSend_unsignedIntValue(v18, v19, v20, v21);
  }
  else
  {
    unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v22;
}

- (NSString)transferGUID
{
  return self->_transferGUID;
}

- (void).cxx_destruct
{
}

@end