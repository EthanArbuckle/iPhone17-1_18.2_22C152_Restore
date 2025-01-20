@interface AXBuddySettingsTableSection
- (AXBuddySettingsTableSection)initWithName:(id)a3 subitems:(id)a4;
- (AXBuddySettingsTableSection)initWithName:(id)a3 subitems:(id)a4 footerText:(id)a5;
- (id)footerText;
- (id)name;
- (id)subitems;
@end

@implementation AXBuddySettingsTableSection

- (AXBuddySettingsTableSection)initWithName:(id)a3 subitems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXBuddySettingsTableSection;
  v8 = [(AXBuddySettingsTableSection *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    name = v8->_name;
    v8->_name = v9;

    v11 = (NSArray *)[v7 copy];
    subitems = v8->_subitems;
    v8->_subitems = v11;
  }
  return v8;
}

- (AXBuddySettingsTableSection)initWithName:(id)a3 subitems:(id)a4 footerText:(id)a5
{
  id v8 = a5;
  v9 = [(AXBuddySettingsTableSection *)self initWithName:a3 subitems:a4];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    footerText = v9->_footerText;
    v9->_footerText = v10;
  }
  return v9;
}

- (id)name
{
  return self->_name;
}

- (id)subitems
{
  return self->_subitems;
}

- (id)footerText
{
  return self->_footerText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong((id *)&self->_footerText, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end