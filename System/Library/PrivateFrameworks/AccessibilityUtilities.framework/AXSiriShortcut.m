@interface AXSiriShortcut
+ (BOOL)supportsSecureCoding;
- (AXSiriShortcut)initWithAccessibilityWorkflow:(id)a3;
- (AXSiriShortcut)initWithCoder:(id)a3;
- (NSString)associatedAppBundleIdentifier;
- (NSString)identifier;
- (NSString)shortcutName;
- (id)description;
- (unsigned)glyphCharacter;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setGlyphCharacter:(unsigned __int16)a3;
- (void)setIdentifier:(id)a3;
- (void)setShortcutName:(id)a3;
@end

@implementation AXSiriShortcut

- (AXSiriShortcut)initWithAccessibilityWorkflow:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXSiriShortcut;
  v5 = [(AXSiriShortcut *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 name];
    shortcutName = v5->_shortcutName;
    v5->_shortcutName = (NSString *)v8;

    uint64_t v10 = [v4 associatedAppBundleIdentifier];
    associatedAppBundleIdentifier = v5->_associatedAppBundleIdentifier;
    v5->_associatedAppBundleIdentifier = (NSString *)v10;

    v5->_glyphCharacter = [v4 glyphCharacter];
    v12 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(AXSiriShortcut *)self identifier];
  v5 = [(AXSiriShortcut *)self shortcutName];
  uint64_t v6 = [(AXSiriShortcut *)self associatedAppBundleIdentifier];
  v7 = [v3 stringWithFormat:@"AXSiriShortcut<%p>. ID: '%@' name: '%@' bundleID: '%@' ", self, v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSiriShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXSiriShortcut;
  v5 = [(AXSiriShortcut *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutName"];
    shortcutName = v5->_shortcutName;
    v5->_shortcutName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAppBundleIdentifier"];
    associatedAppBundleIdentifier = v5->_associatedAppBundleIdentifier;
    v5->_associatedAppBundleIdentifier = (NSString *)v10;

    v5->_glyphCharacter = [v4 decodeIntForKey:@"glyphCharacter"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_shortcutName forKey:@"shortcutName"];
  [v5 encodeObject:self->_associatedAppBundleIdentifier forKey:@"associatedAppBundleIdentifier"];
  [v5 encodeInt:self->_glyphCharacter forKey:@"glyphCharacter"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (void)setShortcutName:(id)a3
{
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  self->_glyphCharacter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end