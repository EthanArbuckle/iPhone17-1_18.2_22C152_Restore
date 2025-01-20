@interface MPMediaLibraryConnectionAssertion
- (NSString)identifier;
- (id)_initWithMediaLibrary:(id)a3 identifier:(id)a4;
- (id)description;
- (void)dealloc;
@end

@implementation MPMediaLibraryConnectionAssertion

- (id)_initWithMediaLibrary:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPMediaLibraryConnectionAssertion;
  v9 = [(MPMediaLibraryConnectionAssertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;
  }
  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%p: %@", self, self->_identifier];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)dealloc
{
  [(MPMediaLibrary *)self->_library _removeConnectionAssertion:self];
  v3.receiver = self;
  v3.super_class = (Class)MPMediaLibraryConnectionAssertion;
  [(MPMediaLibraryConnectionAssertion *)&v3 dealloc];
}

@end