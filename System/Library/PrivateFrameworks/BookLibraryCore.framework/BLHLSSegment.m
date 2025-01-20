@interface BLHLSSegment
- (BLHLSKey)key;
- (BLHLSMap)map;
- (BLHLSSegment)initWithURL:(id)a3 duration:(double)a4 map:(id)a5 key:(id)a6;
- (NSURL)url;
- (double)duration;
- (id)description;
@end

@implementation BLHLSSegment

- (BLHLSSegment)initWithURL:(id)a3 duration:(double)a4 map:(id)a5 key:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BLHLSSegment;
  v14 = [(BLHLSSegment *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_url, a3);
    v15->_duration = a4;
    objc_storeStrong((id *)&v15->_map, a5);
    objc_storeStrong((id *)&v15->_key, a6);
  }

  return v15;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_url(self, a2, v2, v3);
  v7 = NSNumber;
  objc_msgSend_duration(self, v8, v9, v10);
  v14 = objc_msgSend_numberWithDouble_(v7, v11, v12, v13);
  v21 = objc_msgSend_map(self, v15, v16, v17);
  if (v21) {
    v22 = @" Map: ";
  }
  else {
    v22 = &stru_26CED4330;
  }
  uint64_t v23 = objc_msgSend_map(self, v18, v19, v20);
  v26 = (void *)v23;
  if (v23) {
    objc_msgSend_stringWithFormat_(v5, v24, @"%@ (%@s)%@%@", v25, v6, v14, v22, v23);
  }
  else {
  v27 = objc_msgSend_stringWithFormat_(v5, v24, @"%@ (%@s)%@%@", v25, v6, v14, v22, &stru_26CED4330);
  }

  return v27;
}

- (BLHLSMap)map
{
  return self->_map;
}

- (NSURL)url
{
  return self->_url;
}

- (double)duration
{
  return self->_duration;
}

- (BLHLSKey)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_map, 0);
}

@end