@interface _CDMDCSContextualPredicate
+ (BOOL)supportsSecureCoding;
+ (id)_predicateForChangeAtKeyPath:(id)a3 identifier:(id)a4;
+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4 identifier:(id)a5;
+ (id)_predicateForKeyPath:(id)a3 withPredicate:(id)a4 identifier:(id)a5;
+ (id)andPredicateWithSubpredicates:(id)a3 identifier:(id)a4;
+ (id)contextualPredicateForKeyPaths:(id)a3 withPredicate:(id)a4 identifier:(id)a5;
+ (id)notPredicateWithSubpredicate:(id)a3 identifier:(id)a4;
+ (id)orPredicateWithSubpredicates:(id)a3 identifier:(id)a4;
+ (id)predicateForBacklightOnStatus;
+ (id)predicateForFirstPartyWorkoutMatchingTypes:(id)a3 states:(id)a4;
+ (id)predicateForForegroundApp;
+ (id)predicateForIsConnectedToAudioBluetoothDevice;
+ (id)predicateForIsConnectedToCar;
+ (id)predicateForNetworkQualityBad;
+ (id)predicateForNetworkQualityFair;
+ (id)predicateForNextAlarm;
+ (id)predicateForPhotosAppBecameForeground;
+ (id)predicateForUserIsArrivingAtHome;
+ (id)predicateForUserIsLeavingHome;
+ (id)predicateWithIdentifier:(id)a3;
+ (id)predicates;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)parameters;
- (NSString)identifier;
- (_CDMDCSContextualPredicate)initWithCoder:(id)a3;
- (_CDMDCSContextualPredicate)initWithIdentifier:(id)a3 parameters:(id)a4;
- (_CDMDCSContextualPredicate)initWithPlistDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)plistDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation _CDMDCSContextualPredicate

+ (id)_predicateForChangeAtKeyPath:(id)a3 identifier:(id)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v8, sel_predicateForChangeAtKeyPath_, a3);
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)_predicateForKeyPath:(id)a3 equalToValue:(id)a4 identifier:(id)a5
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  id v7 = a5;
  objc_super v8 = objc_msgSendSuper2(&v10, sel_predicateForKeyPath_equalToValue_, a3, a4);
  objc_msgSend(v8, "setIdentifier:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)_predicateForKeyPath:(id)a3 withPredicate:(id)a4 identifier:(id)a5
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  id v7 = a5;
  objc_super v8 = objc_msgSendSuper2(&v10, sel_predicateForKeyPath_withPredicate_, a3, a4);
  objc_msgSend(v8, "setIdentifier:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)contextualPredicateForKeyPaths:(id)a3 withPredicate:(id)a4 identifier:(id)a5
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  id v7 = a5;
  objc_super v8 = objc_msgSendSuper2(&v10, sel_contextualPredicateForKeyPaths_withPredicate_, a3, a4);
  objc_msgSend(v8, "setIdentifier:", v7, v10.receiver, v10.super_class);

  return v8;
}

+ (id)notPredicateWithSubpredicate:(id)a3 identifier:(id)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v8, sel_notPredicateWithSubpredicate_, a3);
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)andPredicateWithSubpredicates:(id)a3 identifier:(id)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v8, sel_andPredicateWithSubpredicates_, a3);
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)orPredicateWithSubpredicates:(id)a3 identifier:(id)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____CDMDCSContextualPredicate;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v8, sel_orPredicateWithSubpredicates_, a3);
  objc_msgSend(v6, "setIdentifier:", v5, v8.receiver, v8.super_class);

  return v6;
}

+ (id)predicateForUserIsLeavingHome
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59___CDMDCSContextualPredicate_predicateForUserIsLeavingHome__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (predicateForUserIsLeavingHome_initialized != -1) {
    dispatch_once(&predicateForUserIsLeavingHome_initialized, v4);
  }
  v2 = (void *)predicateForUserIsLeavingHome_contextualPredicate;
  return v2;
}

+ (id)predicateForUserIsArrivingAtHome
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___CDMDCSContextualPredicate_predicateForUserIsArrivingAtHome__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (predicateForUserIsArrivingAtHome_initialized != -1) {
    dispatch_once(&predicateForUserIsArrivingAtHome_initialized, v4);
  }
  v2 = (void *)predicateForUserIsArrivingAtHome_contextualPredicate;
  return v2;
}

