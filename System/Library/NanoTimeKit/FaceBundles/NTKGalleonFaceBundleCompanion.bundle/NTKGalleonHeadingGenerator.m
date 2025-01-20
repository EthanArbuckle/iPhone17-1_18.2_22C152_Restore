@interface NTKGalleonHeadingGenerator
+ (id)_compassDirectionForHeading:(unint64_t)a3;
+ (id)_generateHeadingStrings;
+ (id)sharedGenerator;
- (id)_init;
- (id)stringForHeading:(unint64_t)a3;
@end

@implementation NTKGalleonHeadingGenerator

+ (id)sharedGenerator
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = objc_loadWeakRetained(&qword_2691D5790);
  if (!WeakRetained)
  {
    v4 = [NTKGalleonHeadingGenerator alloc];
    WeakRetained = objc_msgSend__init(v4, v5, v6, v7);
    objc_storeWeak(&qword_2691D5790, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKGalleonHeadingGenerator;
  v5 = [(NTKGalleonHeadingGenerator *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend__generateHeadingStrings(NTKGalleonHeadingGenerator, v2, v3, v4);
    lookup = v5->_lookup;
    v5->_lookup = (NSDictionary *)v6;
  }
  return v5;
}

- (id)stringForHeading:(unint64_t)a3
{
  if (a3 == -1)
  {
    v8 = objc_msgSend_objectForKey_(self->_lookup, a2, (uint64_t)&unk_26FB191E8, v3);
  }
  else
  {
    v5 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, a3 % 0x168, v3);
    v8 = objc_msgSend_objectForKey_(self->_lookup, v6, (uint64_t)v5, v7);
  }

  return v8;
}

+ (id)_generateHeadingStrings
{
  v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3);
  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  v10 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v7, @"GALLEON_HEADING_LABEL_FORMAT", @"%1$@°%2$@");
  for (uint64_t i = 0; i != 360; ++i)
  {
    v12 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v8, i, v9);
    v15 = objc_msgSend__compassDirectionForHeading_(a1, v13, i, v14);
    v18 = objc_msgSend_stringFromNumber_(v6, v16, (uint64_t)v12, v17);
    v21 = objc_msgSend_stringWithFormat_(NSString, v19, (uint64_t)v10, v20, v18, v15);
    objc_msgSend_setObject_forKey_(v5, v22, (uint64_t)v21, (uint64_t)v12);
  }
  v23 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v8, @"GALLEON_UNKNOWN_HEADING", @"—° —");
  objc_msgSend_setObject_forKey_(v5, v24, (uint64_t)v23, (uint64_t)&unk_26FB191E8);
  v28 = objc_msgSend_copy(v5, v25, v26, v27);

  return v28;
}

+ (id)_compassDirectionForHeading:(unint64_t)a3
{
  if (a3 <= 0x16) {
    goto LABEL_2;
  }
  if (a3 > 0x42)
  {
    if (a3 > 0x6F)
    {
      if (a3 > 0x9C)
      {
        if (a3 > 0xC9)
        {
          if (a3 > 0xF6)
          {
            if (a3 > 0x123)
            {
              if (a3 > 0x150)
              {
LABEL_2:
                objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_NORTH", @"N");
                goto LABEL_17;
              }
              objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_NORTHWEST", @"NW");
            }
            else
            {
              objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_WEST", @"W");
            }
          }
          else
          {
            objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_SOUTHWEST", @"SW");
          }
        }
        else
        {
          objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_SOUTH", @"S");
        }
      }
      else
      {
        objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_SOUTHEAST", @"SE");
      }
    }
    else
    {
      objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_EAST", @"E");
    }
  }
  else
  {
    objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, a2, @"GALLEON_LABEL_NORTHEAST", @"NE");
  }
  uint64_t v3 = LABEL_17:;

  return v3;
}

- (void).cxx_destruct
{
}

@end