@interface ImageStore
+ (CGImage)cgImageFromImage:(id)a3 forContentsScale:(double)a4;
+ (double)informationDiagramBaseImageCenterOffset:(unsigned int)a3 small:(BOOL)a4;
+ (double)informationDiagramBaseImageRightEdgeInset:(unsigned int)a3 small:(BOOL)a4;
+ (id)imageForBaseStationWithProductID:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 small:(BOOL)a6 cropped:(BOOL)a7 threeDee:(BOOL)a8;
+ (id)imageForInformationalDiagram:(unsigned int)a3;
+ (id)imageForInformationalDiagram:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 audioImage:(BOOL)a6 small:(BOOL)a7;
+ (id)imageForInformationalDiagramNamed:(id)a3 small:(BOOL)a4;
+ (id)imageNameForInformationalDiagram:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 audioImage:(BOOL)a6 small:(BOOL)a7 useDataCache:(BOOL *)a8;
+ (id)imageNameForProductID:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 small:(BOOL)a6 cropped:(BOOL)a7 threeDee:(BOOL)a8;
+ (id)imageNamed:(id)a3;
+ (id)imageNamed:(id)a3 inBundle:(id)a4;
+ (id)imageNamed:(id)a3 inBundle:(id)a4 ofType:(id)a5;
+ (id)insetImageForInformationalDiagram:(unsigned int)a3;
+ (id)insetImageForInformationalDiagram:(unsigned int)a3 deviceKind:(int)a4 audioImage:(BOOL)a5 small:(BOOL)a6;
+ (id)kitImageOfType:(int64_t)a3;
+ (id)sharedImageStore;
@end

@implementation ImageStore

+ (id)kitImageOfType:(int64_t)a3
{
  v3 = @"UIPreferencesWhiteCheck.png";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    v4 = @"UIPreferencesBlueCheck.png";
  }
  else {
    v4 = v3;
  }
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F1C6B0], sel_kitImageNamed_, v4);
}

+ (id)sharedImageStore
{
  id result = (id)qword_268148260;
  if (!qword_268148260)
  {
    id result = objc_alloc_init((Class)objc_opt_class());
    qword_268148260 = (uint64_t)result;
  }
  return result;
}

+ (id)imageNamed:(id)a3
{
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  uint64_t v9 = objc_msgSend_bundleForClass_(v5, v7, v6);

  return (id)objc_msgSend_imageNamed_inBundle_(v4, v8, (uint64_t)a3, v9);
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  uint64_t v6 = objc_msgSend_pathExtension(a3, a2, (uint64_t)a3);
  uint64_t v9 = objc_msgSend_stringByDeletingPathExtension(a3, v7, v8);
  id result = (id)objc_msgSend_imageNamed_inBundle_ofType_(ImageStore, v10, v9, a4, v6);
  if (!result)
  {
    if (sub_22690552C(a3, v12, v13, v14, v15, v16, v17, v18))
    {
      id result = (id)sub_226905510();
      if (result)
      {
        return (id)objc_msgSend_imageNamed_inBundle_ofType_(ImageStore, v19, v9, result, v6);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 ofType:(id)a5
{
  return (id)objc_msgSend_imageNamed_inBundle_(MEMORY[0x263F1C6B0], a2, (uint64_t)a3, a4, a5);
}

+ (id)imageNameForProductID:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 small:(BOOL)a6 cropped:(BOOL)a7 threeDee:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v12 = *(void *)&a3;
  switch(sub_22683C4F8(*(uint64_t *)&a3))
  {
    case 3u:
      uint64_t v14 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v13, @"AirPortExtremeG");
      goto LABEL_11;
    case 4u:
      uint64_t v14 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v13, @"AirPortExpress");
      goto LABEL_11;
    case 5u:
      uint64_t v14 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v13, @"AirPortExtremeN");
      goto LABEL_11;
    case 6u:
      uint64_t v14 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v13, @"TimeCapsule");
      goto LABEL_11;
    case 7u:
    case 8u:
      uint64_t v14 = objc_msgSend_stringWithFormat_(MEMORY[0x263F089D8], v13, @"AirPort-%d", 8);
      goto LABEL_11;
    case 0xAu:
      uint64_t v14 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v13, @"AirPortEx");
      goto LABEL_11;
    default:
      if (v12)
      {
        uint64_t v14 = objc_msgSend_stringWithFormat_(MEMORY[0x263F089D8], v13, @"%d", v12);
LABEL_11:
        uint64_t v15 = (void *)v14;
        goto LABEL_12;
      }
      if ((a5 - 3) >= 2)
      {
        if (a5 == 2) {
          uint64_t v14 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v13, @"GenericAirPlay");
        }
        else {
          uint64_t v14 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v13, @"GenericBase");
        }
        goto LABEL_11;
      }
      uint64_t v15 = 0;
