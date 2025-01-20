@interface HFCharacteristicWriteActionBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)canUpdateWithActionBuilder:(id)a3;
- (BOOL)hasSameTargetAsAction:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (BOOL)updateWithActionBuilder:(id)a3;
- (HFCharacteristicWriteActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HMCharacteristic)characteristic;
- (NSCopying)targetValue;
- (id)commitItem;
- (id)compareToObject:(id)a3;
- (id)containedAccessoryRepresentables;
- (id)copyForCreatingNewAction;
- (id)createNewAction;
- (id)description;
- (id)performValidation;
- (id)validationError;
- (unint64_t)hash;
- (void)_logInvalidNumericTargetValue:(void *)a3 clamped:(int)a4 valid:(void *)a5 metadata:;
- (void)_validateAndSetTargetValue:(id *)a1;
- (void)setCharacteristic:(id)a3;
- (void)setTargetValue:(id)a3;
@end

@implementation HFCharacteristicWriteActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFCharacteristicWriteActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HFCharacteristicWriteActionBuilder;
  v4 = [(HFItemBuilder *)&v13 initWithExistingObject:a3 inHome:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HFActionBuilder *)v4 action];
    uint64_t v7 = [v6 characteristic];
    characteristic = v5->_characteristic;
    v5->_characteristic = (HMCharacteristic *)v7;

    v9 = [(HFActionBuilder *)v5 action];
    uint64_t v10 = [v9 targetValue];
    targetValue = v5->_targetValue;
    v5->_targetValue = (NSCopying *)v10;
  }
  return v5;
}

- (id)copyForCreatingNewAction
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = [(HFItemBuilder *)self home];
  v5 = (void *)[v3 initWithHome:v4];

  v6 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  [v5 setCharacteristic:v6];

  uint64_t v7 = [(HFCharacteristicWriteActionBuilder *)self targetValue];
  [v5 setTargetValue:v7];

  return v5;
}

- (void)setCharacteristic:(id)a3
{
  v5 = (HMCharacteristic *)a3;
  v6 = [(HFActionBuilder *)self action];

  if (v6)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HFActionBuilder.m" lineNumber:213 description:@"Cannot change the characteristic for an existing action!"];
  }
  characteristic = self->_characteristic;
  self->_characteristic = v5;

  id v9 = [(HFCharacteristicWriteActionBuilder *)self targetValue];
  -[HFCharacteristicWriteActionBuilder _validateAndSetTargetValue:]((id *)&self->super.super.super.isa, v9);
}

- (void)_validateAndSetTargetValue:(id *)a1
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    v5 = [a1 characteristic];

    if (v5)
    {
      if (v4)
      {
        v6 = [a1 characteristic];
        uint64_t v7 = [v6 metadata];

        if (!v7)
        {
          objc_storeStrong(a1 + 4, a2);
          id v9 = HFLogForCategory(0x29uLL);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            v60 = (objc_class *)objc_opt_class();
            v61 = NSStringFromClass(v60);
            v62 = [a1 characteristic];
            *(_DWORD *)buf = 138543874;
            v85 = v61;
            __int16 v86 = 2112;
            id v87 = v4;
            __int16 v88 = 2112;
            id v89 = v62;
            _os_log_fault_impl(&dword_20B986000, v9, OS_LOG_TYPE_FAULT, "%{public}@ tried to validate target value %@ but missing metadata on characteristic %@", buf, 0x20u);
          }
          goto LABEL_49;
        }
        if (objc_msgSend(v7, "hf_isValidValue:", v4))
        {
          objc_storeStrong(a1 + 4, a2);
LABEL_49:

          goto LABEL_50;
        }
        id v10 = v4;
        BOOL v11 = +[HFUtilities hasInternalDiagnostics];
        v12 = HFLogForCategory(0x29uLL);
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
        if (v11)
        {
          if (!v13) {
            goto LABEL_16;
          }
          v14 = (objc_class *)objc_opt_class();
          v15 = NSStringFromClass(v14);
          v16 = [a1 characteristic];
          v17 = [MEMORY[0x263F08B88] callStackSymbols];
          *(_DWORD *)buf = 138413058;
          v85 = v15;
          __int16 v86 = 2112;
          id v87 = v10;
          __int16 v88 = 2112;
          id v89 = v16;
          __int16 v90 = 2112;
          id v91 = v17;
          _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "%@ received invalid target value %@ for characteristic %@. Stack: %@", buf, 0x2Au);
        }
        else
        {
          if (!v13) {
            goto LABEL_16;
          }
          v73 = (objc_class *)objc_opt_class();
          v15 = NSStringFromClass(v73);
          *(_DWORD *)buf = 138412290;
          v85 = v15;
          _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "%@ received invalid target value for characteristic.", buf, 0xCu);
        }

