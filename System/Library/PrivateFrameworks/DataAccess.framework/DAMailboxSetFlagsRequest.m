@interface DAMailboxSetFlagsRequest
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initRequestWithSetFlags:(unint64_t)a3 unsetFlags:(unint64_t)a4 message:(id)a5;
- (unint64_t)hash;
- (unint64_t)offFlags;
- (unint64_t)onFlags;
- (void)setOffFlags:(unint64_t)a3;
- (void)setOnFlags:(unint64_t)a3;
@end

@implementation DAMailboxSetFlagsRequest

- (id)initRequestWithSetFlags:(unint64_t)a3 unsetFlags:(unint64_t)a4 message:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DAMailboxSetFlagsRequest;
  v9 = [(DAMailboxRequest *)&v13 init];
  v10 = v9;
  if (v9)
  {
    [(DAMailboxRequest *)v9 setRequestType:0];
    [(DAMailboxSetFlagsRequest *)v10 setOnFlags:a3];
    [(DAMailboxSetFlagsRequest *)v10 setOffFlags:a4];
    v11 = (void *)[v8 copy];
    [(DAMailboxRequest *)v10 setMessageID:v11];
  }
  return v10;
}

- (unint64_t)hash
{
  id v3 = [NSString alloc];
  v4 = [(DAMailboxRequest *)self messageID];
  v5 = (void *)[v3 initWithFormat:@"%@\n%llu\n%llu", v4, -[DAMailboxSetFlagsRequest onFlags](self, "onFlags"), -[DAMailboxSetFlagsRequest offFlags](self, "offFlags")];

  unint64_t v6 = [v5 hash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [(DAMailboxRequest *)self messageID];
    v9 = [v7 messageID];
    if (v8 == v9
      || ([(DAMailboxRequest *)self messageID],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v7 messageID],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      uint64_t v11 = [v7 onFlags];
      if (v11 == [(DAMailboxSetFlagsRequest *)self onFlags])
      {
        uint64_t v12 = [v7 offFlags];
        BOOL v10 = v12 == [(DAMailboxSetFlagsRequest *)self offFlags];
      }
      else
      {
        BOOL v10 = 0;
      }
      if (v8 == v9) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  BOOL v10 = 0;
LABEL_12:

  return v10;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DAMailboxSetFlagsRequest;
  v4 = [(DAMailboxSetFlagsRequest *)&v8 description];
  v5 = [(DAMailboxRequest *)self messageID];
  id v6 = [v3 stringWithFormat:@"%@ messageID \"%@\", onFlags %llu, offFlags %llu", v4, v5, -[DAMailboxSetFlagsRequest onFlags](self, "onFlags"), -[DAMailboxSetFlagsRequest offFlags](self, "offFlags")];

  return v6;
}

- (unint64_t)onFlags
{
  return self->_onFlags;
}

- (void)setOnFlags:(unint64_t)a3
{
  self->_onFlags = a3;
}

- (unint64_t)offFlags
{
  return self->_offFlags;
}

- (void)setOffFlags:(unint64_t)a3
{
  self->_offFlags = a3;
}

@end