LABEL_12:
      if (v8) {
        objc_msgSend_appendString_(v15, v13, @"-3D");
      }
      else {
        objc_msgSend_appendString_(v15, v13, @"-2D");
      }
      if (v9)
      {
        if (v10) {
          objc_msgSend_appendString_(v15, v16, @"-cropped");
        }
        else {
          objc_msgSend_appendString_(v15, v16, @"-reflected");
        }
      }
      objc_msgSend_appendString_(v15, v16, @".png");
      if (dword_268146528 <= 800 && (dword_268146528 != -1 || sub_226865630((uint64_t)&dword_268146528, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268146528, (uint64_t)"+[ImageStore imageNameForProductID:subProductID:deviceKind:small:cropped:threeDee:]", 800, (uint64_t)"constructed image name '%@'\n", v17, v18, v19, v20, (uint64_t)v15);
      }
      return v15;
  }
}

+ (id)imageForInformationalDiagram:(unsigned int)a3
{
  return (id)objc_msgSend_imageForInformationalDiagram_subProductID_deviceKind_audioImage_small_(ImageStore, a2, *(uint64_t *)&a3, 0, 1, 0, 0);
}

+ (id)imageForInformationalDiagram:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 audioImage:(BOOL)a6 small:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  char v27 = 0;
  do
  {
    uint64_t v12 = objc_msgSend_imageNameForInformationalDiagram_subProductID_deviceKind_audioImage_small_useDataCache_(ImageStore, a2, v11, v10, v9, v8, v7, &v27);
    if (v27)
    {
      uint64_t v13 = sub_226905510();
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x263F086E0];
      uint64_t v15 = objc_opt_class();
      uint64_t v13 = objc_msgSend_bundleForClass_(v14, v16, v15);
    }
    uint64_t v17 = v13;
    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_imageNamed_inBundle_(v18, v19, v12, v17);
    v25 = (void *)v20;
    if (!v11) {
      break;
    }
    uint64_t v11 = 0;
  }
  while (!v20);
  if (dword_268146528 <= 800 && (dword_268146528 != -1 || sub_226865630((uint64_t)&dword_268146528, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146528, (uint64_t)"+[ImageStore imageForInformationalDiagram:subProductID:deviceKind:audioImage:small:]", 800, (uint64_t)"returning image %@\n", v21, v22, v23, v24, (uint64_t)v25);
  }
  return v25;
}

+ (double)informationDiagramBaseImageCenterOffset:(unsigned int)a3 small:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    double v5 = 0.539473712;
  }
  else {
    double v5 = 0.545454562;
  }
  switch(sub_22683C4F8(*(uint64_t *)&a3))
  {
    case 3u:
      BOOL v6 = !v4;
      double v7 = 0.55799371;
      double v8 = 0.552631557;
      goto LABEL_10;
    case 4u:
      BOOL v6 = !v4;
      double v7 = 0.492163002;
      double v8 = 0.491228074;
      goto LABEL_10;
    case 5u:
      BOOL v6 = !v4;
      double v7 = 0.50470221;
      double v8 = 0.495614022;
      goto LABEL_10;
    case 6u:
    case 0xAu:
      BOOL v6 = !v4;
      double v7 = 0.470219433;
      double v8 = 0.469298244;
      goto LABEL_10;
    case 7u:
    case 8u:
      BOOL v6 = !v4;
      double v7 = 0.420062691;
      double v8 = 0.412280709;
LABEL_10:
      if (v6) {
        double v5 = v7;
      }
      else {
        double v5 = v8;
      }
      break;
    default:
      return v5;
  }
  return v5;
}

+ (double)informationDiagramBaseImageRightEdgeInset:(unsigned int)a3 small:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    double v5 = 16.0;
  }
  else {
    double v5 = 23.0;
  }
  switch(sub_22683C4F8(*(uint64_t *)&a3))
  {
    case 3u:
      BOOL v6 = !v4;
      double v7 = 13.0;
      double v8 = 9.0;
      goto LABEL_11;
    case 4u:
      BOOL v6 = !v4;
      double v7 = 54.0;
      double v8 = 38.5;
      goto LABEL_11;
    case 5u:
      BOOL v6 = !v4;
      double v7 = 23.5;
      double v8 = 16.5;
      goto LABEL_11;
    case 6u:
      BOOL v6 = !v4;
      double v7 = 16.0;
      double v8 = 11.5;
      goto LABEL_11;
    case 7u:
    case 8u:
      BOOL v6 = !v4;
      double v7 = 72.5;
      double v8 = 52.5;
      goto LABEL_11;
    case 0xAu:
      BOOL v6 = !v4;
      double v7 = 48.0;
      double v8 = 35.0;
LABEL_11:
      if (v6) {
        double v5 = v7;
      }
      else {
        double v5 = v8;
      }
      break;
    default:
      return v5;
  }
  return v5;
}