LABEL_16:
        objc_opt_class();
        id v18 = v10;
        unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          v20 = v18;
        }
        else {
          v20 = 0;
        }
        id v21 = v20;

        if (objc_msgSend(v7, "hf_isNumeric"))
        {
          uint64_t v22 = [v7 minimumValue];
          if (v22)
          {
            v23 = (void *)v22;
            v24 = [v7 maximumValue];
            int v25 = (v24 != 0) & isKindOfClass;

            if (v25 == 1)
            {
              v26 = [v7 minimumValue];
              [v26 doubleValue];
              double v28 = v27;

              [v21 doubleValue];
              double v30 = v29;
              v31 = [v7 maximumValue];
              [v31 doubleValue];
              double v33 = v32;

              if (v30 >= v33) {
                double v34 = v33;
              }
              else {
                double v34 = v30;
              }
              if (v28 >= v34) {
                double v34 = v28;
              }
              id v35 = [NSNumber numberWithDouble:v34];
              int v36 = objc_msgSend(v7, "hf_isValidValue:", v35);
              -[HFCharacteristicWriteActionBuilder _logInvalidNumericTargetValue:clamped:valid:metadata:](a1, v21, v35, v36, v7);
              if (v36) {
                goto LABEL_58;
              }
            }
          }
        }
        v37 = [v7 validValues];
        if (v37 && objc_msgSend(v7, "hf_isNumeric"))
        {

          if (v21)
          {
            id v76 = v18;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            v78 = v7;
            v38 = [v7 validValues];
            uint64_t v39 = [v38 countByEnumeratingWithState:&v79 objects:v83 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              v41 = 0;
              uint64_t v42 = *(void *)v80;
              double v43 = 1.79769313e308;
              do
              {
                for (uint64_t i = 0; i != v40; ++i)
                {
                  if (*(void *)v80 != v42) {
                    objc_enumerationMutation(v38);
                  }
                  v45 = *(void **)(*((void *)&v79 + 1) + 8 * i);
                  [v45 doubleValue];
                  double v47 = v46;
                  [v21 doubleValue];
                  double v49 = vabdd_f64(v47, v48);
                  if (v49 < v43)
                  {
                    id v50 = v45;

                    double v43 = v49;
                    v41 = v50;
                  }
                }
                uint64_t v40 = [v38 countByEnumeratingWithState:&v79 objects:v83 count:16];
              }
              while (v40);
            }
            else
            {
              v41 = 0;
            }

            id v77 = v21;
            id v35 = v41;
            id v63 = v78;
            BOOL v64 = +[HFUtilities hasInternalDiagnostics];
            v65 = HFLogForCategory(0x29uLL);
            BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
            if (v64)
            {
              id v18 = v76;
              if (v66)
              {
                v67 = (objc_class *)objc_opt_class();
                NSStringFromClass(v67);
                v68 = id v75 = v63;
                v69 = [a1 characteristic];
                *(_DWORD *)buf = 138544130;
                v85 = v68;
                __int16 v86 = 2112;
                id v87 = v69;
                __int16 v88 = 2112;
                id v89 = v35;
                __int16 v90 = 2112;
                id v91 = v77;
                _os_log_impl(&dword_20B986000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ for %@: Found closest valid value %@ for requested target value %@", buf, 0x2Au);

                id v63 = v75;
              }
            }
            else
            {
              id v18 = v76;
              if (v66)
              {
                v70 = (objc_class *)objc_opt_class();
                v71 = NSStringFromClass(v70);
                *(_DWORD *)buf = 138543362;
                v85 = v71;
                _os_log_impl(&dword_20B986000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@: Found closest valid value for requested target value", buf, 0xCu);
              }
            }

            uint64_t v7 = v78;
            if (v35)
            {
LABEL_58:
              id v72 = a1[4];
              a1[4] = v35;

              goto LABEL_48;
            }
          }
        }
        else
        {
        }
        id v51 = v18;
        BOOL v52 = +[HFUtilities hasInternalDiagnostics];
        v53 = HFLogForCategory(0x29uLL);
        BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_FAULT);
        if (v52)
        {
          if (v54)
          {
            v55 = (objc_class *)objc_opt_class();
            v56 = NSStringFromClass(v55);
            v57 = [a1 characteristic];
            [MEMORY[0x263F08B88] callStackSymbols];
            v59 = v58 = v7;
            *(_DWORD *)buf = 138413058;
            v85 = v56;
            __int16 v86 = 2112;
            id v87 = v57;
            __int16 v88 = 2112;
            id v89 = v51;
            __int16 v90 = 2112;
            id v91 = v59;
            _os_log_fault_impl(&dword_20B986000, v53, OS_LOG_TYPE_FAULT, "%@ for %@: Failed to automatically find a valid value similar to %@. Keeping it. Stack: %@", buf, 0x2Au);

            uint64_t v7 = v58;
LABEL_62:
          }
        }
        else if (v54)
        {
          v74 = (objc_class *)objc_opt_class();
          v56 = NSStringFromClass(v74);
          *(_DWORD *)buf = 138412290;
          v85 = v56;
          _os_log_fault_impl(&dword_20B986000, v53, OS_LOG_TYPE_FAULT, "%@: Failed to automatically find a valid value similar to assigned value. Keeping it", buf, 0xCu);
          goto LABEL_62;
        }

        objc_storeStrong(a1 + 4, a2);
LABEL_48:

        goto LABEL_49;
      }
      id v8 = a1[4];
      a1[4] = 0;
    }
    else
    {
      objc_storeStrong(a1 + 4, a2);
    }
  }
