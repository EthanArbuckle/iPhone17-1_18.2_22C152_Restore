@interface HMIVideoAnnotationParserTrack
- (Class)eventClass;
- (HMIVideoAnnotationParserTrack)initWithEventClass:(Class)a3 records:(id)a4 UUID:(id)a5;
- (NSArray)records;
- (NSUUID)UUID;
@end

@implementation HMIVideoAnnotationParserTrack

- (HMIVideoAnnotationParserTrack)initWithEventClass:(Class)a3 records:(id)a4 UUID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMIVideoAnnotationParserTrack;
  v11 = [(HMIVideoAnnotationParserTrack *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_eventClass, a3);
    objc_storeStrong((id *)&v12->_records, a4);
    objc_storeStrong((id *)&v12->_UUID, a5);
  }

  return v12;
}

- (Class)eventClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)records
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_eventClass, 0);
}

@end