+ (id)predicateForPhotosAppBecameForeground
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67___CDMDCSContextualPredicate_predicateForPhotosAppBecameForeground__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateForPhotosAppBecameForeground_initialized != -1) {
    dispatch_once(&predicateForPhotosAppBecameForeground_initialized, block);
  }
  v2 = (void *)predicateForPhotosAppBecameForeground_contextualPredicate;
  return v2;
}

+ (id)predicateForNetworkQualityFair
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___CDMDCSContextualPredicate_predicateForNetworkQualityFair__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateForNetworkQualityFair_initialized != -1) {
    dispatch_once(&predicateForNetworkQualityFair_initialized, block);
  }
  v2 = (void *)predicateForNetworkQualityFair_contextualPredicate;
  return v2;
}

+ (id)predicateForNetworkQualityBad
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___CDMDCSContextualPredicate_predicateForNetworkQualityBad__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateForNetworkQualityBad_initialized != -1) {
    dispatch_once(&predicateForNetworkQualityBad_initialized, block);
  }
  v2 = (void *)predicateForNetworkQualityBad_contextualPredicate;
  return v2;
}

+ (id)predicateForIsConnectedToCar
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___CDMDCSContextualPredicate_predicateForIsConnectedToCar__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (predicateForIsConnectedToCar_initialized != -1) {
    dispatch_once(&predicateForIsConnectedToCar_initialized, v4);
  }
  v2 = (void *)predicateForIsConnectedToCar_contextualPredicate;
  return v2;
}

+ (id)predicateForIsConnectedToAudioBluetoothDevice
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75___CDMDCSContextualPredicate_predicateForIsConnectedToAudioBluetoothDevice__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (predicateForIsConnectedToAudioBluetoothDevice_initialized != -1) {
    dispatch_once(&predicateForIsConnectedToAudioBluetoothDevice_initialized, v4);
  }
  v2 = (void *)predicateForIsConnectedToAudioBluetoothDevice_contextualPredicate;
  return v2;
}

+ (id)predicateForNextAlarm
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51___CDMDCSContextualPredicate_predicateForNextAlarm__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (predicateForNextAlarm_initialized != -1) {
    dispatch_once(&predicateForNextAlarm_initialized, v4);
  }
  v2 = (void *)predicateForNextAlarm_contextualPredicate;
  return v2;
}

+ (id)predicateForFirstPartyWorkoutMatchingTypes:(id)a3 states:(id)a4
{
  v4 = 0;
  v24[2] = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v8 = a4;
    id v9 = a3;
    objc_super v10 = +[_CDContextQueries keyPathForWorkoutDataDictionary];
    v11 = (void *)MEMORY[0x1E4F28F60];
    v12 = +[_CDContextQueries sessionState];
    v13 = +[_CDContextQueries workoutActivityType];
    v14 = +[_CDContextQueries isFirstPartyWorkout];
    uint64_t v15 = [v11 predicateWithFormat:@"SELF.%@.value.%K in %@ AND SELF.%@.value.%K in %@ AND SELF.%@.value.%K = %@", v10, v12, v8, v10, v13, v9, v10, v14, MEMORY[0x1E4F1CC38]];

    v16 = NSStringFromSelector(a2);
    v17 = (void *)v15;
    v4 = [a1 _predicateForKeyPath:v10 withPredicate:v15 identifier:v16];

    v18 = +[_CDContextQueries sessionState];
    v23[0] = v18;
    v24[0] = v8;
    v19 = +[_CDContextQueries workoutActivityType];
    v23[1] = v19;
    v20 = [v9 allObjects];

    v24[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

    [v4 setParameters:v21];
  }
  return v4;
}

+ (id)predicateForBacklightOnStatus
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59___CDMDCSContextualPredicate_predicateForBacklightOnStatus__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (predicateForBacklightOnStatus_initialized != -1) {
    dispatch_once(&predicateForBacklightOnStatus_initialized, v4);
  }
  v2 = (void *)predicateForBacklightOnStatus_contextualPredicate;
  return v2;
}

+ (id)predicateForForegroundApp
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55___CDMDCSContextualPredicate_predicateForForegroundApp__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a1;
  v4[5] = a2;
  if (predicateForForegroundApp_initialized != -1) {
    dispatch_once(&predicateForForegroundApp_initialized, v4);
  }
  v2 = (void *)predicateForForegroundApp_contextualPredicate;
  return v2;
}

