@interface AXAppRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)appWithPID:(int)a3 bundleID:(id)a4;
- (AXAppRepresentation)init;
- (AXAppRepresentation)initWithCoder:(id)a3;
- (BOOL)isLayoutFullscreenModal;
- (BOOL)isLayoutPrimary;
- (NSString)bundleIdentifier;
- (id)description;
- (int)pid;
- (int64_t)layoutRole;
- (void)_commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setLayoutRole:(int64_t)a3;
- (void)setPid:(int)a3;
@end

@implementation AXAppRepresentation

+ (id)appWithPID:(int)a3 bundleID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = objc_alloc_init(AXAppRepresentation);
  [(AXAppRepresentation *)v6 setPid:v4];
  [(AXAppRepresentation *)v6 setBundleIdentifier:v5];

  return v6;
}

- (AXAppRepresentation)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXAppRepresentation;
  v2 = [(AXAppRepresentation *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AXAppRepresentation *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[AXAppRepresentation pid](self, "pid"));
  objc_super v5 = [(AXAppRepresentation *)self bundleIdentifier];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[AXAppRepresentation isLayoutPrimary](self, "isLayoutPrimary"));
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[AXAppRepresentation isLayoutFullscreenModal](self, "isLayoutFullscreenModal"));
  v8 = [v3 stringWithFormat:@"AXApp<%p>: PID:%@ BundleID:%@ Primary:%@ FullScrModal:%@", self, v4, v5, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInt:", -[AXAppRepresentation pid](self, "pid"));
  [v5 encodeObject:v6 forKey:@"pid"];

  v7 = [(AXAppRepresentation *)self bundleIdentifier];
  [v5 encodeObject:v7 forKey:@"bundleID"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[AXAppRepresentation layoutRole](self, "layoutRole"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v8 forKey:@"layoutRole"];
}

- (AXAppRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXAppRepresentation;
  id v5 = [(AXAppRepresentation *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(AXAppRepresentation *)v5 _commonInit];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
    -[AXAppRepresentation setPid:](v6, "setPid:", [v7 intValue]);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    [(AXAppRepresentation *)v6 setBundleIdentifier:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutRole"];
    -[AXAppRepresentation setLayoutRole:](v6, "setLayoutRole:", [v9 unsignedIntegerValue]);
  }
  return v6;
}

- (BOOL)isLayoutPrimary
{
  return [(AXAppRepresentation *)self layoutRole] == 1;
}

- (BOOL)isLayoutFullscreenModal
{
  return [(AXAppRepresentation *)self layoutRole] == 3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (void).cxx_destruct
{
}

@end