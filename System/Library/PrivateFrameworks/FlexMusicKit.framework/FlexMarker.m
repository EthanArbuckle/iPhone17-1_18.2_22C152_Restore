@interface FlexMarker
- (FlexMarker)init;
- (FlexMarker)initWithDictionary:(id)a3;
- (FlexMarker)initWithName:(id)a3 markerID:(int64_t)a4 position:(int64_t)a5;
- (NSString)name;
- (id)description;
- (id)encodeAsDictionary;
- (int64_t)markerID;
- (int64_t)number;
- (int64_t)position;
- (unint64_t)_decodeTypeAndBarsFromName;
- (unint64_t)type;
@end

@implementation FlexMarker

- (FlexMarker)initWithName:(id)a3 markerID:(int64_t)a4 position:(int64_t)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FlexMarker;
  v10 = [(FlexMarker *)&v18 init];
  v11 = v10;
  if (v10
    && (objc_storeStrong((id *)&v10->_name, a3),
        v11->_markerID = a4,
        v11->_position = a5,
        !objc_msgSend__decodeTypeAndBarsFromName(v11, v12, v13, v14, v15)))
  {
    v16 = 0;
  }
  else
  {
    v16 = v11;
  }

  return v16;
}

- (FlexMarker)initWithDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FlexMarker;
  v8 = [(FlexMarker *)&v32 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_objectForKey_(v4, v5, @"name", v6, v7);
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v14 = objc_msgSend_objectForKey_(v4, v11, @"id", v12, v13);
    v8->_markerID = objc_msgSend_integerValue(v14, v15, v16, v17, v18);

    v22 = objc_msgSend_objectForKey_(v4, v19, @"position", v20, v21);
    v8->_position = objc_msgSend_longLongValue(v22, v23, v24, v25, v26);

    objc_msgSend__decodeTypeAndBarsFromName(v8, v27, v28, v29, v30);
  }

  return v8;
}

- (id)encodeAsDictionary
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  v11 = objc_msgSend_name(self, v7, v8, v9, v10);
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, @"name", v13);

  uint64_t v14 = NSNumber;
  uint64_t v19 = objc_msgSend_markerID(self, v15, v16, v17, v18);
  v23 = objc_msgSend_numberWithInteger_(v14, v20, v19, v21, v22);
  objc_msgSend_setValue_forKey_(v6, v24, (uint64_t)v23, @"id", v25);

  uint64_t v26 = NSNumber;
  uint64_t v31 = objc_msgSend_position(self, v27, v28, v29, v30);
  v35 = objc_msgSend_numberWithLongLong_(v26, v32, v31, v33, v34);
  objc_msgSend_setValue_forKey_(v6, v36, (uint64_t)v35, @"position", v37);

  return v6;
}

- (FlexMarker)init
{
  v3.receiver = self;
  v3.super_class = (Class)FlexMarker;
  result = [(FlexMarker *)&v3 init];
  if (result)
  {
    result->_type = 0;
    result->_number = 0;
  }
  return result;
}

- (unint64_t)_decodeTypeAndBarsFromName
{
  uint64_t v6 = objc_msgSend_lowercaseString(self->_name, a2, v2, v3, v4);
  char hasPrefix = objc_msgSend_hasPrefix_(v6, v7, @"bars", v8, v9);

  if (hasPrefix)
  {
    unint64_t v15 = 2;
LABEL_5:
    uint64_t v21 = objc_msgSend_scannerWithString_(MEMORY[0x263F08B08], v11, (uint64_t)self->_name, v13, v14);
    uint64_t v26 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], v22, v23, v24, v25);
    objc_msgSend_scanUpToCharactersFromSet_intoString_(v21, v27, (uint64_t)v26, 0, v28);

    int64_t v34 = 0;
    objc_msgSend_scanInteger_(v21, v29, (uint64_t)&v34, v30, v31);
    int64_t v32 = v34;
    self->_type = v15;
    self->_number = v32;

    return self->_type;
  }
  uint64_t v16 = objc_msgSend_lowercaseString(self->_name, v11, v12, v13, v14);
  int v20 = objc_msgSend_hasPrefix_(v16, v17, @"bar", v18, v19);

  if (v20)
  {
    unint64_t v15 = 1;
    goto LABEL_5;
  }
  unint64_t result = 0;
  self->_type = 0;
  return result;
}

- (id)description
{
  if (objc_msgSend_type(self, a2, v2, v3, v4) == 2)
  {
    uint64_t v10 = NSString;
    v11 = objc_msgSend_name(self, v6, v7, v8, v9);
    uint64_t v16 = objc_msgSend_markerID(self, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_position(self, v17, v18, v19, v20);
    uint64_t v55 = objc_msgSend_number(self, v22, v23, v24, v25);
    objc_msgSend_stringWithFormat_(v10, v26, @"NumberOfBars - name: %@ id %ld position %ld # bars %ld", v27, v28, v11, v16, v21, v55);
  }
  else
  {
    uint64_t v29 = objc_msgSend_type(self, v6, v7, v8, v9);
    uint64_t v30 = NSString;
    v11 = objc_msgSend_name(self, v31, v32, v33, v34);
    uint64_t v39 = objc_msgSend_markerID(self, v35, v36, v37, v38);
    uint64_t v44 = objc_msgSend_position(self, v40, v41, v42, v43);
    uint64_t v49 = objc_msgSend_number(self, v45, v46, v47, v48);
    if (v29 == 1) {
      objc_msgSend_stringWithFormat_(v30, v50, @"BarStartPosition - name: %@ id %ld position %ld bar #%ld", v51, v52, v11, v39, v44, v49);
    }
    else {
      objc_msgSend_stringWithFormat_(v30, v50, @"Unknown - name: %@ id %ld position %ld number %ld", v51, v52, v11, v39, v44, v49);
    }
  v53 = };

  return v53;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)markerID
{
  return self->_markerID;
}

- (int64_t)position
{
  return self->_position;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)number
{
  return self->_number;
}

- (void).cxx_destruct
{
}

@end