@interface LNAutoShortcut
+ (BOOL)supportsSecureCoding;
- (LNAppShortcutParameterPresentation)parameterPresentation;
- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 localizedPhrases:(id)a5 localizedTitle:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9;
- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9;
- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10;
- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10 parameterPresentation:(id)a11;
- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10 parameterPresentation:(id)a11 attributionBundleIdentifier:(id)a12 basePhraseTemplates:(id)a13;
- (LNAutoShortcut)initWithCoder:(id)a3;
- (LNAutoShortcut)initWithLocaleIdentifier:(id)a3 localizedApplicationName:(id)a4 basePhraseTemplateSubstitutions:(id)a5 actionIdentifier:(id)a6 phraseTemplates:(id)a7 title:(id)a8 shortTitle:(id)a9 actionDescription:(id)a10 systemImage:(id)a11;
- (NSArray)basePhraseTemplates;
- (NSArray)localizedPhrases;
- (NSArray)orderedPhrases;
- (NSDictionary)localizedPhrasesByBasePhraseTemplate;
- (NSString)actionIdentifier;
- (NSString)attributionBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)localeIdentifier;
- (NSString)localizedActionDescription;
- (NSString)localizedAutoShortcutDescription;
- (NSString)localizedShortTitle;
- (NSString)localizedTitle;
- (NSString)systemImage;
- (NSString)systemImageName;
- (id)description;
- (int64_t)shortcutTileColor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAutoShortcut

- (NSString)attributionBundleIdentifier
{
  return self->_attributionBundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSArray)orderedPhrases
{
  return self->_orderedPhrases;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (int64_t)shortcutTileColor
{
  return self->_shortcutTileColor;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10 parameterPresentation:(id)a11 attributionBundleIdentifier:(id)a12 basePhraseTemplates:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v52 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  id v51 = a12;
  id v25 = a13;
  v53 = v18;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 27, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v19)
    {
LABEL_3:
      if (v20) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 28, @"Invalid parameter not satisfying: %@", @"localeIdentifier" object file lineNumber description];

  if (v20)
  {
LABEL_4:
    if (v21) {
      goto LABEL_5;
    }
LABEL_12:
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 30, @"Invalid parameter not satisfying: %@", @"orderedPhrases" object file lineNumber description];

    if (v23) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 29, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

  if (!v21) {
    goto LABEL_12;
  }
LABEL_5:
  if (v23) {
    goto LABEL_6;
  }
LABEL_13:
  v48 = [MEMORY[0x1E4F28B00] currentHandler];
  [v48 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 31, @"Invalid parameter not satisfying: %@", @"systemImageName" object file lineNumber description];

LABEL_6:
  v54.receiver = self;
  v54.super_class = (Class)LNAutoShortcut;
  v26 = [(LNAutoShortcut *)&v54 init];
  if (v26)
  {
    uint64_t v27 = [v53 copy];
    bundleIdentifier = v26->_bundleIdentifier;
    v26->_bundleIdentifier = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    localeIdentifier = v26->_localeIdentifier;
    v26->_localeIdentifier = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    actionIdentifier = v26->_actionIdentifier;
    v26->_actionIdentifier = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    orderedPhrases = v26->_orderedPhrases;
    v26->_orderedPhrases = (NSArray *)v33;

    localizedTitle = v26->_localizedTitle;
    v26->_localizedTitle = (NSString *)@"DEPRECATED, DO NOT USE";

    uint64_t v36 = [v52 copy];
    localizedShortTitle = v26->_localizedShortTitle;
    v26->_localizedShortTitle = (NSString *)v36;

    uint64_t v38 = [v22 copy];
    localizedAutoShortcutDescription = v26->_localizedAutoShortcutDescription;
    v26->_localizedAutoShortcutDescription = (NSString *)v38;

    uint64_t v40 = [v23 copy];
    systemImageName = v26->_systemImageName;
    v26->_systemImageName = (NSString *)v40;

    v26->_shortcutTileColor = a10;
    objc_storeStrong((id *)&v26->_parameterPresentation, a11);
    objc_storeStrong((id *)&v26->_attributionBundleIdentifier, a12);
    objc_storeStrong((id *)&v26->_basePhraseTemplates, a13);
    v42 = v26;
  }

  return v26;
}