+ (id)imageForInformationalDiagramNamed:(id)a3 small:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = objc_opt_class();
  if (v4) {
    a3 = (id)objc_msgSend_stringWithFormat_(NSString, v6, @"%@-Small", a3);
  }

  return (id)objc_msgSend_imageNamed_(v7, v6, (uint64_t)a3);
}

+ (id)imageNameForInformationalDiagram:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 audioImage:(BOOL)a6 small:(BOOL)a7 useDataCache:(BOOL *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v12 = *(void *)&a3;
  int v13 = sub_22683C4F8(*(uint64_t *)&a3);
  if (a8) {
    *a8 = 0;
  }
  switch(v13)
  {
    case 3:
      uint64_t v15 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v14, @"AirPort-Extreme-G");
      goto LABEL_19;
    case 4:
      uint64_t v16 = (void *)MEMORY[0x263F089D8];
      uint64_t v17 = @"AirPort-Express";
      uint64_t v18 = @"AirPort-Express-Audio";
      goto LABEL_16;
    case 5:
      uint64_t v15 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v14, @"AirPort-Extreme");
      goto LABEL_19;
    case 6:
      uint64_t v15 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v14, @"Time-Capsule");
      goto LABEL_19;
    case 7:
    case 8:
      uint64_t v15 = objc_msgSend_stringWithFormat_(MEMORY[0x263F089D8], v14, @"AirPort-%d", 8);
      goto LABEL_19;
    case 10:
      uint64_t v16 = (void *)MEMORY[0x263F089D8];
      uint64_t v17 = @"AirPortEx";
      uint64_t v18 = @"AirPortEx-Audio";
LABEL_16:
      if (v10) {
        uint64_t v15 = objc_msgSend_stringWithString_(v16, v14, (uint64_t)v18);
      }
      else {
        uint64_t v15 = objc_msgSend_stringWithString_(v16, v14, (uint64_t)v17);
      }
      goto LABEL_19;
    default:
      if (v12)
      {
        uint64_t v19 = sub_226905510();
        if (a8) {
          *a8 = v19 != 0;
        }
        if (v19)
        {
          uint64_t v20 = v10
              ? objc_msgSend_stringWithFormat_(MEMORY[0x263F089D8], v14, @"%d%s%s%s%s", v12, "-", "Info", "-", "Audio"): objc_msgSend_stringWithFormat_(MEMORY[0x263F089D8], v14, @"%d%s%s", v12, "-", "Info");
          uint64_t v21 = (void *)v20;
          if (v20) {
            goto LABEL_20;
          }
        }
      }
      if ((a5 - 2) >= 2)
      {
        if (a5 == 1) {
          uint64_t v15 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v14, @"Unknown-Device");
        }
        else {
          uint64_t v15 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v14, @"Generic-Router");
        }
      }
      else
      {
        uint64_t v15 = objc_msgSend_stringWithString_(MEMORY[0x263F089D8], v14, @"Generic-AirPlay");
      }
LABEL_19:
      uint64_t v21 = (void *)v15;
LABEL_20:
      if (v9) {
        objc_msgSend_appendString_(v21, v14, @"-Small");
      }
      objc_msgSend_appendString_(v21, v14, @".png");
      return v21;
  }
}

+ (id)insetImageForInformationalDiagram:(unsigned int)a3
{
  return (id)objc_msgSend_insetImageForInformationalDiagram_deviceKind_audioImage_small_(ImageStore, a2, *(uint64_t *)&a3, 1, 0, 0);
}

