@interface CNAutocompleteCalendarQueryAssembler
- (CNAutocompleteCalendarQueryAssembler)initWithRawCachedObservable:(id)a3 rawUncachedObservable:(id)a4;
- (CNObservable)cachedObservable;
- (CNObservable)rawCachedObservable;
- (CNObservable)rawUncachedObservable;
- (CNObservable)uncachedObservable;
- (id)description;
- (void)assemble;
@end

@implementation CNAutocompleteCalendarQueryAssembler

- (CNAutocompleteCalendarQueryAssembler)initWithRawCachedObservable:(id)a3 rawUncachedObservable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAutocompleteCalendarQueryAssembler;
  v9 = [(CNAutocompleteCalendarQueryAssembler *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawCachedObservable, a3);
    objc_storeStrong((id *)&v10->_rawUncachedObservable, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNAutocompleteCalendarQueryAssembler *)self rawCachedObservable];
  id v5 = (id)[v3 appendName:@"rawCachedObservable" object:v4];

  v6 = [(CNAutocompleteCalendarQueryAssembler *)self rawUncachedObservable];
  id v7 = (id)[v3 appendName:@"rawUncachedObservable" object:v6];

  id v8 = [v3 build];

  return v8;
}

- (void)assemble
{
  v3 = [(CNAutocompleteCalendarQueryAssembler *)self rawCachedObservable];
  v4 = [(CNAutocompleteCalendarQueryAssembler *)self rawUncachedObservable];
  id v5 = [v3 onEmpty:v4];

  v6 = [v5 onError:v4];

  cachedObservable = self->_cachedObservable;
  self->_cachedObservable = v6;
  v9 = v6;

  uncachedObservable = self->_uncachedObservable;
  self->_uncachedObservable = v4;
}

- (CNObservable)cachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 8, 1);
}

- (CNObservable)uncachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 16, 1);
}

- (CNObservable)rawCachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 24, 1);
}

- (CNObservable)rawUncachedObservable
{
  return (CNObservable *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawUncachedObservable, 0);
  objc_storeStrong((id *)&self->_rawCachedObservable, 0);
  objc_storeStrong((id *)&self->_uncachedObservable, 0);
  objc_storeStrong((id *)&self->_cachedObservable, 0);
}

@end