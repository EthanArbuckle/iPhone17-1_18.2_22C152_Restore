@interface IDSReceivedInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSReceivedInvitation)initWithCoder:(id)a3;
- (IDSReceivedInvitation)initWithfromID:(id)a3 state:(int64_t)a4 expirationDate:(id)a5 uniqueID:(id)a6 context:(id)a7;
- (NSString)fromID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setSelfHandle:(id)a3;
- (void)setSenderMergeID:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation IDSReceivedInvitation

- (IDSReceivedInvitation)initWithfromID:(id)a3 state:(int64_t)a4 expirationDate:(id)a5 uniqueID:(id)a6 context:(id)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSReceivedInvitation;
  v14 = [(IDSInvitation *)&v17 initWithState:a4 expirationDate:a5 uniqueID:a6 context:a7];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_fromID, a3);
  }

  return v15;
}

- (void)setSelfHandle:(id)a3
{
}

- (void)setSenderMergeID:(id)a3
{
}

- (void)setState:(int64_t)a3
{
  self->super._state = a3;
}

- (void)setContext:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v4 = [(IDSInvitation *)self uniqueID];
  v5 = [(IDSInvitation *)self selfHandle];
  v6 = [(IDSInvitation *)self senderMergeID];
  int64_t v7 = [(IDSInvitation *)self state];
  v8 = [(IDSInvitation *)self expirationDate];
  v9 = [(IDSReceivedInvitation *)self fromID];
  v10 = [v3 stringWithFormat:@"<IDSReceivedInvitation %p>: uniqueID %@ selfHandle %@ senderMergeID %@ state %ld expirationDate %@ destination %@", self, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(IDSInvitation *)self state];
    if (v6 == [v5 state])
    {
      int64_t v7 = [(IDSInvitation *)self uniqueID];
      v8 = [v5 uniqueID];
      int v9 = [v7 isEqual:v8];
    }
    else
    {
      int v9 = 0;
    }
    v11 = [(IDSInvitation *)self senderMergeID];
    if (v11)
    {

      if ((v9 & 1) == 0)
      {
        int v12 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      id v13 = [v5 senderMergeID];

      if (v13) {
        int v12 = 0;
      }
      else {
        int v12 = v9;
      }
      if (!v13 || ((v9 ^ 1) & 1) != 0)
      {
LABEL_15:
        v16 = [(IDSInvitation *)self selfHandle];
        if (v16)
        {
        }
        else
        {
          objc_super v17 = [v5 selfHandle];

          if (!v17)
          {
            if (!v12) {
              goto LABEL_25;
            }
            goto LABEL_22;
          }
        }
        if (!v12) {
          goto LABEL_25;
        }
        v18 = [(IDSInvitation *)self selfHandle];
        v19 = [v5 selfHandle];
        char v20 = [v18 isEqualToString:v19];

        if ((v20 & 1) == 0) {
          goto LABEL_25;
        }
LABEL_22:
        v21 = [(IDSInvitation *)self expirationDate];
        v22 = [v5 expirationDate];
        int v23 = [v21 isEqual:v22];

        if (v23)
        {
          v24 = [(IDSReceivedInvitation *)self fromID];
          v25 = [v5 fromID];
          int v26 = [v24 isEqual:v25];

          if (v26)
          {
            v27 = [(IDSInvitation *)self context];
            v28 = [v5 context];
            char v10 = [v27 isEqual:v28];

LABEL_26:
            goto LABEL_27;
          }
        }
LABEL_25:
        char v10 = 0;
        goto LABEL_26;
      }
    }
    v14 = [(IDSInvitation *)self senderMergeID];
    v15 = [v5 senderMergeID];
    int v12 = [v14 isEqual:v15];

    goto LABEL_15;
  }
  char v10 = 0;
LABEL_27:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSInvitation *)self uniqueID];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F6ACC0]];

  int64_t v6 = [(IDSInvitation *)self selfHandle];
  [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F6ACA8]];

  int64_t v7 = [(IDSInvitation *)self senderMergeID];
  [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F6ACB0]];

  int64_t v8 = [(IDSInvitation *)self state];
  [v4 encodeInteger:v8 forKey:*MEMORY[0x1E4F6ACB8]];
  int v9 = [(IDSInvitation *)self expirationDate];
  [v4 encodeObject:v9 forKey:*MEMORY[0x1E4F6AEE0]];

  char v10 = [(IDSReceivedInvitation *)self fromID];
  [v4 encodeObject:v10 forKey:@"fromID"];

  id v11 = [(IDSInvitation *)self context];
  [v4 encodeObject:v11 forKey:*MEMORY[0x1E4F6AC88]];
}

- (IDSReceivedInvitation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F6ACC0]];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F6ACA8]];
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F6ACB0]];
  uint64_t v8 = [v4 decodeIntegerForKey:*MEMORY[0x1E4F6ACB8]];
  int v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F6AEE0]];
  char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fromID"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F6AC88]];

  int v12 = [(IDSReceivedInvitation *)self initWithfromID:v10 state:v8 expirationDate:v9 uniqueID:v5 context:v11];
  [(IDSReceivedInvitation *)v12 setSelfHandle:v6];
  [(IDSReceivedInvitation *)v12 setSenderMergeID:v7];

  return v12;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void).cxx_destruct
{
}

@end