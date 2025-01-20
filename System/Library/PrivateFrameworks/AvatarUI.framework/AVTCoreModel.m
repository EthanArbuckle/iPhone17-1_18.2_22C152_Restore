@interface AVTCoreModel
- (AVTAvatarEditorColorDefaultsProvider)colorDefaultsProvider;
- (AVTCoreModel)initWithGroups:(id)a3 colors:(id)a4 colorDefaultsProvider:(id)a5 forPlatform:(unint64_t)a6;
- (AVTEditingModelColors)colors;
- (NSArray)groups;
- (id)description;
- (unint64_t)platform;
@end

@implementation AVTCoreModel

- (AVTCoreModel)initWithGroups:(id)a3 colors:(id)a4 colorDefaultsProvider:(id)a5 forPlatform:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AVTCoreModel;
  v13 = [(AVTCoreModel *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    groups = v13->_groups;
    v13->_groups = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    colors = v13->_colors;
    v13->_colors = (AVTEditingModelColors *)v16;

    uint64_t v18 = [v12 copy];
    colorDefaultsProvider = v13->_colorDefaultsProvider;
    v13->_colorDefaultsProvider = (AVTAvatarEditorColorDefaultsProvider *)v18;

    v13->_platform = a6;
  }

  return v13;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)AVTCoreModel;
  v3 = [(AVTCoreModel *)&v11 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTCoreModel *)self groups];
  v6 = objc_msgSend(v5, "avt_description");
  [v4 appendFormat:@" groups: %@\n", v6];

  v7 = [(AVTCoreModel *)self colors];
  objc_msgSend(v4, "appendFormat:", @" colors: %p\n", v7);

  v8 = [(AVTCoreModel *)self colorDefaultsProvider];
  objc_msgSend(v4, "appendFormat:", @" colorDefaultsProvider: %p\n", v8);

  objc_msgSend(v4, "appendFormat:", @" platform: %lu\n", -[AVTCoreModel platform](self, "platform"));
  v9 = (void *)[v4 copy];

  return v9;
}

- (NSArray)groups
{
  return self->_groups;
}

- (AVTEditingModelColors)colors
{
  return self->_colors;
}

- (AVTAvatarEditorColorDefaultsProvider)colorDefaultsProvider
{
  return self->_colorDefaultsProvider;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorDefaultsProvider, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end