+ (id)predicateWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___CDMDCSContextualPredicate_predicateWithIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predicateWithIdentifier__initialized == -1)
  {
    if (v4)
    {
LABEL_3:
      v6 = [(id)predicateWithIdentifier__mapping objectForKeyedSubscript:v5];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&predicateWithIdentifier__initialized, block);
    if (v5) {
      goto LABEL_3;
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

+ (id)predicates
{
  if (predicates_initialized != -1) {
    dispatch_once(&predicates_initialized, &__block_literal_global_11);
  }
  v2 = (void *)predicates_predicates;
  return v2;
}

- (_CDMDCSContextualPredicate)initWithIdentifier:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count] == 2)
  {
    id v8 = NSStringFromSelector(sel_predicateForFirstPartyWorkoutMatchingTypes_states_);
    int v9 = [v6 isEqualToString:v8];

    if (v9)
    {
      objc_super v10 = +[_CDContextQueries sessionState];
      v11 = [v7 objectForKeyedSubscript:v10];

      v12 = +[_CDContextQueries workoutActivityType];
      v13 = [v7 objectForKeyedSubscript:v12];

      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
LABEL_14:
          v16 = (void *)v14;
          if (v11 && v14)
          {
            uint64_t v15 = +[_CDMDCSContextualPredicate predicateForFirstPartyWorkoutMatchingTypes:v14 states:v11];
LABEL_24:

            goto LABEL_25;
          }
LABEL_21:
          v18 = [MEMORY[0x1E4F5B418] contextChannel];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
            -[_CDMDCSContextualPredicate initWithIdentifier:parameters:]();
          }

          uint64_t v15 = 0;
          goto LABEL_24;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 copy];
          goto LABEL_14;
        }
        v17 = [MEMORY[0x1E4F5B418] contextChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[_CDMDCSContextualPredicate initWithIdentifier:parameters:]();
        }
      }
      v16 = 0;
      goto LABEL_21;
    }
    v11 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v15 = +[_CDMDCSContextualPredicate predicateWithIdentifier:v6];
  if (!v15)
  {
    v11 = [MEMORY[0x1E4F5B418] contextChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
LABEL_10:
    }
      -[_CDMDCSContextualPredicate initWithIdentifier:parameters:]();
LABEL_11:
    uint64_t v15 = 0;
LABEL_25:
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
}

- (_CDMDCSContextualPredicate)initWithCoder:(id)a3
{
  uint64_t v4 = initWithCoder__initialized;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithCoder__initialized, &__block_literal_global_208);
  }
  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v7 = [v5 decodeObjectOfClasses:initWithCoder__allowedParameterClasses forKey:@"parameters"];

  id v8 = [(_CDMDCSContextualPredicate *)self initWithIdentifier:v6 parameters:v7];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CDMDCSContextualPredicate;
  id v4 = [(_CDContextualPredicate *)&v8 copyWithZone:a3];
  id v5 = (void *)[(NSString *)self->_identifier copy];
  [v4 setIdentifier:v5];

  id v6 = (void *)[(NSDictionary *)self->_parameters copy];
  [v4 setParameters:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CDMDCSContextualPredicate;
  if ([(_CDContextualPredicate *)&v13 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    identifier = self->_identifier;
    id v7 = [v5 identifier];
    LODWORD(identifier) = [(NSString *)identifier isEqual:v7];

    if (identifier)
    {
      parameters = self->_parameters;
      uint64_t v9 = [v5 parameters];
      objc_super v10 = (void *)v9;
      if (parameters) {
        BOOL v11 = [(NSDictionary *)parameters isEqualToDictionary:v9];
      }
      else {
        BOOL v11 = v9 == 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)_CDMDCSContextualPredicate;
  unint64_t v3 = [(_CDContextualPredicate *)&v5 hash];
  return [(NSString *)self->_identifier hash] - v3 + 32 * v3;
}

- (id)plistDictionary
{
  if (self->_parameters) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v3];
  [v4 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  parameters = self->_parameters;
  if (parameters) {
    [v4 setObject:parameters forKeyedSubscript:@"parameters"];
  }
  return v4;
}

- (_CDMDCSContextualPredicate)initWithPlistDictionary:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:@"identifier"];
  id v6 = [v4 objectForKeyedSubscript:@"parameters"];

  id v7 = [(_CDMDCSContextualPredicate *)self initWithIdentifier:v5 parameters:v6];
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:parameters:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EC9B000, v0, v1, "Invalid predicate parameters: %@", v2, v3, v4, v5, v6);
}

- (void)initWithIdentifier:parameters:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_18EC9B000, v2, v3, "Unexpected class for workout types (%@), expected NSSet or NSArray.", v4, v5, v6, v7, v8);
}

- (void)initWithIdentifier:parameters:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EC9B000, v0, v1, "Unknown predicate identifier: %@", v2, v3, v4, v5, v6);
}

@end