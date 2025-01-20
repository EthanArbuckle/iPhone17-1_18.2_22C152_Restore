@interface ATXUserNotificationAppDigest
- (ATXUserNotificationAppDigest)initWithBundleId:(id)a3 appMarqueeGroups:(id)a4 nonAppMarqueeGroups:(id)a5;
- (ATXUserNotificationAppDigest)initWithProto:(id)a3;
- (ATXUserNotificationAppDigest)initWithProtoData:(id)a3;
- (NSArray)appMarqueeGroups;
- (NSArray)groups;
- (NSArray)nonAppMarqueeGroups;
- (NSString)bundleId;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)proto;
@end

@implementation ATXUserNotificationAppDigest

- (ATXUserNotificationAppDigest)initWithBundleId:(id)a3 appMarqueeGroups:(id)a4 nonAppMarqueeGroups:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXUserNotificationAppDigest;
  v11 = [(ATXUserNotificationAppDigest *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    bundleId = v11->_bundleId;
    v11->_bundleId = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    appMarqueeGroups = v11->_appMarqueeGroups;
    v11->_appMarqueeGroups = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    nonAppMarqueeGroups = v11->_nonAppMarqueeGroups;
    v11->_nonAppMarqueeGroups = (NSArray *)v16;

    uint64_t v18 = [v9 arrayByAddingObjectsFromArray:v10];
    groups = v11->_groups;
    v11->_groups = (NSArray *)v18;
  }
  return v11;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotificationAppDigest alloc] initFromJSON:v4];

  v6 = [(ATXUserNotificationAppDigest *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUserNotificationAppDigest *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (ATXUserNotificationAppDigest)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotificationAppDigest alloc] initWithData:v4];

    self = [(ATXUserNotificationAppDigest *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXUserNotificationAppDigest *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXUserNotificationAppDigest)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v12);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [v5 bundleId];
  v7 = [v5 appMarqueeGroups];
  id v8 = +[ATXUserNotificationDigestNotificationGroup groupsFromProtos:v7];
  id v9 = [v5 nonAppMarqueeGroups];

  id v10 = +[ATXUserNotificationDigestNotificationGroup groupsFromProtos:v9];
  self = [(ATXUserNotificationAppDigest *)self initWithBundleId:v6 appMarqueeGroups:v8 nonAppMarqueeGroups:v10];

  v11 = self;
LABEL_8:

  return v11;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setBundleId:self->_bundleId];
  id v4 = +[ATXUserNotificationDigestNotificationGroup protosFromGroups:self->_appMarqueeGroups];
  [v3 setAppMarqueeGroups:v4];

  id v5 = +[ATXUserNotificationDigestNotificationGroup protosFromGroups:self->_nonAppMarqueeGroups];
  [v3 setNonAppMarqueeGroups:v5];

  return v3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSArray)appMarqueeGroups
{
  return self->_appMarqueeGroups;
}

- (NSArray)nonAppMarqueeGroups
{
  return self->_nonAppMarqueeGroups;
}

- (NSArray)groups
{
  return self->_groups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_nonAppMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_appMarqueeGroups, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end