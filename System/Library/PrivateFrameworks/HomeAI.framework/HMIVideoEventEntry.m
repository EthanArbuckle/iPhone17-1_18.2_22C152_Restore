@interface HMIVideoEventEntry
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (HMIVideoEventEntry)initWithValue:(id)a3 time:(id *)a4;
- (id)value;
@end

@implementation HMIVideoEventEntry

- (HMIVideoEventEntry)initWithValue:(id)a3 time:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoEventEntry;
  v8 = [(HMIVideoEventEntry *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    int64_t var3 = a4->var3;
    *(_OWORD *)&v9->_time.value = *(_OWORD *)&a4->var0;
    v9->_time.epoch = var3;
  }

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end