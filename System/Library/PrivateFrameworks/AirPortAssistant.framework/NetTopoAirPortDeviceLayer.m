@interface NetTopoAirPortDeviceLayer
- ($E32549A47AE6FE03C4AA404FAEB37148)getConnectionAttachmentLocations;
- (NetTopoAirPortDeviceLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4;
- (id)debugDescription;
- (id)description;
- (void)dealloc;
- (void)initNetTopoAirPortDeviceLayerCommonWithStyle:(int)a3 andOwningView:(id)a4;
- (void)layoutSublayers;
- (void)pickCorrectImagesForContentsScale:(double)a3;
- (void)setAssociatedNode:(id)a3;
@end

@implementation NetTopoAirPortDeviceLayer

- (void)initNetTopoAirPortDeviceLayerCommonWithStyle:(int)a3 andOwningView:(id)a4
{
  if (dword_268147F88 <= 800 && (dword_268147F88 != -1 || sub_226865630((uint64_t)&dword_268147F88, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147F88, (uint64_t)"-[NetTopoAirPortDeviceLayer initNetTopoAirPortDeviceLayerCommonWithStyle:andOwningView:]", 800, (uint64_t)"%@\n", v4, v5, v6, v7, (uint64_t)self);
  }
}

- (NetTopoAirPortDeviceLayer)initWithUIStyle:(int)a3 andOwningView:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)NetTopoAirPortDeviceLayer;
  uint64_t v6 = -[NetTopoObjectLayer initWithUIStyle:andOwningView:](&v10, sel_initWithUIStyle_andOwningView_);
  v8 = v6;
  if (v6) {
    objc_msgSend_initNetTopoAirPortDeviceLayerCommonWithStyle_andOwningView_(v6, v7, v5, a4);
  }
  return v8;
}

- (void)dealloc
{
  if (dword_268147F88 <= 800 && (dword_268147F88 != -1 || sub_226865630((uint64_t)&dword_268147F88, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147F88, (uint64_t)"-[NetTopoAirPortDeviceLayer dealloc]", 800, (uint64_t)"%@\n", v2, v3, v4, v5, (uint64_t)self);
  }
  v7.receiver = self;
  v7.super_class = (Class)NetTopoAirPortDeviceLayer;
  [(NetTopoObjectLayer *)&v7 dealloc];
}

- (id)description
{
  uint64_t v4 = objc_msgSend_associatedNode(self, a2, v2);
  objc_super v7 = objc_msgSend_info(v4, v5, v6);
  v9 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v8, (uint64_t)&stru_26DA6BE88);
  objc_super v10 = (objc_class *)objc_opt_class();
  Name = class_getName(v10);
  uint64_t v14 = objc_msgSend_retainCount(self, v12, v13);
  uint64_t v16 = objc_msgSend_objectForKey_(v7, v15, @"name");
  uint64_t v19 = objc_msgSend_row(self, v17, v18);
  uint64_t v22 = objc_msgSend_column(self, v20, v21);
  objc_msgSend_appendFormat_(v9, v23, @"<%s: %p retains %d> ('%@' row=%d col=%d)", Name, self, v14, v16, v19, v22);
  return v9;
}

- (id)debugDescription
{
  uint64_t v4 = objc_msgSend_description(self, a2, v2);
  if (objc_msgSend_parent(self, v5, v6))
  {
    uint64_t v9 = objc_msgSend_parent(self, v7, v8);
    objc_msgSend_appendFormat_(v4, v10, @" connected upstream through %@", v9);
    uint64_t v13 = objc_msgSend_parent(self, v11, v12);
    if (objc_msgSend_parent(v13, v14, v15))
    {
      uint64_t v18 = objc_msgSend_parent(self, v16, v17);
      uint64_t v21 = objc_msgSend_parent(v18, v19, v20);
      objc_msgSend_appendFormat_(v4, v22, @" to device %@\n", v21);
    }
  }
  return v4;
}

- (void)layoutSublayers
{
  v2.receiver = self;
  v2.super_class = (Class)NetTopoAirPortDeviceLayer;
  [(NetTopoObjectLayer *)&v2 layoutSublayers];
}

- (void)pickCorrectImagesForContentsScale:(double)a3
{
  if (!self->super._topoStyle)
  {
    uint64_t v6 = objc_msgSend_associatedNode(self, a2, v3);
    CFStringRef v9 = (const __CFString *)objc_msgSend_info(v6, v7, v8);
    CFStringRef v17 = sub_22685AB94(v9, v10, v11, v12, v13, v14, v15, v16);
    CFStringRef v25 = sub_22685BA14(v9, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v33 = sub_22685AB68((uint64_t)v9, v26, v27, v28, v29, v30, v31, v32);
    uint64_t v35 = objc_msgSend_imageForBaseStationWithProductID_subProductID_deviceKind_small_cropped_threeDee_(ImageStore, v34, (uint64_t)v17, v25, v33, 0, 1, 1);
    uint64_t v37 = objc_msgSend_cgImageFromImage_forContentsScale_(ImageStore, v36, v35, a3);
    objc_msgSend_setObjectImage_(self, v38, v37);
  }
  v39.receiver = self;
  v39.super_class = (Class)NetTopoAirPortDeviceLayer;
  [(NetTopoObjectLayer *)&v39 pickCorrectImagesForContentsScale:a3];
}

- (void)setAssociatedNode:(id)a3
{
  if (self->super._associatedNode != a3)
  {
    id v5 = a3;

    self->super._associatedNode = a3;
  }
  if (a3)
  {
    uint64_t v6 = NSString;
    objc_super v7 = objc_msgSend_info(a3, a2, (uint64_t)a3);
    uint64_t v9 = objc_msgSend_objectForKey_(v7, v8, @"name");
    uint64_t v11 = objc_msgSend_stringWithFormat_(v6, v10, @"%@", v9);
    objc_msgSend_setLabel_(self, v12, v11);
    if (objc_msgSend_configReadStatus(a3, v13, v14) != 1)
    {
      CFStringRef v17 = objc_msgSend_info(a3, v15, v16);
      uint64_t v19 = objc_msgSend_objectForKey_(v17, v18, @"syAP");
      unsigned int v22 = objc_msgSend_integerValue(v19, v20, v21);
      uint64_t v25 = objc_msgSend_info(a3, v23, v24);
      int v33 = sub_22685AB68(v25, v26, v27, v28, v29, v30, v31, v32);
      v34 = sub_22685D7D0(v22, v33, 0);
      objc_msgSend_setSecondaryLabel_(self, v35, (uint64_t)v34);
    }
    objc_msgSend_contentsScale(self, v15, v16);
    objc_msgSend_pickCorrectImagesForContentsScale_(self, v36, v37);
  }

  objc_msgSend_setNeedsLayout(self, a2, (uint64_t)a3);
}

- ($E32549A47AE6FE03C4AA404FAEB37148)getConnectionAttachmentLocations
{
  objc_msgSend_layoutSublayers(self, a3, v3);
  v6.receiver = self;
  v6.super_class = (Class)NetTopoAirPortDeviceLayer;
  return ($E32549A47AE6FE03C4AA404FAEB37148 *)[($E32549A47AE6FE03C4AA404FAEB37148 *)&v6 getConnectionAttachmentLocations];
}

@end