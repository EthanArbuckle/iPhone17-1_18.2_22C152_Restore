@interface NCWaypointGuide
- (NCWaypointGuide)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5;
- (NSString)name;
- (NSUUID)uuid;
- (id)fetchWaypoints;
- (id)guideSymbol;
- (id)iconColor;
- (id)systemWaypoints;
- (int64_t)type;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation NCWaypointGuide

- (NCWaypointGuide)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NCWaypointGuide;
  v11 = [(NCWaypointGuide *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_type = a5;
  }

  return v12;
}

- (id)guideSymbol
{
  return @"pin.point.of.interest.2.fill";
}

- (id)iconColor
{
  return (id)objc_msgSend_defaultMapGuideWaypointIconColor(NCWaypoint, a2, v2, v3);
}

- (id)systemWaypoints
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)fetchWaypoints
{
  uint64_t v2 = objc_opt_new();

  return v2;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end