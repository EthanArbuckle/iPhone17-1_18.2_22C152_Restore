@interface MSSendMailIntent
- (NSString)ef_publicDescription;
- (id)_privacySafeDescription;
@end

@implementation MSSendMailIntent

- (id)_privacySafeDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F607F8]);
  v4 = [(MSSendMailIntent *)self sender];
  v25 = (void *)[v3 initWithString:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F608E0]);
  v6 = [(MSSendMailIntent *)self subject];
  v24 = (void *)[v5 initWithString:v6];

  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  v23 = [(MSSendMailIntent *)self identifier];
  v22 = objc_msgSend(v25, "ef_publicDescription");
  v21 = [(MSSendMailIntent *)self to];
  uint64_t v9 = [v21 count];
  v20 = [(MSSendMailIntent *)self cc];
  uint64_t v10 = [v20 count];
  v19 = [(MSSendMailIntent *)self bcc];
  uint64_t v11 = [v19 count];
  v12 = objc_msgSend(v24, "ef_publicDescription");
  v13 = [(MSSendMailIntent *)self attachments];
  uint64_t v14 = [v13 count];
  v15 = [(MSSendMailIntent *)self isDraft];
  v16 = @"draft";
  if (!v15) {
    v16 = &stru_1F1AA2F90;
  }
  v17 = [v7 stringWithFormat:@"<%@ %p> ID:%@ Sender:%@ toCount:%lu ccCount:%lu bccCount:%lu subject:%@ attachment:%lu %@", v8, self, v23, v22, v9, v10, v11, v12, v14, v16];

  return v17;
}

- (NSString)ef_publicDescription
{
  id v3 = NSString;
  v4 = [(MSSendMailIntent *)self _privacySafeDescription];
  id v5 = (void *)MEMORY[0x1E4F60E00];
  v6 = [(MSSendMailIntent *)self body];
  v7 = [v5 fullyOrPartiallyRedactedStringForString:v6];
  uint64_t v8 = (void *)MEMORY[0x1E4F60E00];
  uint64_t v9 = [(MSSendMailIntent *)self userTypedContent];
  uint64_t v10 = [v8 fullyOrPartiallyRedactedStringForString:v9];
  uint64_t v11 = [v3 stringWithFormat:@"%@ body:%@ typedContent:%@", v4, v7, v10];

  return (NSString *)v11;
}

@end