- (LNAutoShortcut)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
      if (v7)
      {
        v8 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v9 = objc_opt_class();
        v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
        v11 = [v4 decodeObjectOfClasses:v10 forKey:@"orderedPhrases"];

        if (v11)
        {
          v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedShortTitle"];
          uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAutoShortcutDescription"];
          v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemImageName"];
          if (v13)
          {
            id v24 = v13;
            uint64_t v23 = [v4 decodeIntegerForKey:@"shortcutTileColor"];
            id v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterPresentation"];
            id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributionBundleIdentifier"];
            v14 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v15 = objc_opt_class();
            v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
            v17 = [v4 decodeObjectOfClasses:v16 forKey:@"basePhraseTemplates"];

            id v18 = (void *)v25;
            self = [(LNAutoShortcut *)self initWithBundleIdentifier:v5 localeIdentifier:v6 actionIdentifier:v7 orderedPhrases:v11 localizedShortTitle:v12 localizedAutoShortcutDescription:v25 systemImageName:v24 shortcutTileColor:v23 parameterPresentation:v22 attributionBundleIdentifier:v21 basePhraseTemplates:v17];

            v13 = v24;
            id v19 = self;
          }
          else
          {
            id v19 = 0;
            id v18 = (void *)v25;
          }
        }
        else
        {
          id v19 = 0;
        }
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (NSString)localizedShortTitle
{
  return self->_localizedShortTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePhraseTemplates, 0);
  objc_storeStrong((id *)&self->_attributionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_parameterPresentation, 0);
  objc_storeStrong((id *)&self->_localizedAutoShortcutDescription, 0);
  objc_storeStrong((id *)&self->_localizedActionDescription, 0);
  objc_storeStrong((id *)&self->_localizedShortTitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_orderedPhrases, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSArray)basePhraseTemplates
{
  return self->_basePhraseTemplates;
}

- (LNAppShortcutParameterPresentation)parameterPresentation
{
  return self->_parameterPresentation;
}

- (NSString)localizedAutoShortcutDescription
{
  return self->_localizedAutoShortcutDescription;
}

- (NSString)localizedActionDescription
{
  return self->_localizedActionDescription;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (id)description
{
  v16 = NSString;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v15 = NSStringFromClass(v3);
  v14 = [(LNAutoShortcut *)self bundleIdentifier];
  id v4 = [(LNAutoShortcut *)self localeIdentifier];
  v5 = [(LNAutoShortcut *)self actionIdentifier];
  v6 = [(LNAutoShortcut *)self orderedPhrases];
  v7 = [(LNAutoShortcut *)self localizedShortTitle];
  v8 = [(LNAutoShortcut *)self localizedAutoShortcutDescription];
  uint64_t v9 = [(LNAutoShortcut *)self systemImageName];
  v10 = [(LNAutoShortcut *)self parameterPresentation];
  v11 = [(LNAutoShortcut *)self attributionBundleIdentifier];
  v12 = [v16 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, localeIdentifier: %@, actionIdentifier: %@, orderedPhrases:%@, localizedShortTitle: %@, localizedAutoShortcut: %@, systemImageName: %@, parameterPresentation: %@, attributionBundleIdentifier: %@>", v15, self, v14, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAutoShortcut *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  v6 = [(LNAutoShortcut *)self localeIdentifier];
  [v4 encodeObject:v6 forKey:@"localeIdentifier"];

  v7 = [(LNAutoShortcut *)self actionIdentifier];
  [v4 encodeObject:v7 forKey:@"actionIdentifier"];

  v8 = [(LNAutoShortcut *)self orderedPhrases];
  [v4 encodeObject:v8 forKey:@"orderedPhrases"];

  uint64_t v9 = [(LNAutoShortcut *)self localizedShortTitle];
  [v4 encodeObject:v9 forKey:@"localizedShortTitle"];

  v10 = [(LNAutoShortcut *)self localizedAutoShortcutDescription];
  [v4 encodeObject:v10 forKey:@"localizedAutoShortcutDescription"];

  v11 = [(LNAutoShortcut *)self systemImageName];
  [v4 encodeObject:v11 forKey:@"systemImageName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAutoShortcut shortcutTileColor](self, "shortcutTileColor"), @"shortcutTileColor");
  v12 = [(LNAutoShortcut *)self parameterPresentation];
  [v4 encodeObject:v12 forKey:@"parameterPresentation"];

  v13 = [(LNAutoShortcut *)self attributionBundleIdentifier];
  [v4 encodeObject:v13 forKey:@"attributionBundleIdentifier"];

  id v14 = [(LNAutoShortcut *)self basePhraseTemplates];
  [v4 encodeObject:v14 forKey:@"basePhraseTemplates"];
}

- (NSDictionary)localizedPhrasesByBasePhraseTemplate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(LNAutoShortcut *)self orderedPhrases];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 basePhraseTemplate];
        v11 = [v3 objectForKeyedSubscript:v10];

        if (v11)
        {
          [v11 addObject:v9];
        }
        else
        {
          v12 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
          v13 = [v9 basePhraseTemplate];
          [v3 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSArray)localizedPhrases
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(LNAutoShortcut *)self localizedPhrasesByBasePhraseTemplate];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) localizedPhrase];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)systemImage
{
  v2 = (void *)[(NSString *)self->_systemImageName copy];
  return (NSString *)v2;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10 parameterPresentation:(id)a11
{
  return [(LNAutoShortcut *)self initWithBundleIdentifier:a3 localeIdentifier:a4 actionIdentifier:a5 orderedPhrases:a6 localizedShortTitle:a7 localizedAutoShortcutDescription:a8 systemImageName:a9 shortcutTileColor:a10 parameterPresentation:a11 attributionBundleIdentifier:0 basePhraseTemplates:0];
}

- (LNAutoShortcut)initWithLocaleIdentifier:(id)a3 localizedApplicationName:(id)a4 basePhraseTemplateSubstitutions:(id)a5 actionIdentifier:(id)a6 phraseTemplates:(id)a7 title:(id)a8 shortTitle:(id)a9 actionDescription:(id)a10 systemImage:(id)a11
{
  id v44 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  if (v20)
  {
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 273, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

    if (v21) {
      goto LABEL_3;
    }
  }
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 274, @"Invalid parameter not satisfying: %@", @"phraseTemplates" object file lineNumber description];

LABEL_3:
  v45.receiver = self;
  v45.super_class = (Class)LNAutoShortcut;
  v26 = [(LNAutoShortcut *)&v45 init];
  uint64_t v27 = v26;
  if (v26)
  {
    bundleIdentifier = v26->_bundleIdentifier;
    v26->_bundleIdentifier = (NSString *)@"com.apple.unknown";

    uint64_t v29 = [v20 copy];
    actionIdentifier = v27->_actionIdentifier;
    v27->_actionIdentifier = (NSString *)v29;

    orderedPhrases = v27->_orderedPhrases;
    v27->_orderedPhrases = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v32 = [v22 key];
    localizedTitle = v27->_localizedTitle;
    v27->_localizedTitle = (NSString *)v32;

    uint64_t v34 = [v23 key];
    localizedShortTitle = v27->_localizedShortTitle;
    v27->_localizedShortTitle = (NSString *)v34;

    uint64_t v36 = [v24 key];
    localizedAutoShortcutDescription = v27->_localizedAutoShortcutDescription;
    v27->_localizedAutoShortcutDescription = (NSString *)v36;

    if (v25) {
      uint64_t v38 = (__CFString *)v25;
    }
    else {
      uint64_t v38 = @"play.circle";
    }
    systemImageName = v27->_systemImageName;
    v27->_systemImageName = &v38->isa;

    v27->_shortcutTileColor = 14;
    uint64_t v40 = v27;
  }

  return v27;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 localizedPhrases:(id)a5 localizedTitle:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 243, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
LABEL_10:
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 245, @"Invalid parameter not satisfying: %@", @"localizedPhrases" object file lineNumber description];

      if (v22) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 244, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

  if (!v18) {
    goto LABEL_10;
  }