LABEL_50:
}

- (void)setTargetValue:(id)a3
{
  v5 = (NSCopying *)a3;
  v6 = v5;
  if (self->_targetValue != v5)
  {
    id v9 = v5;
    if (!v5)
    {
      uint64_t v7 = [(HFActionBuilder *)self action];

      if (v7)
      {
        id v8 = [MEMORY[0x263F08690] currentHandler];
        [v8 handleFailureInMethod:a2 object:self file:@"HFActionBuilder.m" lineNumber:221 description:@"Cannot set target value to nil for an existing action!"];
      }
    }
    -[HFCharacteristicWriteActionBuilder _validateAndSetTargetValue:]((id *)&self->super.super.super.isa, v9);
    v6 = v9;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)_logInvalidNumericTargetValue:(void *)a3 clamped:(int)a4 valid:(void *)a5 metadata:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  BOOL v12 = +[HFUtilities hasInternalDiagnostics];
  BOOL v13 = HFLogForCategory(0x29uLL);
  v14 = v13;
  if (!v12)
  {
    BOOL v20 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (!v20) {
        goto LABEL_14;
      }
      id v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      int v26 = 138543362;
      double v27 = v22;
      v23 = "%{public}@: Clamping";
    }
    else
    {
      if (!v20) {
        goto LABEL_14;
      }
      int v25 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v25);
      int v26 = 138543362;
      double v27 = v22;
      v23 = "%{public}@: Failed clamping";
    }
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v26, 0xCu);

    goto LABEL_14;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v24 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v24);
    v17 = [a1 characteristic];
    id v18 = [v11 minimumValue];
    v19 = [v11 maximumValue];
    int v26 = 138544386;
    double v27 = v16;
    __int16 v28 = 2112;
    double v29 = v17;
    __int16 v30 = 2112;
    v31 = v18;
    __int16 v32 = 2112;
    double v33 = v19;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "%{public}@ for %@: Failed to clamp to (%@, %@) as it produced an invalid value %@", (uint8_t *)&v26, 0x34u);
    goto LABEL_5;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [a1 characteristic];
    id v18 = [v11 minimumValue];
    v19 = [v11 maximumValue];
    int v26 = 138413314;
    double v27 = v16;
    __int16 v28 = 2112;
    double v29 = v17;
    __int16 v30 = 2112;
    v31 = v18;
    __int16 v32 = 2112;
    double v33 = v19;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "%@ for %@: Clamping to (%@, %@) resulting in %@", (uint8_t *)&v26, 0x34u);
LABEL_5:
  }
LABEL_14:
}

