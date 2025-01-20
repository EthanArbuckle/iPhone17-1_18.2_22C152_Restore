@interface GKInvite
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHosted;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKInvite)init;
- (GKInvite)initWithInternalRepresentation:(id)a3;
- (GKInviteInternal)internal;
- (GKPlayer)sender;
- (NSString)inviter;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)setCancelled:(BOOL)a3;
- (void)setInternal:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKInvite

- (GKInvite)init
{
  v3 = +[GKInternalRepresentation internalRepresentation];
  v4 = [(GKInvite *)self initWithInternalRepresentation:v3];

  return v4;
}

- (GKInvite)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GKInvite;
  v5 = [(GKInvite *)&v13 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = +[GKInternalRepresentation internalRepresentation];
    }
    objc_storeStrong((id *)&v5->_internal, v4);
    v6 = [v4 player];
    v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = objc_alloc_init(GKUnknownPlayerInternal);
    }
    v9 = v8;

    uint64_t v10 = +[GKPlayer canonicalizedPlayerForInternal:v9];
    sender = v5->_sender;
    v5->_sender = (GKPlayer *)v10;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(GKInvite *)self inviteID];
    v7 = [v5 inviteID];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(GKInvite *)self inviteID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)inviter
{
  v2 = [(GKPlayer *)self->_sender internal];
  unint64_t v3 = [v2 playerID];

  return (NSString *)v3;
}

- (BOOL)isHosted
{
  return [(GKInviteInternal *)self->_internal matchType] == 1;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(GKInvite *)self inviteID];
  id v5 = [(GKInvite *)self sender];
  v6 = [v5 internal];
  v7 = [v6 conciseDescription];
  char v8 = [(GKInvite *)self message];
  v9 = [v3 stringWithFormat:@"{\n\t inviteID = %@\n\t inviter = %@\n\t message = %@\n\t hosted = %d\n\t playerGroup = %lu\n\t playerAttributes = %08X\n\t cancelled = %d\n}", v4, v7, v8, -[GKInvite isHosted](self, "isHosted"), -[GKInvite playerGroup](self, "playerGroup"), -[GKInvite playerAttributes](self, "playerAttributes"), self->_cancelled];

  return v9;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKInvite;
  id v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKInvite;
  id v5 = -[GKInvite methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    char v8 = [(GKInvite *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKInvite;
  if (-[GKInvite respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKInvite *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (!a3) {
    return 0;
  }
  if (class_respondsToSelector((Class)a1, a3)) {
    return 1;
  }
  int v5 = GKApplicationLinkedOnOrAfter(393216, 0);
  BOOL result = 0;
  if (v5)
  {
    return +[GKInviteInternal instancesRespondToSelector:a3];
  }
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(GKInvite *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKInvite *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (GKInviteInternal)internal
{
  return (GKInviteInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternal:(id)a3
{
}

- (GKPlayer)sender
{
  return self->_sender;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end