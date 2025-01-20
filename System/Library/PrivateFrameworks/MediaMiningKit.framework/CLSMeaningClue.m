@interface CLSMeaningClue
- (CLSMeaningClue)init;
- (id)relatedData;
- (void)setRelatedData:(id)a3;
@end

@implementation CLSMeaningClue

- (void).cxx_destruct
{
}

- (void)setRelatedData:(id)a3
{
}

- (id)relatedData
{
  return objc_getProperty(self, a2, 96, 1);
}

- (CLSMeaningClue)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSMeaningClue;
  v2 = [(CLSClue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    id relatedData = v2->_relatedData;
    v2->_id relatedData = 0;
  }
  return v3;
}

@end