- (id)description
{
  id v3 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  id v4 = [v3 characteristicType];

  if (+[HFUtilities hasInternalDiagnostics])
  {
    v5 = [MEMORY[0x263F0E248] localizedDescriptionForCharacteristicType:v4];
    v6 = [v5 lowercaseString];
  }
  else
  {
    v6 = @"<redacted>";
  }
  uint64_t v7 = NSString;
  id v8 = [(HFCharacteristicWriteActionBuilder *)self targetValue];
  id v9 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  id v10 = [v9 service];
  id v11 = [v10 name];
  BOOL v12 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  BOOL v13 = [v12 service];
  v14 = [v13 uniqueIdentifier];
  v15 = [v7 stringWithFormat:@"<characteristic %@ set to targetValue: %@ in service: '%@' (%@)>", v6, v8, v11, v14];

  return v15;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 characteristic];
    uint64_t v7 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
    if ([v6 isEqual:v7])
    {
      id v8 = [v5 targetValue];
      BOOL v9 = v8 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  id v4 = a3;
  if ([(HFCharacteristicWriteActionBuilder *)self canUpdateWithActionBuilder:v4])
  {
    id v5 = v4;
    v6 = [v5 targetValue];
    uint64_t v7 = [(HFCharacteristicWriteActionBuilder *)self targetValue];

    BOOL v8 = v6 == v7;
    BOOL v9 = v6 != v7;
    if (!v8)
    {
      id v10 = [v5 targetValue];
      [(HFCharacteristicWriteActionBuilder *)self setTargetValue:v10];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)requiresDeviceUnlock
{
  v2 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  char v3 = [v2 requiresDeviceUnlock];

  return v3;
}

- (id)createNewAction
{
  uint64_t v3 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  if (v3
    && (id v4 = (void *)v3,
        [(HFCharacteristicWriteActionBuilder *)self targetValue],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = objc_alloc(MEMORY[0x263F0E290]);
    uint64_t v7 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
    BOOL v8 = [(HFCharacteristicWriteActionBuilder *)self targetValue];
    BOOL v9 = (void *)[v6 initWithCharacteristic:v7 targetValue:v8];
  }
  else
  {
    uint64_t v7 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
    BOOL v8 = [(HFCharacteristicWriteActionBuilder *)self targetValue];
    NSLog(&cfstr_Hfcharacterist_12.isa, self, v7, v8);
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    BOOL v8 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
    BOOL v9 = [v7 characteristic];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)containedAccessoryRepresentables
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v3 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  id v4 = [v3 service];
  id v5 = objc_msgSend(v2, "na_arrayWithSafeObject:", v4);

  return v5;
}

- (id)performValidation
{
  return [(HFItemBuilder *)self lazy_verifyPropertiesAreSet:&unk_26C0F80E0];
}

- (id)validationError
{
  return [(HFItemBuilder *)self verifyPropertiesAreSet:&unk_26C0F80F8];
}

- (id)commitItem
{
  uint64_t v3 = [(HFCharacteristicWriteActionBuilder *)self performValidation];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke;
  v7[3] = &unk_26408CDC8;
  v7[4] = self;
  id v4 = [v3 flatMap:v7];
  id v5 = [v4 recover:&__block_literal_global_96];

  return v5;
}

id __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) action];

  if (v2)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_2;
    v10[3] = &unk_26408CD50;
    v10[4] = *(void *)(a1 + 32);
    uint64_t v3 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_3;
    v9[3] = &unk_26408CDC8;
    v9[4] = *(void *)(a1 + 32);
    id v4 = [v3 flatMap:v9];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) createNewAction];
    [*(id *)(a1 + 32) setAction:v5];

    id v6 = (void *)MEMORY[0x263F58190];
    id v7 = [*(id *)(a1 + 32) action];
    id v4 = [v6 futureWithResult:v7];
  }
  return v4;
}

void __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 action];
  id v5 = [*(id *)(a1 + 32) targetValue];
  [v6 updateTargetValue:v5 completionHandler:v4];
}

id __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58190];
  v2 = [*(id *)(a1 + 32) action];
  uint64_t v3 = [v1 futureWithResult:v2];

  return v3;
}

id __48__HFCharacteristicWriteActionBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = objc_msgSend(a2, "hf_errorWithOperationType:failedItemName:", @"HFOperationMediaSelection", 0);
  id v4 = [v2 futureWithError:v3];

  return v4;
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (NSCopying)targetValue
{
  return self->_targetValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFCharacteristicWriteActionBuilder;
  id v5 = [(HFActionBuilder *)&v15 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    id v6 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
    id v7 = [v6 uniqueIdentifier];
    BOOL v8 = [v4 characteristic];
    BOOL v9 = [v8 uniqueIdentifier];
    char v10 = +[HFPropertyDifference compareObjectA:v7 toObjectB:v9 key:@"characteristic.uniqueIdentifier" priority:3];
    [v5 add:v10];

    id v11 = [(HFCharacteristicWriteActionBuilder *)self targetValue];
    BOOL v12 = [v4 targetValue];
    BOOL v13 = +[HFPropertyDifference compareObjectA:v11 toObjectB:v12 key:@"targetValue" priority:3];
    [v5 add:v13];
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = [(HFCharacteristicWriteActionBuilder *)self characteristic];
  id v5 = [v4 uniqueIdentifier];
  unint64_t v6 = [v5 hash] ^ v3;

  return v6;
}

@end