LABEL_4:
  if (v22) {
    goto LABEL_5;
  }
LABEL_11:
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 246, @"Invalid parameter not satisfying: %@", @"systemImageName" object file lineNumber description];

LABEL_5:
  v44.receiver = self;
  v44.super_class = (Class)LNAutoShortcut;
  id v23 = [(LNAutoShortcut *)&v44 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    actionIdentifier = v23->_actionIdentifier;
    v23->_actionIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    orderedPhrases = v23->_orderedPhrases;
    v23->_orderedPhrases = (NSArray *)v28;

    uint64_t v30 = [v19 copy];
    localizedTitle = v23->_localizedTitle;
    v23->_localizedTitle = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    localizedShortTitle = v23->_localizedShortTitle;
    v23->_localizedShortTitle = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    localizedAutoShortcutDescription = v23->_localizedAutoShortcutDescription;
    v23->_localizedAutoShortcutDescription = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    systemImageName = v23->_systemImageName;
    v23->_systemImageName = (NSString *)v36;

    v23->_shortcutTileColor = 14;
    uint64_t v38 = v23;
  }

  return v23;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 214, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v17)
    {
LABEL_3:
      if (v18) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 215, @"Invalid parameter not satisfying: %@", @"localeIdentifier" object file lineNumber description];

  if (v18)
  {
LABEL_4:
    if (v19) {
      goto LABEL_5;
    }
LABEL_12:
    objc_super v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 217, @"Invalid parameter not satisfying: %@", @"orderedPhrases" object file lineNumber description];

    if (v22) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v43 = [MEMORY[0x1E4F28B00] currentHandler];
  [v43 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 216, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

  if (!v19) {
    goto LABEL_12;
  }
LABEL_5:
  if (v22) {
    goto LABEL_6;
  }
LABEL_13:
  objc_super v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, self, @"LNAutoShortcut.m", 218, @"Invalid parameter not satisfying: %@", @"systemImageName" object file lineNumber description];

