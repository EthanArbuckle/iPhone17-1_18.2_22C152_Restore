@interface CBAODFlipBookWrapper
- ($ADF2D17A2D0006A1E21E182AFD270E1C)header;
- ($CF8CF2FF0B5357CD1F3E02AFCBB5A068)origin;
- (BOOL)getEntry:(id *)a3 forID:(int64_t)a4;
- (BOOL)isValidEntryID:(int64_t)a3;
- (CBAODFlipBookWrapper)initWithHeader:(id *)a3 andOrigin:(id *)a4;
- (double)submissionTimestamp;
- (id)description;
- (id)newFlipBookData;
- (unint64_t)entryCount;
- (void)appendFlipBookEntry:(id *)a3;
- (void)dealloc;
- (void)setSubmissionTimestamp:(double)a3;
@end

@implementation CBAODFlipBookWrapper

- (CBAODFlipBookWrapper)initWithHeader:(id *)a3 andOrigin:(id *)a4
{
  v13 = (char *)self;
  SEL v12 = a2;
  v11 = a3;
  v10 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CBAODFlipBookWrapper;
  v13 = [(CBAODFlipBookWrapper *)&v9 init];
  if (v13)
  {
    v4 = v13;
    *(_OWORD *)(v13 + 24) = *(_OWORD *)&a3->var0;
    *(void *)(v4 + 39) = *(void *)((char *)&a3->var3 + 3);
    memcpy(v13 + 48, a4, 0x4CuLL);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v13 + 1) = v5;
  }
  return (CBAODFlipBookWrapper *)v13;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBAODFlipBookWrapper;
  [(CBAODFlipBookWrapper *)&v2 dealloc];
}

- (id)description
{
  v26 = self;
  SEL v25 = a2;
  id v24 = (id)NSString;
  uint64_t v3 = objc_opt_class();
  double v4 = *(float *)((char *)&v26->_header.numberOfUpdates + 3);
  unsigned int v5 = *(unsigned __int16 *)((char *)&v26->_header.numberOfUpdates + 1);
  double v6 = *(float *)((char *)&v26->_header.frequency + 3);
  uint64_t v7 = [(NSMutableArray *)v26->_flipBookData count];
  double ambient = v26->_header.ambient;
  double brightness = v26->_origin.brightness;
  double brightnessLimit = v26->_origin.brightnessLimit;
  double v11 = v26->_origin.whitepoint.matrix[2][2];
  double x = v26->_origin.whitepoint.xy.x;
  double y = v26->_origin.whitepoint.xy.y;
  double pccFactor = v26->_origin.pccFactor;
  double twilightStrength = v26->_origin.twilightStrength;
  twilightLudouble x = v26->_origin.twilightLux;
  double ammoliteStrength = v26->_origin.ammoliteStrength;
  double v18 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 5);
  double v19 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 52);
  double v20 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 47);
  double v21 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 57);
  double v22 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 61);
  double v23 = *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 66);
  return (id)objc_msgSend(v24, "stringWithFormat:", @"%@:\nheader  lenght=%f | freq=%u | ambient=%f | count=%lu \norigin  SDR=%f | limit=%f | pcc=%f | wp.x=%f | wp.y=%f | wp.Y=%f | twl = %f | twlLudouble x = %f | aml = %f | amlLudouble x = %f\nfinal   SDR=%f | limit=%f | pcc=%f | twl = %f | twlLudouble x = %f | aml = %f | amlLudouble x = %f", v3, *(void *)&v4, v5, *(void *)&v6, v7, *(void *)&ambient, *(void *)&brightness, *(void *)&brightnessLimit, *(void *)&v11, *(void *)&x, *(void *)&y, *(void *)&pccFactor, *(void *)&twilightStrength, *(void *)&twilightLux, *(void *)&ammoliteStrength, *(void *)&v18,
               *(void *)&v19,
               *(void *)&v20,
               *(void *)&v21,
               *(void *)&v22,
               *(void *)&v23,
               *(float *)(objc_msgSend((id)-[NSMutableArray lastObject](v26->_flipBookData, "lastObject"), "entry") + 70));
}

- (void)appendFlipBookEntry:(id *)a3
{
  objc_super v9 = self;
  SEL v8 = a2;
  uint64_t v7 = a3;
  a3->var0 = [(NSMutableArray *)self->_flipBookData count];
  double v6 = 0;
  double v4 = [CBAODFlipBookEntryWrapper alloc];
  memcpy(__dst, v7, sizeof(__dst));
  double v6 = [(CBAODFlipBookEntryWrapper *)v4 initWithFlipBookEntry:__dst];
  [(NSMutableArray *)v9->_flipBookData addObject:v6];

  unsigned int v3 = [(NSMutableArray *)v9->_flipBookData count];
  *(unsigned int *)((char *)&v9->_header.sizeOfEntry + 1) = v3;
}

- (BOOL)getEntry:(id *)a3 forID:(int64_t)a4
{
  BOOL v6 = 0;
  if ([(CBAODFlipBookWrapper *)self isValidEntryID:a4])
  {
    __src = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_flipBookData, "objectAtIndex:", a4), "entry");
    if (__src)
    {
      memcpy(a3, __src, 0x4FuLL);
      return 1;
    }
  }
  return v6;
}

- (id)newFlipBookData
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v4 appendBytes:&self->_header length:23];
  for (int i = 0; i < (unint64_t)[(NSMutableArray *)self->_flipBookData count]; ++i)
    objc_msgSend(v4, "appendData:", objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_flipBookData, "objectAtIndexedSubscript:", i), "entryData"));
  return v4;
}

- (unint64_t)entryCount
{
  return [(NSMutableArray *)self->_flipBookData count];
}

- (BOOL)isValidEntryID:(int64_t)a3
{
  BOOL v4 = 0;
  if (a3 >= 0) {
    return a3 < (unint64_t)[(NSMutableArray *)self->_flipBookData count];
  }
  return v4;
}

- ($ADF2D17A2D0006A1E21E182AFD270E1C)header
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var6;
  *(void *)((char *)&retstr->var3 + 3) = *(void *)((char *)&self[1].var2 + 3);
  return self;
}

- ($CF8CF2FF0B5357CD1F3E02AFCBB5A068)origin
{
  return ($CF8CF2FF0B5357CD1F3E02AFCBB5A068 *)memcpy(retstr, &self->_header.ambient, sizeof($CF8CF2FF0B5357CD1F3E02AFCBB5A068));
}

- (double)submissionTimestamp
{
  return self->_submissionTimestamp;
}

- (void)setSubmissionTimestamp:(double)a3
{
  self->_submissionTimestamp = a3;
}

@end