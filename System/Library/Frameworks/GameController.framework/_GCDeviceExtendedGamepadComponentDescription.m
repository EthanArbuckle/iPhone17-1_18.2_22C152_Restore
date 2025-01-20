@interface _GCDeviceExtendedGamepadComponentDescription
+ (BOOL)supportsSecureCoding;
- (id)createWithContext:(id)a3;
@end

@implementation _GCDeviceExtendedGamepadComponentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)createWithContext:(id)a3
{
  id v62 = a3;
  bzero(v67, 0x638uLL);
  v4 = [GCExtendedGamepad alloc];
  v5 = [(_GCDevicePhysicalInputComponentDescription *)self identifier];
  v6 = [(GCExtendedGamepad *)v4 initWithIdentifier:v5 info:v67];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v7 = [(_GCDevicePhysicalInputComponentDescription *)self elementDescriptions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v64;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v63 + 1) + 8 * v10);
        v12 = [v11 name];
        int v13 = [v12 isEqualToString:@"Button A"];

        if (v13)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_button0"];
LABEL_38:

          goto LABEL_39;
        }
        v15 = [v11 name];
        int v16 = [v15 isEqualToString:@"Button B"];

        if (v16)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_button1"];
          goto LABEL_38;
        }
        v17 = [v11 name];
        int v18 = [v17 isEqualToString:@"Button X"];

        if (v18)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_button2"];
          goto LABEL_38;
        }
        v19 = [v11 name];
        int v20 = [v19 isEqualToString:@"Button Y"];

        if (v20)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_button3"];
          goto LABEL_38;
        }
        v21 = [v11 name];
        int v22 = [v21 isEqualToString:@"Left Shoulder"];

        if (v22)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_leftShoulder"];
          goto LABEL_38;
        }
        v23 = [v11 name];
        int v24 = [v23 isEqualToString:@"Right Shoulder"];

        if (v24)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_rightShoulder"];
          goto LABEL_38;
        }
        v25 = [v11 name];
        int v26 = [v25 isEqualToString:@"Left Trigger"];

        if (v26)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_leftTrigger"];
          goto LABEL_38;
        }
        v27 = [v11 name];
        int v28 = [v27 isEqualToString:@"Right Trigger"];

        if (v28)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_rightTrigger"];
          goto LABEL_38;
        }
        v29 = [v11 name];
        int v30 = [v29 isEqualToString:@"Left Thumbstick Button"];

        if (v30)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_leftThumbstickButton"];
          goto LABEL_38;
        }
        v31 = [v11 name];
        int v32 = [v31 isEqualToString:@"Right Thumbstick Button"];

        if (v32)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_rightThumbstickButton"];
          goto LABEL_38;
        }
        v33 = [v11 name];
        int v34 = [v33 isEqualToString:@"Direction Pad"];

        if (v34)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _directionPadWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_dpad"];
          goto LABEL_38;
        }
        v35 = [v11 name];
        int v36 = [v35 isEqualToString:@"Left Thumbstick"];

        if (v36)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _directionPadWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_leftThumbstick"];
          goto LABEL_38;
        }
        v37 = [v11 name];
        int v38 = [v37 isEqualToString:@"Right Thumbstick"];

        if (v38)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _directionPadWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_rightThumbstick"];
          goto LABEL_38;
        }
        v39 = [v11 name];
        int v40 = [v39 isEqualToString:@"Button Menu"];

        if (v40)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_buttonMenu"];
          goto LABEL_38;
        }
        v41 = [v11 name];
        int v42 = [v41 isEqualToString:@"Button Options"];

        if (v42)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_buttonOptions"];
          goto LABEL_38;
        }
        v43 = [v11 name];
        int v44 = [v43 isEqualToString:@"Button Home"];

        if (v44)
        {
          v14 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
          [(GCExtendedGamepad *)v6 setValue:v14 forKey:@"_buttonHome"];
          goto LABEL_38;
        }
        v45 = [v11 name];
        int v46 = [v45 isEqualToString:@"Left Bumper"];

        if (v46) {
          goto LABEL_48;
        }
        v47 = [v11 name];
        char v48 = [v47 isEqualToString:@"Right Bumper"];

        if (v48) {
          goto LABEL_48;
        }
        v49 = [v11 name];
        char v50 = [v49 isEqualToString:@"Back Left Button 0"];

        if (v50) {
          goto LABEL_48;
        }
        v51 = [v11 name];
        char v52 = [v51 isEqualToString:@"Back Right Button 0"];

        if (v52) {
          goto LABEL_48;
        }
        v53 = [v11 name];
        char v54 = [v53 isEqualToString:@"Back Left Button 1"];

        if ((v54 & 1) != 0
          || ([v11 name],
              v55 = objc_claimAutoreleasedReturnValue(),
              char v56 = [v55 isEqualToString:@"Back Right Button 1"],
              v55,
              (v56 & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
LABEL_48:
          id v57 = [(GCPhysicalInputProfile *)v6 _buttonWithDescription:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v58 = [(GCPhysicalInputProfile *)v6 _directionPadWithDescription:v11];
          }
        }
LABEL_39:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v59 = [v7 countByEnumeratingWithState:&v63 objects:v68 count:16];
      uint64_t v8 = v59;
    }
    while (v59);
  }

  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&v67[i]);

  return v6;
}

@end