LABEL_6:
  v46.receiver = self;
  v46.super_class = (Class)LNAutoShortcut;
  id v23 = [(LNAutoShortcut *)&v46 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    localeIdentifier = v23->_localeIdentifier;
    v23->_localeIdentifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    actionIdentifier = v23->_actionIdentifier;
    v23->_actionIdentifier = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    orderedPhrases = v23->_orderedPhrases;
    v23->_orderedPhrases = (NSArray *)v30;

    localizedTitle = v23->_localizedTitle;
    v23->_localizedTitle = (NSString *)@"DEPRECATED, DO NOT USE";

    uint64_t v33 = [v20 copy];
    localizedShortTitle = v23->_localizedShortTitle;
    v23->_localizedShortTitle = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    localizedAutoShortcutDescription = v23->_localizedAutoShortcutDescription;
    v23->_localizedAutoShortcutDescription = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    systemImageName = v23->_systemImageName;
    v23->_systemImageName = (NSString *)v37;

    v23->_shortcutTileColor = 14;
    v39 = v23;
  }

  return v23;
}

- (LNAutoShortcut)initWithBundleIdentifier:(id)a3 localeIdentifier:(id)a4 actionIdentifier:(id)a5 orderedPhrases:(id)a6 localizedShortTitle:(id)a7 localizedAutoShortcutDescription:(id)a8 systemImageName:(id)a9 shortcutTileColor:(int64_t)a10
{
  return [(LNAutoShortcut *)self initWithBundleIdentifier:a3 localeIdentifier:a4 actionIdentifier:a5 orderedPhrases:a6 localizedShortTitle:a7 localizedAutoShortcutDescription:a8 systemImageName:a9 shortcutTileColor:a10 parameterPresentation:0];
}

@end