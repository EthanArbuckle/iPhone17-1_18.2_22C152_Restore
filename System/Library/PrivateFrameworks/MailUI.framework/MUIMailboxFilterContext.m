@interface MUIMailboxFilterContext
+ (id)contextWithMailboxes:(id)a3 focus:(id)a4 isFilteringAvailable:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFilteringAvailable;
- (EMFocus)focus;
- (MUIMailboxFilterContext)initWithMailboxes:(id)a3 focus:(id)a4 isFilteringAvailable:(BOOL)a5;
- (NSArray)mailboxes;
- (unint64_t)hash;
@end

@implementation MUIMailboxFilterContext

+ (id)contextWithMailboxes:(id)a3 focus:(id)a4 isFilteringAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithMailboxes:v9 focus:v8 isFilteringAvailable:v5];

  return v10;
}

- (MUIMailboxFilterContext)initWithMailboxes:(id)a3 focus:(id)a4 isFilteringAvailable:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MUIMailboxFilterContext.m", 15, @"Invalid parameter not satisfying: %@", @"mailboxes" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)MUIMailboxFilterContext;
  v11 = [(MUIMailboxFilterContext *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    mailboxes = v11->_mailboxes;
    v11->_mailboxes = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_focus, a4);
    v11->_isFilteringAvailable = a5;
  }

  return v11;
}

- (EMFocus)focus
{
  return self->_focus;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(MUIMailboxFilterContext *)self mailboxes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= [*(id *)(*((void *)&v9 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (BOOL)isFilteringAvailable
{
  return self->_isFilteringAvailable;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(MUIMailboxFilterContext *)self mailboxes];
    v7 = [v5 mailboxes];

    char v8 = EFArraysAreEqual();
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
}

@end