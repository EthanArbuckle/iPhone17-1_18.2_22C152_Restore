@interface MDPerson
+ (BOOL)supportsSecureCoding;
- (MDPerson)initWithDisplayName:(id)a3 handle:(id)a4 handleIdentifier:(id)a5;
- (NSString)handle;
@end

@implementation MDPerson

- (MDPerson)initWithDisplayName:(id)a3 handle:(id)a4 handleIdentifier:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  if (v8)
  {
    id v20 = v8;
    v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = a5;
    id v12 = a3;
    v13 = [v10 arrayWithObjects:&v20 count:1];
    v14 = -[CSPerson initWithDisplayName:handles:handleIdentifier:](self, "initWithDisplayName:handles:handleIdentifier:", v12, v13, v11, v20, v21);

    v15 = v14;
  }
  else
  {
    id v16 = a5;
    id v17 = a3;
    v18 = [(CSPerson *)self initWithDisplayName:v17 handles:0 handleIdentifier:v16];

    v15 = v18;
  }

  return v15;
}

- (NSString)handle
{
  v2 = [(CSPerson *)self handles];
  v3 = [v2 firstObject];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end