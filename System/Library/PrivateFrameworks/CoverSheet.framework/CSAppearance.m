@interface CSAppearance
+ (CSAppearance)appearanceWithIdentifier:(id)a3;
+ (id)appearanceForProvider:(id)a3;
- (BOOL)isEqualToAppearance:(id)a3;
- (BOOL)isTransitional;
- (CSAppearance)initWithIdentifier:(id)a3;
- (NSSet)components;
- (NSString)description;
- (NSString)identifier;
- (_UILegibilitySettings)legibilitySettings;
- (id)componentForType:(int64_t)a3 identifier:(id)a4;
- (id)componentForType:(int64_t)a3 property:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)flagForComponentType:(int64_t)a3;
- (unint64_t)hash;
- (void)addComponent:(id)a3;
- (void)removeAllComponentsWithIdentifier:(id)a3;
- (void)removeComponent:(id)a3;
- (void)reset;
- (void)setComponents:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setTransitional:(BOOL)a3;
- (void)unionAppearance:(id)a3;
@end

@implementation CSAppearance

+ (CSAppearance)appearanceWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return (CSAppearance *)v5;
}

+ (id)appearanceForProvider:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 appearanceIdentifier];
    v6 = [a1 appearanceWithIdentifier:v5];

    v7 = [v4 components];
    [v6 setComponents:v7];

    v8 = [v4 legibilitySettings];

    [v6 setLegibilitySettings:v8];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CSAppearance)initWithIdentifier:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CSAppearance initWithIdentifier:](a2);
    }
LABEL_11:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D849FDDCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CSAppearance initWithIdentifier:](a2);
    }
    goto LABEL_11;
  }

  v14.receiver = self;
  v14.super_class = (Class)CSAppearance;
  v6 = [(CSAppearance *)&v14 init];
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    components = v6->_components;
    v6->_components = v7;

    uint64_t v9 = [v5 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v9;

    legibilitySettings = v6->_legibilitySettings;
    v6->_legibilitySettings = 0;
  }
  return v6;
}

- (void)reset
{
  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = 0;

  components = self->_components;

  [(NSMutableSet *)components removeAllObjects];
}

- (void)unionAppearance:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 legibilitySettings];
  if (v5) {
    objc_storeStrong((id *)&self->_legibilitySettings, v5);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = objc_msgSend(v4, "components", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CSAppearance *)self addComponent:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)isEqualToAppearance:(id)a3
{
  id v4 = (CSAppearance *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(CSAppearance *)v4 isMemberOfClass:objc_opt_class()] {
         && (BOOL transitional = self->_transitional, transitional == [(CSAppearance *)v4 isTransitional]))
  }
  {
    v6 = [(CSAppearance *)v4 legibilitySettings];
    char v7 = 0;
    legibilitySettings = self->_legibilitySettings;
    if (v6) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = legibilitySettings == 0;
    }
    if (legibilitySettings) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v6 != 0;
    }
    if (v9 && !v10)
    {
      if (legibilitySettings
        && ![(_UILegibilitySettings *)legibilitySettings sb_isEqualToLegibilitySettings:v6])
      {
        char v7 = 0;
      }
      else
      {
        components = self->_components;
        long long v12 = [(CSAppearance *)v4 components];
        char v7 = [(NSMutableSet *)components isEqual:v12];
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)componentForType:(int64_t)a3 identifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v7 = self->_components;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v17) == a3)
        {
          long long v13 = [v12 identifier];
          int v14 = BSEqualObjects();

          if (v14)
          {
            id v15 = v12;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

- (id)componentForType:(int64_t)a3 property:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_components;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v16) == a3 && (a4 & ~objc_msgSend(v12, "properties")) == 0)
        {
          if (!v9 || (uint64_t v13 = [v12 priority], v13 > objc_msgSend(v9, "priority")))
          {
            id v14 = v12;

            uint64_t v9 = v14;
          }
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)flagForComponentType:(int64_t)a3
{
  v3 = [(CSAppearance *)self componentForType:a3 property:8];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 flag];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)addComponent:(id)a3
{
  if (a3)
  {
    id v6 = (id)[a3 copy];
    id v4 = [v6 identifier];

    if (!v4)
    {
      int64_t v5 = [(CSAppearance *)self identifier];
      [v6 setIdentifier:v5];
    }
    [(NSMutableSet *)self->_components addObject:v6];
  }
}

- (void)removeComponent:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_components, "removeObject:");
  }
}

- (void)removeAllComponentsWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v5 = (void *)[(NSMutableSet *)self->_components copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [v10 identifier];
        int v12 = BSEqualObjects();

        if (v12) {
          [(NSMutableSet *)self->_components removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)setComponents:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSMutableSet *)self->_components removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CSAppearance addComponent:](self, "addComponent:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(CSAppearance *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() appearanceForProvider:self];
  objc_msgSend(v4, "setTransitional:", -[CSAppearance isTransitional](self, "isTransitional"));
  return v4;
}

- (id)succinctDescription
{
  v2 = [(CSAppearance *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"ID"];
  id v5 = (id)[v3 appendBool:self->_transitional withName:@"transitional"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSAppearance *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(CSAppearance *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CSAppearance_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AD88C0;
  id v6 = v5;
  id v10 = v6;
  long long v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __54__CSAppearance_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(*(void *)(a1 + 40) + 32) succinctDescription];
  id v4 = (id)[v2 appendObject:v3 withName:@"legibilitySettings" skipIfNil:1];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 8) allObjects];
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"priority" ascending:0];
  v10[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v9 = [v6 sortedArrayUsingDescriptors:v8];
  [v5 appendArraySection:v9 withName:@"components" skipIfEmpty:1];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isTransitional
{
  return self->_transitional;
}

- (void)setTransitional:(BOOL)a3
{
  self->_BOOL transitional = a3;
}

- (NSSet)components
{
  return &self->_components->super;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

- (void)initWithIdentifier:(const char *)a1 .cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_1D839D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

@end