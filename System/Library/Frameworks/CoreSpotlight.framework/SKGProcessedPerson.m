@interface SKGProcessedPerson
- (SKGPersonComponents)person;
- (SKGProcessedPerson)initWithPerson:(id)a3;
@end

@implementation SKGProcessedPerson

- (SKGProcessedPerson)initWithPerson:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKGProcessedPerson;
  v6 = [(SKGProcessedPerson *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_person, a3);
  }

  return v7;
}

- (SKGPersonComponents)person
{
  return (SKGPersonComponents *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end