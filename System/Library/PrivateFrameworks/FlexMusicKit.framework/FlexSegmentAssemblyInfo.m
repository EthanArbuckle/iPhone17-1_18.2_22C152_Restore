@interface FlexSegmentAssemblyInfo
- (FlexSegment)segment;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)barsUsed;
- (int64_t)duration;
- (int64_t)offset;
- (void)setBarsUsed:(int64_t)a3;
- (void)setDuration:(int64_t)a3;
- (void)setOffset:(int64_t)a3;
- (void)setSegment:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation FlexSegmentAssemblyInfo

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_segment(self, a2, v2, v3, v4);
  v12 = objc_msgSend_name(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_barsUsed(self, v13, v14, v15, v16);
  v22 = objc_msgSend_segment(self, v18, v19, v20, v21);
  uint64_t v27 = objc_msgSend_bars(v22, v23, v24, v25, v26);
  uint64_t v32 = objc_msgSend_duration(self, v28, v29, v30, v31);
  v36 = objc_msgSend_stringWithFormat_(v6, v33, @"segment: %@, barsUsed: %lu (%lu), duration: %1.2f", v34, v35, v12, v17, v27, (float)((float)v32 / 48000.0));

  return v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v18 = objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v18)
  {
    uint64_t v19 = objc_msgSend_segment(self, v14, v15, v16, v17);
    uint64_t v23 = objc_msgSend_copyWithZone_(v19, v20, (uint64_t)a3, v21, v22);
    uint64_t v24 = (void *)v18[1];
    v18[1] = v23;

    v18[2] = objc_msgSend_barsUsed(self, v25, v26, v27, v28);
    v33 = objc_msgSend_url(self, v29, v30, v31, v32);
    uint64_t v37 = objc_msgSend_copyWithZone_(v33, v34, (uint64_t)a3, v35, v36);
    v38 = (void *)v18[3];
    v18[3] = v37;

    v18[4] = objc_msgSend_offset(self, v39, v40, v41, v42);
    v18[5] = objc_msgSend_duration(self, v43, v44, v45, v46);
  }
  return v18;
}

- (FlexSegment)segment
{
  return self->_segment;
}

- (void)setSegment:(id)a3
{
}

- (int64_t)barsUsed
{
  return self->_barsUsed;
}

- (void)setBarsUsed:(int64_t)a3
{
  self->_barsUsed = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (int64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(int64_t)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_segment, 0);
}

@end