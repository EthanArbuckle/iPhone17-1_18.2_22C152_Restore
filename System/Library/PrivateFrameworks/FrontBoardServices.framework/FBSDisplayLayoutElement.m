@interface FBSDisplayLayoutElement
- (BOOL)fillsDisplayBounds;
- (BOOL)hasKeyboardFocus;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUIApplicationElement;
- (BSMutableSettings)otherSettings;
- (CGRect)frame;
- (CGRect)referenceFrame;
- (Class)fallbackXPCEncodableClass;
- (FBSDisplayLayoutElement)init;
- (FBSDisplayLayoutElement)initWithIdentifier:(id)a3;
- (FBSDisplayLayoutElement)initWithXPCDictionary:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)level;
- (unint64_t)hash;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFillsDisplayBounds:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasKeyboardFocus:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLevel:(int64_t)a3;
- (void)setOtherSettings:(id)a3;
- (void)setReferenceFrame:(CGRect)a3;
- (void)setUIApplicationElement:(BOOL)a3;
@end

@implementation FBSDisplayLayoutElement

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (FBSDisplayLayoutElement)initWithXPCDictionary:(id)a3
{
  id v3 = a3;
  BSDeserializeStringFromXPCDictionaryWithKey();
}

- (void)setHasKeyboardFocus:(BOOL)a3
{
  self->_keyboardFocus = a3;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->_referenceFrame = a3;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (FBSDisplayLayoutElement)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBSDisplayLayoutElement;
  v5 = [(FBSDisplayLayoutElement *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (BSMutableSettings *)objc_alloc_init((Class)off_1E58F4540);
    otherSettings = v5->_otherSettings;
    v5->_otherSettings = v8;

    [(BSMutableSettings *)v5->_otherSettings setDescriptionProvider:v5];
  }

  return v5;
}

- (void)setUIApplicationElement:(BOOL)a3
{
  self->_application = a3;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setFillsDisplayBounds:(BOOL)a3
{
  self->_fillsDisplayBounds = a3;
}

- (void)setOtherSettings:(id)a3
{
  id v4 = (BSMutableSettings *)a3;
  otherSettings = self->_otherSettings;
  if (otherSettings != v4)
  {
    v8 = v4;
    [(BSMutableSettings *)otherSettings setDescriptionProvider:0];
    if (v8) {
      uint64_t v6 = (BSMutableSettings *)[(BSMutableSettings *)v8 mutableCopy];
    }
    else {
      uint64_t v6 = (BSMutableSettings *)objc_alloc_init((Class)off_1E58F4540);
    }
    v7 = self->_otherSettings;
    self->_otherSettings = v6;

    otherSettings = (BSMutableSettings *)[(BSMutableSettings *)self->_otherSettings setDescriptionProvider:self];
    id v4 = v8;
  }

  MEMORY[0x1F41817F8](otherSettings, v4);
}

- (BSMutableSettings)otherSettings
{
  return self->_otherSettings;
}

- (BOOL)isUIApplicationElement
{
  return self->_application;
}

- (BOOL)hasKeyboardFocus
{
  return self->_keyboardFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherSettings, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUIApplicationElement];
}

- (int64_t)level
{
  return self->_level;
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasKeyboardFocus];
}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

