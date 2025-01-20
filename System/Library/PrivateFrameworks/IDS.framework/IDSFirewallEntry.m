@interface IDSFirewallEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isDonated;
- (BOOL)isEqual:(id)a3;
- (IDSFirewallEntry)initWithCoder:(id)a3;
- (IDSFirewallEntry)initWithURI:(id)a3;
- (IDSFirewallEntry)initWithURI:(id)a3 andLastSeenDate:(id)a4;
- (IDSURI)uri;
- (NSDate)lastSeen;
- (NSString)mergeID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDonated:(BOOL)a3;
- (void)setMergeID:(id)a3;
@end

@implementation IDSFirewallEntry

- (IDSFirewallEntry)initWithURI:(id)a3
{
  return [(IDSFirewallEntry *)self initWithURI:a3 andLastSeenDate:0];
}

- (IDSFirewallEntry)initWithURI:(id)a3 andLastSeenDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v15.receiver = self;
    v15.super_class = (Class)IDSFirewallEntry;
    v9 = [(IDSFirewallEntry *)&v15 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_uri, a3);
      if (v8)
      {
        v11 = (NSDate *)v8;
      }
      else
      {
        v11 = [MEMORY[0x1E4F1C9C8] date];
      }
      lastSeen = v10->_lastSeen;
      v10->_lastSeen = v11;

      v10->_isDonated = 0;
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(IDSFirewallEntry *)self uri];
      v6 = [v4 uri];
      int v7 = [v5 isEqual:v6];

      if (v7)
      {
        id v8 = [(IDSFirewallEntry *)self lastSeen];
        v9 = [v4 lastSeen];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          v11 = [(IDSFirewallEntry *)self mergeID];
          if (v11 || ([v4 mergeID], (objc_super v15 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v12 = [(IDSFirewallEntry *)self mergeID];
            v13 = [v4 mergeID];
            char v14 = [v12 isEqual:v13];

            if (v11)
            {
LABEL_13:

              goto LABEL_9;
            }
            objc_super v15 = 0;
          }
          else
          {
            char v14 = 1;
          }

          goto LABEL_13;
        }
      }
    }
  }
  char v14 = 0;
LABEL_9:

  return v14;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(IDSFirewallEntry *)self uri];
  v5 = [(IDSFirewallEntry *)self lastSeen];
  if ([(IDSFirewallEntry *)self isDonated]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  int v7 = [(IDSFirewallEntry *)self mergeID];
  id v8 = [v3 stringWithFormat:@"<IDSFirewallEntry %p>: uri %@ lastSeen %@ isDonated %@ mergeID %@", self, v4, v5, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(IDSFirewallEntry *)self uri];
  v6 = [(IDSFirewallEntry *)self lastSeen];
  int v7 = (void *)[v4 initWithURI:v5 andLastSeenDate:v6];

  id v8 = [(IDSFirewallEntry *)self mergeID];
  [v7 setMergeID:v8];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(IDSFirewallEntry *)self uri];
  [v7 encodeObject:v4 forKey:@"firewall-uri"];

  v5 = [(IDSFirewallEntry *)self lastSeen];
  [v7 encodeObject:v5 forKey:@"firewall-lastseen"];

  v6 = [(IDSFirewallEntry *)self mergeID];
  [v7 encodeObject:v6 forKey:@"firewall-mergeid"];

  objc_msgSend(v7, "encodeBool:forKey:", -[IDSFirewallEntry isDonated](self, "isDonated"), @"firewall-isdonated");
}

- (IDSFirewallEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firewall-uri"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firewall-lastseen"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firewall-mergeid"];
  uint64_t v8 = [v4 decodeBoolForKey:@"firewall-isdonated"];

  v9 = [[IDSFirewallEntry alloc] initWithURI:v5 andLastSeenDate:v6];
  int v10 = v9;
  if (v7) {
    [(IDSFirewallEntry *)v9 setMergeID:v7];
  }
  [(IDSFirewallEntry *)v10 setIsDonated:v8];

  return v10;
}

- (IDSURI)uri
{
  return self->_uri;
}

- (NSDate)lastSeen
{
  return self->_lastSeen;
}

- (NSString)mergeID
{
  return self->_mergeID;
}

- (void)setMergeID:(id)a3
{
}

- (BOOL)isDonated
{
  return self->_isDonated;
}

- (void)setIsDonated:(BOOL)a3
{
  self->_isDonated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeID, 0);
  objc_storeStrong((id *)&self->_lastSeen, 0);

  objc_storeStrong((id *)&self->_uri, 0);
}

@end