+ (id)insetImageForInformationalDiagram:(unsigned int)a3 deviceKind:(int)a4 audioImage:(BOOL)a5 small:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v9 = *(void *)&a3;
  BOOL v10 = (void *)MEMORY[0x263F086E0];
  uint64_t v11 = objc_opt_class();
  uint64_t v13 = objc_msgSend_bundleForClass_(v10, v12, v11);
  unsigned int v14 = sub_22683C4F8(v9);
  int v16 = sub_22683C4C8(v9);
  if (v14 <= 0xA)
  {
    if (((1 << v14) & 0x1A0) != 0)
    {
      uint64_t v17 = (void *)MEMORY[0x263F089D8];
LABEL_7:
      uint64_t v20 = @"Inset-Regular-WAN";
      uint64_t v21 = @"Inset-Regular-Ethernet";
      goto LABEL_8;
    }
    if (((1 << v14) & 0x410) != 0)
    {
      uint64_t v17 = (void *)MEMORY[0x263F089D8];
      if (v7)
      {
LABEL_5:
        uint64_t v18 = objc_msgSend_stringWithString_(v17, v15, @"Inset-Regular-Audio");
        goto LABEL_11;
      }
      goto LABEL_7;
    }
    if (v14 == 6)
    {
      uint64_t v17 = (void *)MEMORY[0x263F089D8];
      uint64_t v20 = @"Inset-Time-Capsule-WAN";
      uint64_t v21 = @"Inset-Time-Capsule-Ethernet";
LABEL_8:
      if (v16 == 1) {
        uint64_t v18 = objc_msgSend_stringWithString_(v17, v15, (uint64_t)v21);
      }
      else {
        uint64_t v18 = objc_msgSend_stringWithString_(v17, v15, (uint64_t)v20);
      }
LABEL_11:
      uint64_t v22 = (void *)v18;
      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  uint64_t v25 = sub_226905510();
  if (!v25)
  {
    uint64_t v17 = (void *)MEMORY[0x263F089D8];
    if ((a4 & 0xFFFFFFFE) == 2) {
      goto LABEL_5;
    }
    goto LABEL_7;
  }
  uint64_t v26 = v25;
  if (v7) {
    uint64_t v27 = objc_msgSend_stringWithFormat_(MEMORY[0x263F089D8], v15, @"%d%s%s%s%s", v9, "-", "Inset", "-", "Audio");
  }
  else {
    uint64_t v27 = objc_msgSend_stringWithFormat_(MEMORY[0x263F089D8], v15, @"%d%s%s", v9, "-", "Inset");
  }
  uint64_t v22 = (void *)v27;
  uint64_t v13 = v26;
  if (!v6) {
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend_appendString_(v22, v19, @"-Small");
LABEL_13:
  NSLog(&cfstr_InsetImageName.isa, v22);

  return (id)objc_msgSend_imageNamed_inBundle_ofType_(ImageStore, v23, (uint64_t)v22, v13, @"png");
}

+ (id)imageForBaseStationWithProductID:(unsigned int)a3 subProductID:(unsigned int)a4 deviceKind:(int)a5 small:(BOOL)a6 cropped:(BOOL)a7 threeDee:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  do
  {
    uint64_t v14 = objc_msgSend_imageNameForProductID_subProductID_deviceKind_small_cropped_threeDee_(ImageStore, a2, v13, v12, v11, v10, v9, v8);
    uint64_t v15 = objc_opt_class();
    int v16 = (void *)MEMORY[0x263F086E0];
    uint64_t v17 = objc_opt_class();
    uint64_t v19 = objc_msgSend_bundleForClass_(v16, v18, v17);
    uint64_t v21 = objc_msgSend_imageNamed_inBundle_(v15, v20, v14, v19);
    uint64_t v26 = (void *)v21;
    if (!v13) {
      break;
    }
    uint64_t v13 = 0;
  }
  while (!v21);
  if (dword_268146528 <= 800 && (dword_268146528 != -1 || sub_226865630((uint64_t)&dword_268146528, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146528, (uint64_t)"+[ImageStore imageForBaseStationWithProductID:subProductID:deviceKind:small:cropped:threeDee:]", 800, (uint64_t)"returning image %@\n", v22, v23, v24, v25, (uint64_t)v26);
  }
  return v26;
}

+ (CGImage)cgImageFromImage:(id)a3 forContentsScale:(double)a4
{
  if (dword_268146528 <= 800 && (dword_268146528 != -1 || sub_226865630((uint64_t)&dword_268146528, 0x320u)))
  {
    objc_msgSend_size(a3, a2, (uint64_t)a3);
    uint64_t v6 = v5;
    objc_msgSend_size(a3, v7, v8);
    objc_msgSend_scale(a3, v9, v10);
    sub_226865EB4((uint64_t)&dword_268146528, (uint64_t)"+[ImageStore cgImageFromImage:forContentsScale:]", 800, (uint64_t)"image width = %.1f  height = %.1f  scale = %.1f\n", v11, v12, v13, v14, v6);
  }
  uint64_t v19 = (CGImage *)objc_msgSend_CGImage(a3, a2, (uint64_t)a3);
  if (dword_268146528 <= 800 && (dword_268146528 != -1 || sub_226865630((uint64_t)&dword_268146528, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268146528, (uint64_t)"+[ImageStore cgImageFromImage:forContentsScale:]", 800, (uint64_t)"returning cgImage %@\n", v15, v16, v17, v18, (uint64_t)v19);
  }
  return v19;
}

@end