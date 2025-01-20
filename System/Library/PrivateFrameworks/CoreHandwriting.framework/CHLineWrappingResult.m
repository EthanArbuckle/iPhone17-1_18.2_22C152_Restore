@interface CHLineWrappingResult
- (CHLineWrappingResult)initWithLineWrappableGroups:(id)a3;
- (NSArray)lineWrappableGroups;
@end

@implementation CHLineWrappingResult

- (CHLineWrappingResult)initWithLineWrappableGroups:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHLineWrappingResult;
  v6 = [(CHLineWrappingResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lineWrappableGroups, a3);
  }

  return v7;
}

- (NSArray)lineWrappableGroups
{
  return self->_lineWrappableGroups;
}

- (void).cxx_destruct
{
}

@end