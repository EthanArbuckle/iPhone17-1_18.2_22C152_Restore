@interface ECEmailAddressFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)shouldIncludeDisplayName;
- (ECEmailAddressFormatter)init;
- (ECEmailAddressFormatter)initWithStyle:(int64_t)a3;
- (id)_groupListString:(id)a3;
- (id)_stringFromEmailAddress:(id)a3 includeDisplayName:(BOOL)a4;
- (id)_stringFromEmailAddressConvertible:(id)a3 includeDisplayName:(BOOL)a4;
- (id)_stringFromEmailAddressList:(id)a3 includeDisplayName:(BOOL)a4;
- (id)_stringFromGroupEmailAddress:(id)a3;
- (id)_stringFromMailboxAddress:(id)a3 includeDisplayName:(BOOL)a4;
- (id)emailAddressFromString:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromEmailAddress:(id)a3;
- (id)stringFromEmailAddressConvertible:(id)a3;
- (id)stringFromEmailAddressList:(id)a3;
- (void)setShouldIncludeDisplayName:(BOOL)a3;
@end

@implementation ECEmailAddressFormatter

- (id)_stringFromMailboxAddress:(id)a3 includeDisplayName:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  int64_t style = self->_style;
  if (style == 1)
  {
    uint64_t v10 = [v6 idnaAddress];
  }
  else
  {
    if (style == 2)
    {
      objc_msgSend(v6, "ef_publicDescription");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    uint64_t v10 = [v6 simpleAddress];
  }
  v11 = (void *)v10;
  if (!v4) {
    goto LABEL_10;
  }
  v12 = [v7 displayName];
  v13 = objc_msgSend(v12, "ecemailaddress_trimmedAndQuotedDisplayName");

  if (![v13 length])
  {

LABEL_10:
    id v9 = v11;
    goto LABEL_11;
  }
  id v9 = [NSString stringWithFormat:@"%@ <%@>", v13, v11];

LABEL_11:
LABEL_12:

  return v9;
}

- (id)stringFromEmailAddress:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ECEmailAddressFormatter.m", 90, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  id v6 = [(ECEmailAddressFormatter *)self _stringFromEmailAddress:v5 includeDisplayName:[(ECEmailAddressFormatter *)self shouldIncludeDisplayName]];

  return v6;
}

- (BOOL)shouldIncludeDisplayName
{
  return self->_shouldIncludeDisplayName;
}

- (id)_stringFromEmailAddress:(id)a3 includeDisplayName:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 groupList];

  if (v7) {
    [(ECEmailAddressFormatter *)self _stringFromGroupEmailAddress:v6];
  }
  else {
  v8 = [(ECEmailAddressFormatter *)self _stringFromMailboxAddress:v6 includeDisplayName:v4];
  }

  return v8;
}

- (void)setShouldIncludeDisplayName:(BOOL)a3
{
  self->_shouldIncludeDisplayName = a3;
}

- (ECEmailAddressFormatter)init
{
  return [(ECEmailAddressFormatter *)self initWithStyle:0];
}

- (ECEmailAddressFormatter)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ECEmailAddressFormatter;
  result = [(ECEmailAddressFormatter *)&v5 init];
  if (result) {
    result->_int64_t style = a3;
  }
  return result;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ECEmailAddressFormatter *)self stringFromEmailAddress:v4];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_6;
  }
  if ([v4 conformsToProtocol:&unk_1F1A77E40])
  {
    uint64_t v5 = [(ECEmailAddressFormatter *)self stringFromEmailAddressConvertible:v4];
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "ef_all:", &__block_literal_global_6))
  {
    uint64_t v5 = [(ECEmailAddressFormatter *)self stringFromEmailAddressList:v4];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

uint64_t __48__ECEmailAddressFormatter_stringForObjectValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F1A77E40];
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8 = a4;
  id v9 = [(ECEmailAddressFormatter *)self emailAddressFromString:v8];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a3) {
      *a3 = v9;
    }
  }
  else if (a5)
  {
    *a5 = [NSString stringWithFormat:@"failed to parse: %@", v8];
  }

  return v10 != 0;
}

- (id)emailAddressFromString:(id)a3
{
  v3 = +[ECEmailAddress emailAddressWithString:a3];
  return v3;
}

- (id)stringFromEmailAddressConvertible:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ECEmailAddressFormatter.m", 96, @"Invalid parameter not satisfying: %@", @"emailAddressConvertible" object file lineNumber description];
  }
  id v6 = [(ECEmailAddressFormatter *)self _stringFromEmailAddressConvertible:v5 includeDisplayName:[(ECEmailAddressFormatter *)self shouldIncludeDisplayName]];

  return v6;
}

- (id)stringFromEmailAddressList:(id)a3
{
  id v4 = a3;
  id v5 = [(ECEmailAddressFormatter *)self _stringFromEmailAddressList:v4 includeDisplayName:[(ECEmailAddressFormatter *)self shouldIncludeDisplayName]];

  return v5;
}

- (id)_stringFromEmailAddressConvertible:(id)a3 includeDisplayName:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 emailAddressValue];
  if (v7)
  {
    uint64_t v8 = [(ECEmailAddressFormatter *)self _stringFromEmailAddress:v7 includeDisplayName:v4];
  }
  else
  {
    if (self->_style == 2)
    {
      id v9 = (void *)MEMORY[0x1E4F60E00];
      uint64_t v10 = [v6 stringValue];
      v11 = [v9 fullyOrPartiallyRedactedStringForString:v10];

      goto LABEL_7;
    }
    uint64_t v8 = [v6 stringValue];
  }
  v11 = (void *)v8;
LABEL_7:

  return v11;
}

- (id)_stringFromEmailAddressList:(id)a3 includeDisplayName:(BOOL)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28E78] string];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__ECEmailAddressFormatter__stringFromEmailAddressList_includeDisplayName___block_invoke;
  v11[3] = &unk_1E63EE580;
  id v8 = v7;
  id v12 = v8;
  v13 = self;
  BOOL v14 = a4;
  [v6 enumerateObjectsUsingBlock:v11];
  id v9 = (void *)[v8 copy];

  return v9;
}

void __74__ECEmailAddressFormatter__stringFromEmailAddressList_includeDisplayName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) _stringFromEmailAddressConvertible:a2 includeDisplayName:*(unsigned __int8 *)(a1 + 48)];
  id v6 = @", ";
  if (!a3) {
    id v6 = &stru_1F1A635E8;
  }
  id v7 = (id)v5;
  [v4 appendFormat:@"%@%@", v6, v5];
}

- (id)_groupListString:(id)a3
{
  BOOL v4 = [a3 groupList];
  uint64_t v5 = [(ECEmailAddressFormatter *)self _stringFromEmailAddressList:v4 includeDisplayName:1];

  return v5;
}

- (id)_stringFromGroupEmailAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_style == 2)
  {
    id v6 = objc_msgSend(v4, "ef_publicDescription");
  }
  else
  {
    id v7 = NSString;
    id v8 = [v4 displayName];
    id v9 = objc_msgSend(v8, "ecemailaddress_trimmedAndQuotedDisplayName");
    uint64_t v10 = [(ECEmailAddressFormatter *)self _groupListString:v5];
    id v6 = [v7 stringWithFormat:@"%@:%@;", v9, v10];
  }
  return v6;
}

@end