- (id)succinctDescriptionBuilder
{
  id v3 = [off_1E58F44F0 builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:0];
  if (self->_bundleIdentifier && !-[NSString isEqualToString:](self->_identifier, "isEqualToString:")) {
    id v5 = (id)[v3 appendObject:self->_bundleIdentifier withName:@"bundleID"];
  }
  if (!CGRectIsEmpty(self->_frame)) {
    id v6 = [v3 appendRect:@"frame" withName:@"frame" x:self->_frame.origin.x y:self->_frame.origin.y width:self->_frame.size.width height:self->_frame.size.height];
  }
  id v7 = (id)[v3 appendInteger:self->_level withName:@"level"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(FBSDisplayLayoutElement *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (CGRect)referenceFrame
{
  double x = self->_referenceFrame.origin.x;
  double y = self->_referenceFrame.origin.y;
  double width = self->_referenceFrame.size.width;
  double height = self->_referenceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)fillsDisplayBounds
{
  return self->_fillsDisplayBounds;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:self->_identifier];
  [v4 setFrame:CGRectMake(self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height)];
  [v4 setReferenceFrame:self->_referenceFrame.origin.x, self->_referenceFrame.origin.y, self->_referenceFrame.size.width, self->_referenceFrame.size.height];
  [v4 setLevel:self->_level];
  [v4 setFillsDisplayBounds:self->_fillsDisplayBounds];
  [v4 setUIApplicationElement:self->_application];
  [v4 setBundleIdentifier:self->_bundleIdentifier];
  [v4 setHasKeyboardFocus:self->_keyboardFocus];
  if (([(BSMutableSettings *)self->_otherSettings isEmpty] & 1) == 0) {
    [v4 setOtherSettings:self->_otherSettings];
  }
  return v4;
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) fillsDisplayBounds];
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) otherSettings];
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) frame];
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) referenceFrame];
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) level];
}

uint64_t __35__FBSDisplayLayoutElement_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [off_1E58F4500 builderWithObject:self ofExpectedClass:objc_opt_class()];
  BOOL application = self->_application;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke;
  v48[3] = &unk_1E58F55B0;
  id v7 = v4;
  id v49 = v7;
  id v8 = (id)[v5 appendBool:application counterpart:v48];
  BOOL keyboardFocus = self->_keyboardFocus;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_2;
  v46[3] = &unk_1E58F55B0;
  id v10 = v7;
  id v47 = v10;
  id v11 = (id)[v5 appendBool:keyboardFocus counterpart:v46];
  BOOL fillsDisplayBounds = self->_fillsDisplayBounds;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_3;
  v44[3] = &unk_1E58F55B0;
  id v13 = v10;
  id v45 = v13;
  id v14 = (id)[v5 appendBool:fillsDisplayBounds counterpart:v44];
  identifier = self->_identifier;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_4;
  v42[3] = &unk_1E58F55D8;
  id v16 = v13;
  id v43 = v16;
  id v17 = (id)[v5 appendString:identifier counterpart:v42];
  bundleIdentifier = self->_bundleIdentifier;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_5;
  v40[3] = &unk_1E58F55D8;
  id v19 = v16;
  id v41 = v19;
  id v20 = (id)[v5 appendString:bundleIdentifier counterpart:v40];
  int64_t level = self->_level;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_6;
  v38[3] = &unk_1E58F5600;
  id v22 = v19;
  id v39 = v22;
  id v23 = (id)[v5 appendInteger:level counterpart:v38];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_7;
  v36[3] = &unk_1E58F5628;
  id v24 = v22;
  id v37 = v24;
  id v25 = [v5 appendCGRect:v36 counterpart:self->_referenceFrame.origin.x, self->_referenceFrame.origin.y, self->_referenceFrame.size.width, self->_referenceFrame.size.height];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_8;
  v34[3] = &unk_1E58F5628;
  id v26 = v24;
  id v35 = v26;
  id v27 = [v5 appendCGRect:v34 counterpart:self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height];
  otherSettings = self->_otherSettings;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __35__FBSDisplayLayoutElement_isEqual___block_invoke_9;
  v32[3] = &unk_1E58F5650;
  id v33 = v26;
  id v29 = v26;
  id v30 = (id)[v5 appendObject:otherSettings counterpart:v32];
  LOBYTE(v26) = [v5 isEqual];

  return (char)v26;
}

- (FBSDisplayLayoutElement)init
{
  return [(FBSDisplayLayoutElement *)self initWithIdentifier:0];
}

- (NSString)description
{
  return (NSString *)[(FBSDisplayLayoutElement *)self descriptionWithMultilinePrefix:0];
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (id)succinctDescription
{
  v2 = [(FBSDisplayLayoutElement *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (void)setIdentifier:(id)a3
{
}

@end