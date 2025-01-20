@interface CCIDFiAndDi
+ (NSArray)DIndexes;
+ (NSArray)FIndexes;
+ (id)createWithFIndexDIndex:(unsigned __int8)a3;
+ (id)getDTable;
+ (id)getFTable;
+ (unsigned)Di:(unsigned __int8)a3;
+ (unsigned)Fi:(unsigned __int8)a3;
+ (unsigned)fMax:(unsigned int)a3;
+ (unsigned)fMaxForFDIndex:(unsigned int)a3 Fi:(unsigned int *)a4 Di:(unsigned int *)a5;
- (CCIDFiAndDi)initWithFIndex:(unsigned __int8)a3 DIndex:(unsigned __int8)a4;
- (id)description;
- (unsigned)Di;
- (unsigned)Fi;
- (unsigned)baseBps;
- (unsigned)bpsMax;
- (unsigned)dIndex;
- (unsigned)fIndex;
- (unsigned)fIndexDIndex;
- (unsigned)fMax;
@end

@implementation CCIDFiAndDi

+ (id)getFTable
{
  if (qword_10002C308 != -1) {
    dispatch_once(&qword_10002C308, &stru_100024A50);
  }
  v2 = (void *)qword_10002C300;

  return v2;
}

+ (id)getDTable
{
  if (qword_10002C318 != -1) {
    dispatch_once(&qword_10002C318, &stru_100024A70);
  }
  v2 = (void *)qword_10002C310;

  return v2;
}

+ (NSArray)FIndexes
{
  v2 = +[CCIDFiAndDi getFTable];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

+ (NSArray)DIndexes
{
  v2 = +[CCIDFiAndDi getDTable];
  v3 = [v2 allKeys];

  return (NSArray *)v3;
}

+ (unsigned)Fi:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = +[CCIDFiAndDi getFTable];
  v5 = [v4 allKeys];
  v6 = +[NSNumber numberWithUnsignedChar:v3];
  unsigned __int8 v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    v8 = sub_1000149AC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100019338();
    }
  }
  v9 = +[CCIDFiAndDi getFTable];
  v10 = +[NSNumber numberWithUnsignedChar:v3];
  v11 = [v9 objectForKeyedSubscript:v10];
  v12 = [v11 objectAtIndexedSubscript:0];
  unsigned int v13 = [v12 unsignedIntValue];

  return v13;
}

+ (unsigned)Di:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = +[CCIDFiAndDi getDTable];
  v5 = [v4 allKeys];
  v6 = +[NSNumber numberWithUnsignedChar:v3];
  unsigned __int8 v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    v8 = sub_1000149AC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000193A0();
    }
  }
  v9 = +[CCIDFiAndDi getDTable];
  v10 = +[NSNumber numberWithUnsignedChar:v3];
  v11 = [v9 objectForKeyedSubscript:v10];
  unsigned int v12 = [v11 unsignedIntValue];

  return v12;
}

+ (unsigned)fMaxForFDIndex:(unsigned int)a3 Fi:(unsigned int *)a4 Di:(unsigned int *)a5
{
  char v7 = a3;
  uint64_t v8 = +[CCIDFiAndDi Fi:a3 >> 4];
  unsigned __int8 v9 = +[CCIDFiAndDi Di:v7 & 0xF];
  *a4 = +[CCIDFiAndDi Fi:v8];
  *a5 = +[CCIDFiAndDi Di:v9];

  return +[CCIDFiAndDi fMax:v8];
}

+ (id)createWithFIndexDIndex:(unsigned __int8)a3
{
  uint64_t v3 = [[CCIDFiAndDi alloc] initWithFIndex:a3 >> 4 DIndex:a3 & 0xF];

  return v3;
}

+ (unsigned)fMax:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[CCIDFiAndDi getFTable];
  v5 = [v4 allKeys];
  v6 = +[NSNumber numberWithUnsignedInt:v3];
  unsigned __int8 v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = sub_1000149AC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100019408(v3, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = +[CCIDFiAndDi getFTable];
  v16 = +[NSNumber numberWithUnsignedInt:v3];
  v17 = [v15 objectForKeyedSubscript:v16];
  v18 = [v17 objectAtIndexedSubscript:1];
  [v18 floatValue];
  unsigned int v20 = v19;

  return v20;
}

- (CCIDFiAndDi)initWithFIndex:(unsigned __int8)a3 DIndex:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CCIDFiAndDi;
  v6 = [(CCIDFiAndDi *)&v19 init];
  if (!v6) {
    goto LABEL_5;
  }
  unsigned __int8 v7 = +[CCIDFiAndDi getFTable];
  uint64_t v8 = [v7 allKeys];
  uint64_t v9 = +[NSNumber numberWithUnsignedChar:v5];
  unsigned __int8 v10 = [v8 containsObject:v9];

  if ((v10 & 1) == 0)
  {
    v16 = sub_1000149AC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100019474();
    }

    goto LABEL_12;
  }
  uint64_t v11 = +[CCIDFiAndDi getDTable];
  uint64_t v12 = [v11 allKeys];
  uint64_t v13 = +[NSNumber numberWithUnsignedChar:v4];
  unsigned __int8 v14 = [v12 containsObject:v13];

  if ((v14 & 1) == 0)
  {
    v17 = sub_1000149AC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000193A0();
    }

LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v6->_fIndexDIndex = v4 | (16 * v5);
  v6->_Fi = +[CCIDFiAndDi Fi:v5];
  v6->_Di = +[CCIDFiAndDi Di:v4];
  v6->_fMax = +[CCIDFiAndDi fMax:v5];
LABEL_5:
  v15 = v6;
LABEL_13:

  return v15;
}

- (unsigned)bpsMax
{
  unsigned int v3 = 1000 * [(CCIDFiAndDi *)self fMax];
  unsigned int v4 = [(CCIDFiAndDi *)self Fi];
  return v3 / (v4 / [(CCIDFiAndDi *)self Di]);
}

- (unsigned)baseBps
{
  unsigned int v3 = [(CCIDFiAndDi *)self Fi];
  return 0x3D0900 / (v3 / [(CCIDFiAndDi *)self Di]);
}

- (unsigned)fIndex
{
  return self->_fIndexDIndex >> 4;
}

- (unsigned)dIndex
{
  return self->_fIndexDIndex & 0xF;
}

- (id)description
{
  unsigned int v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"{ index: 0x%.2x ", -[CCIDFiAndDi fIndexDIndex](self, "fIndexDIndex"));
  objc_msgSend(v3, "appendFormat:", @"Di: %2d ", -[CCIDFiAndDi Di](self, "Di"));
  objc_msgSend(v3, "appendFormat:", @"Fi: %4d ", -[CCIDFiAndDi Fi](self, "Fi"));
  objc_msgSend(v3, "appendFormat:", @"(%.3f kbps at 4.0MHz, "), (double)-[CCIDFiAndDi baseBps](self, "baseBps") * 0.001;
  [v3 appendFormat:@"%.3f kbps for fMax: %.1fMHz }"], (double)-[CCIDFiAndDi bpsMax](self, "bpsMax") * 0.001, (double)-[CCIDFiAndDi fMax](self, "fMax") * 0.001);

  return v3;
}

- (unsigned)Di
{
  return self->_Di;
}

- (unsigned)Fi
{
  return self->_Fi;
}

- (unsigned)fMax
{
  return self->_fMax;
}

- (unsigned)fIndexDIndex
{
  return self->_fIndexDIndex;
}

@end