@interface _GCGamepadEventImpl
- (BOOL)hasValidValueForElement:(int64_t)a3;
- (NSString)debugDescription;
- (_GCGamepadEventImpl)initWithGamepadEvent:(id)a3;
- (_GCGamepadEventImpl)initWithTimeStamp:(unint64_t)a3 inputs:(float)a4[47] validMask:(unint64_t)a5;
- (float)buttonAValue;
- (float)buttonBValue;
- (float)buttonBackLeftPrimary;
- (float)buttonBackLeftSecondary;
- (float)buttonBackRightPrimary;
- (float)buttonBackRightSecondary;
- (float)buttonHome;
- (float)buttonLeftBumper;
- (float)buttonLeftShoulder;
- (float)buttonMenu;
- (float)buttonOptions;
- (float)buttonRightBumper;
- (float)buttonRightShoulder;
- (float)buttonSpecial0;
- (float)buttonSpecial1;
- (float)buttonSpecial10;
- (float)buttonSpecial11;
- (float)buttonSpecial12;
- (float)buttonSpecial13;
- (float)buttonSpecial14;
- (float)buttonSpecial15;
- (float)buttonSpecial2;
- (float)buttonSpecial3;
- (float)buttonSpecial4;
- (float)buttonSpecial5;
- (float)buttonSpecial6;
- (float)buttonSpecial7;
- (float)buttonSpecial8;
- (float)buttonSpecial9;
- (float)buttonXValue;
- (float)buttonYValue;
- (float)dpadDownValue;
- (float)dpadLeftValue;
- (float)dpadRightValue;
- (float)dpadUpValue;
- (float)floatValueForElement:(int64_t)a3;
- (float)leftThumbstickButton;
- (float)leftThumbstickDown;
- (float)leftThumbstickLeft;
- (float)leftThumbstickRight;
- (float)leftThumbstickUp;
- (float)leftTrigger;
- (float)rightThumbstickButton;
- (float)rightThumbstickDown;
- (float)rightThumbstickLeft;
- (float)rightThumbstickRight;
- (float)rightThumbstickUp;
- (float)rightTrigger;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)timestamp;
- (void)setButtonAValue:(float)a3;
- (void)setButtonBValue:(float)a3;
- (void)setButtonBackLeftPrimary:(float)a3;
- (void)setButtonBackLeftSecondary:(float)a3;
- (void)setButtonBackRightPrimary:(float)a3;
- (void)setButtonBackRightSecondary:(float)a3;
- (void)setButtonHome:(float)a3;
- (void)setButtonLeftBumper:(float)a3;
- (void)setButtonLeftShoulder:(float)a3;
- (void)setButtonMenu:(float)a3;
- (void)setButtonOptions:(float)a3;
- (void)setButtonRightBumper:(float)a3;
- (void)setButtonRightShoulder:(float)a3;
- (void)setButtonSpecial0:(float)a3;
- (void)setButtonSpecial10:(float)a3;
- (void)setButtonSpecial11:(float)a3;
- (void)setButtonSpecial12:(float)a3;
- (void)setButtonSpecial13:(float)a3;
- (void)setButtonSpecial14:(float)a3;
- (void)setButtonSpecial15:(float)a3;
- (void)setButtonSpecial1:(float)a3;
- (void)setButtonSpecial2:(float)a3;
- (void)setButtonSpecial3:(float)a3;
- (void)setButtonSpecial4:(float)a3;
- (void)setButtonSpecial5:(float)a3;
- (void)setButtonSpecial6:(float)a3;
- (void)setButtonSpecial7:(float)a3;
- (void)setButtonSpecial8:(float)a3;
- (void)setButtonSpecial9:(float)a3;
- (void)setButtonXValue:(float)a3;
- (void)setButtonYValue:(float)a3;
- (void)setDpadDownValue:(float)a3;
- (void)setDpadLeftValue:(float)a3;
- (void)setDpadRightValue:(float)a3;
- (void)setDpadUpValue:(float)a3;
- (void)setFloatValue:(float)a3 forElement:(int64_t)a4;
- (void)setLeftThumbstickButton:(float)a3;
- (void)setLeftThumbstickDown:(float)a3;
- (void)setLeftThumbstickLeft:(float)a3;
- (void)setLeftThumbstickRight:(float)a3;
- (void)setLeftThumbstickUp:(float)a3;
- (void)setLeftTrigger:(float)a3;
- (void)setRightThumbstickButton:(float)a3;
- (void)setRightThumbstickDown:(float)a3;
- (void)setRightThumbstickLeft:(float)a3;
- (void)setRightThumbstickRight:(float)a3;
- (void)setRightThumbstickUp:(float)a3;
- (void)setRightTrigger:(float)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation _GCGamepadEventImpl

- (float)dpadUpValue
{
  return self->_data.buttons[0];
}

- (void)setDpadUpValue:(float)a3
{
  self->_data.mask |= 1uLL;
  self->_data.buttons[0] = a3;
}

- (float)dpadDownValue
{
  return self->_data.buttons[1];
}

- (void)setDpadDownValue:(float)a3
{
  self->_data.mask |= 2uLL;
  self->_data.buttons[1] = a3;
}

- (float)dpadLeftValue
{
  return self->_data.buttons[2];
}

- (void)setDpadLeftValue:(float)a3
{
  self->_data.mask |= 4uLL;
  self->_data.buttons[2] = a3;
}

- (float)dpadRightValue
{
  return self->_data.buttons[3];
}

- (void)setDpadRightValue:(float)a3
{
  self->_data.mask |= 8uLL;
  self->_data.buttons[3] = a3;
}

- (float)buttonAValue
{
  return self->_data.buttons[4];
}

- (void)setButtonAValue:(float)a3
{
  self->_data.mask |= 0x10uLL;
  self->_data.buttons[4] = a3;
}

- (float)buttonBValue
{
  return self->_data.buttons[5];
}

- (void)setButtonBValue:(float)a3
{
  self->_data.mask |= 0x20uLL;
  self->_data.buttons[5] = a3;
}

- (float)buttonXValue
{
  return self->_data.buttons[6];
}

- (void)setButtonXValue:(float)a3
{
  self->_data.mask |= 0x40uLL;
  self->_data.buttons[6] = a3;
}

- (float)buttonYValue
{
  return self->_data.buttons[7];
}

- (void)setButtonYValue:(float)a3
{
  self->_data.mask |= 0x80uLL;
  self->_data.buttons[7] = a3;
}

- (float)buttonLeftShoulder
{
  return self->_data.buttons[8];
}

- (void)setButtonLeftShoulder:(float)a3
{
  self->_data.mask |= 0x100uLL;
  self->_data.buttons[8] = a3;
}

- (float)buttonRightShoulder
{
  return self->_data.buttons[9];
}

- (void)setButtonRightShoulder:(float)a3
{
  self->_data.mask |= 0x200uLL;
  self->_data.buttons[9] = a3;
}

- (float)leftThumbstickUp
{
  return self->_data.buttons[10];
}

- (void)setLeftThumbstickUp:(float)a3
{
  self->_data.mask |= 0x400uLL;
  self->_data.buttons[10] = a3;
}

- (float)leftThumbstickDown
{
  return self->_data.buttons[11];
}

- (void)setLeftThumbstickDown:(float)a3
{
  self->_data.mask |= 0x800uLL;
  self->_data.buttons[11] = a3;
}

- (float)leftThumbstickLeft
{
  return self->_data.buttons[12];
}

- (void)setLeftThumbstickLeft:(float)a3
{
  self->_data.mask |= 0x1000uLL;
  self->_data.buttons[12] = a3;
}

- (float)leftThumbstickRight
{
  return self->_data.buttons[13];
}

- (void)setLeftThumbstickRight:(float)a3
{
  self->_data.mask |= 0x2000uLL;
  self->_data.buttons[13] = a3;
}

- (float)rightThumbstickUp
{
  return self->_data.buttons[14];
}

- (void)setRightThumbstickUp:(float)a3
{
  self->_data.mask |= 0x4000uLL;
  self->_data.buttons[14] = a3;
}

- (float)rightThumbstickDown
{
  return self->_data.buttons[15];
}

- (void)setRightThumbstickDown:(float)a3
{
  self->_data.mask |= 0x8000uLL;
  self->_data.buttons[15] = a3;
}

- (float)rightThumbstickLeft
{
  return self->_data.buttons[16];
}

- (void)setRightThumbstickLeft:(float)a3
{
  self->_data.mask |= 0x10000uLL;
  self->_data.buttons[16] = a3;
}

- (float)rightThumbstickRight
{
  return self->_data.buttons[17];
}

- (void)setRightThumbstickRight:(float)a3
{
  self->_data.mask |= 0x20000uLL;
  self->_data.buttons[17] = a3;
}

- (float)leftTrigger
{
  return self->_data.buttons[18];
}

- (void)setLeftTrigger:(float)a3
{
  self->_data.mask |= 0x40000uLL;
  self->_data.buttons[18] = a3;
}

- (float)rightTrigger
{
  return self->_data.buttons[19];
}

- (void)setRightTrigger:(float)a3
{
  self->_data.mask |= 0x80000uLL;
  self->_data.buttons[19] = a3;
}

- (float)leftThumbstickButton
{
  return self->_data.buttons[20];
}

- (void)setLeftThumbstickButton:(float)a3
{
  self->_data.mask |= 0x100000uLL;
  self->_data.buttons[20] = a3;
}

- (float)rightThumbstickButton
{
  return self->_data.buttons[21];
}

- (void)setRightThumbstickButton:(float)a3
{
  self->_data.mask |= 0x200000uLL;
  self->_data.buttons[21] = a3;
}

- (float)buttonHome
{
  return self->_data.buttons[22];
}

- (void)setButtonHome:(float)a3
{
  self->_data.mask |= 0x400000uLL;
  self->_data.buttons[22] = a3;
}

- (float)buttonMenu
{
  return self->_data.buttons[23];
}

- (void)setButtonMenu:(float)a3
{
  self->_data.mask |= 0x800000uLL;
  self->_data.buttons[23] = a3;
}

- (float)buttonOptions
{
  return self->_data.buttons[24];
}

- (void)setButtonOptions:(float)a3
{
  self->_data.mask |= 0x1000000uLL;
  self->_data.buttons[24] = a3;
}

- (float)buttonSpecial0
{
  return self->_data.buttons[25];
}

- (void)setButtonSpecial0:(float)a3
{
  self->_data.mask |= 0x2000000uLL;
  self->_data.buttons[25] = a3;
}

- (float)buttonSpecial1
{
  return self->_data.buttons[26];
}

- (void)setButtonSpecial1:(float)a3
{
  self->_data.mask |= 0x4000000uLL;
  self->_data.buttons[26] = a3;
}

- (float)buttonSpecial2
{
  return self->_data.buttons[27];
}

- (void)setButtonSpecial2:(float)a3
{
  self->_data.mask |= 0x8000000uLL;
  self->_data.buttons[27] = a3;
}

- (float)buttonSpecial3
{
  return self->_data.buttons[28];
}

- (void)setButtonSpecial3:(float)a3
{
  self->_data.mask |= 0x10000000uLL;
  self->_data.buttons[28] = a3;
}

- (float)buttonSpecial4
{
  return self->_data.buttons[29];
}

- (void)setButtonSpecial4:(float)a3
{
  self->_data.mask |= 0x20000000uLL;
  self->_data.buttons[29] = a3;
}

- (float)buttonSpecial5
{
  return self->_data.buttons[30];
}

- (void)setButtonSpecial5:(float)a3
{
  self->_data.mask |= 0x40000000uLL;
  self->_data.buttons[30] = a3;
}

- (float)buttonSpecial6
{
  return self->_data.buttons[31];
}

- (void)setButtonSpecial6:(float)a3
{
  self->_data.mask |= 0x80000000uLL;
  self->_data.buttons[31] = a3;
}

- (float)buttonSpecial7
{
  return self->_data.buttons[32];
}

- (void)setButtonSpecial7:(float)a3
{
  self->_data.mask |= 0x100000000uLL;
  self->_data.buttons[32] = a3;
}

- (float)buttonSpecial8
{
  return self->_data.buttons[33];
}

- (void)setButtonSpecial8:(float)a3
{
  self->_data.mask |= 0x200000000uLL;
  self->_data.buttons[33] = a3;
}

- (float)buttonSpecial9
{
  return self->_data.buttons[34];
}

- (void)setButtonSpecial9:(float)a3
{
  self->_data.mask |= 0x400000000uLL;
  self->_data.buttons[34] = a3;
}

- (float)buttonSpecial10
{
  return self->_data.buttons[35];
}

- (void)setButtonSpecial10:(float)a3
{
  self->_data.mask |= 0x800000000uLL;
  self->_data.buttons[35] = a3;
}

- (float)buttonSpecial11
{
  return self->_data.buttons[36];
}

- (void)setButtonSpecial11:(float)a3
{
  self->_data.mask |= 0x1000000000uLL;
  self->_data.buttons[36] = a3;
}

- (float)buttonSpecial12
{
  return self->_data.buttons[37];
}

- (void)setButtonSpecial12:(float)a3
{
  self->_data.mask |= 0x2000000000uLL;
  self->_data.buttons[37] = a3;
}

- (float)buttonSpecial13
{
  return self->_data.buttons[38];
}

- (void)setButtonSpecial13:(float)a3
{
  self->_data.mask |= 0x4000000000uLL;
  self->_data.buttons[38] = a3;
}

- (float)buttonSpecial14
{
  return self->_data.buttons[39];
}

- (void)setButtonSpecial14:(float)a3
{
  self->_data.mask |= 0x8000000000uLL;
  self->_data.buttons[39] = a3;
}

- (float)buttonSpecial15
{
  return self->_data.buttons[40];
}

- (void)setButtonSpecial15:(float)a3
{
  self->_data.mask |= 0x10000000000uLL;
  self->_data.buttons[40] = a3;
}

- (float)buttonLeftBumper
{
  return self->_data.buttons[41];
}

- (void)setButtonLeftBumper:(float)a3
{
  self->_data.mask |= 0x20000000000uLL;
  self->_data.buttons[41] = a3;
}

- (float)buttonRightBumper
{
  return self->_data.buttons[42];
}

- (void)setButtonRightBumper:(float)a3
{
  self->_data.mask |= 0x40000000000uLL;
  self->_data.buttons[42] = a3;
}

- (float)buttonBackLeftPrimary
{
  return self->_data.buttons[43];
}

- (void)setButtonBackLeftPrimary:(float)a3
{
  self->_data.mask |= 0x80000000000uLL;
  self->_data.buttons[43] = a3;
}

- (float)buttonBackLeftSecondary
{
  return self->_data.buttons[44];
}

- (void)setButtonBackLeftSecondary:(float)a3
{
  self->_data.mask |= 0x100000000000uLL;
  self->_data.buttons[44] = a3;
}

- (float)buttonBackRightPrimary
{
  return self->_data.buttons[45];
}

- (void)setButtonBackRightPrimary:(float)a3
{
  self->_data.mask |= 0x200000000000uLL;
  self->_data.buttons[45] = a3;
}

- (float)buttonBackRightSecondary
{
  return self->_data.buttons[46];
}

- (void)setButtonBackRightSecondary:(float)a3
{
  self->_data.mask |= 0x400000000000uLL;
  self->_data.buttons[46] = a3;
}

- (_GCGamepadEventImpl)initWithTimeStamp:(unint64_t)a3 inputs:(float)a4[47] validMask:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_GCGamepadEventImpl;
  result = [(_GCGamepadEventImpl *)&v10 init];
  if (result)
  {
    uint64_t v9 = 0;
    result->_timestamp = a3;
    result->_data.mask = a5;
    do
    {
      result->_data.buttons[v9] = a4[v9];
      ++v9;
    }
    while (v9 != 47);
  }
  return result;
}

- (_GCGamepadEventImpl)initWithGamepadEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCGamepadEventImpl;
  v5 = [(_GCGamepadEventImpl *)&v9 init];
  if (v5)
  {
    uint64_t v6 = 0;
    v5->_timestamp = [v4 timestamp];
    do
    {
      v5->_data.mask |= (unint64_t)[v4 hasValidValueForElement:v6] << v6;
      [v4 floatValueForElement:v6];
      v5->_data.buttons[v6++] = v7;
    }
    while (v6 != 47);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id result = (id)objc_opt_new();
  *((void *)result + 1) = self->_timestamp;
  long long v5 = *(_OWORD *)&self->_data.buttons[34];
  long long v6 = *(_OWORD *)&self->_data.buttons[38];
  long long v7 = *(_OWORD *)&self->_data.buttons[42];
  *((void *)result + 26) = *(void *)&self->_data.buttons[46];
  *((_OWORD *)result + 11) = v6;
  *((_OWORD *)result + 12) = v7;
  *((_OWORD *)result + 10) = v5;
  long long v8 = *(_OWORD *)&self->_data.buttons[18];
  long long v9 = *(_OWORD *)&self->_data.buttons[22];
  long long v10 = *(_OWORD *)&self->_data.buttons[30];
  *((_OWORD *)result + 8) = *(_OWORD *)&self->_data.buttons[26];
  *((_OWORD *)result + 9) = v10;
  *((_OWORD *)result + 6) = v8;
  *((_OWORD *)result + 7) = v9;
  long long v11 = *(_OWORD *)&self->_data.buttons[2];
  long long v12 = *(_OWORD *)&self->_data.buttons[6];
  long long v13 = *(_OWORD *)&self->_data.buttons[14];
  *((_OWORD *)result + 4) = *(_OWORD *)&self->_data.buttons[10];
  *((_OWORD *)result + 5) = v13;
  *((_OWORD *)result + 2) = v11;
  *((_OWORD *)result + 3) = v12;
  *((_OWORD *)result + 1) = *(_OWORD *)&self->_data.mask;
  return result;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  [(_GCGamepadEventImpl *)self floatValueForElement:0];
  double v85 = v4;
  [(_GCGamepadEventImpl *)self floatValueForElement:1];
  double v84 = v5;
  [(_GCGamepadEventImpl *)self floatValueForElement:2];
  double v83 = v6;
  [(_GCGamepadEventImpl *)self floatValueForElement:3];
  double v82 = v7;
  [(_GCGamepadEventImpl *)self floatValueForElement:4];
  double v81 = v8;
  [(_GCGamepadEventImpl *)self floatValueForElement:5];
  double v80 = v9;
  [(_GCGamepadEventImpl *)self floatValueForElement:6];
  double v79 = v10;
  [(_GCGamepadEventImpl *)self floatValueForElement:7];
  double v78 = v11;
  [(_GCGamepadEventImpl *)self floatValueForElement:8];
  double v77 = v12;
  [(_GCGamepadEventImpl *)self floatValueForElement:9];
  double v76 = v13;
  [(_GCGamepadEventImpl *)self floatValueForElement:10];
  double v75 = v14;
  [(_GCGamepadEventImpl *)self floatValueForElement:11];
  double v74 = v15;
  [(_GCGamepadEventImpl *)self floatValueForElement:12];
  double v73 = v16;
  [(_GCGamepadEventImpl *)self floatValueForElement:13];
  double v72 = v17;
  [(_GCGamepadEventImpl *)self floatValueForElement:14];
  double v71 = v18;
  [(_GCGamepadEventImpl *)self floatValueForElement:15];
  double v70 = v19;
  [(_GCGamepadEventImpl *)self floatValueForElement:16];
  double v69 = v20;
  [(_GCGamepadEventImpl *)self floatValueForElement:17];
  double v68 = v21;
  [(_GCGamepadEventImpl *)self floatValueForElement:18];
  double v67 = v22;
  [(_GCGamepadEventImpl *)self floatValueForElement:19];
  double v66 = v23;
  [(_GCGamepadEventImpl *)self floatValueForElement:20];
  double v65 = v24;
  [(_GCGamepadEventImpl *)self floatValueForElement:21];
  double v64 = v25;
  [(_GCGamepadEventImpl *)self floatValueForElement:22];
  double v63 = v26;
  [(_GCGamepadEventImpl *)self floatValueForElement:23];
  double v62 = v27;
  [(_GCGamepadEventImpl *)self floatValueForElement:24];
  double v61 = v28;
  [(_GCGamepadEventImpl *)self floatValueForElement:25];
  double v60 = v29;
  [(_GCGamepadEventImpl *)self floatValueForElement:26];
  double v59 = v30;
  [(_GCGamepadEventImpl *)self floatValueForElement:27];
  double v58 = v31;
  [(_GCGamepadEventImpl *)self floatValueForElement:28];
  double v57 = v32;
  [(_GCGamepadEventImpl *)self floatValueForElement:29];
  double v56 = v33;
  [(_GCGamepadEventImpl *)self floatValueForElement:30];
  double v55 = v34;
  [(_GCGamepadEventImpl *)self floatValueForElement:31];
  double v54 = v35;
  [(_GCGamepadEventImpl *)self floatValueForElement:32];
  double v37 = v36;
  [(_GCGamepadEventImpl *)self floatValueForElement:33];
  double v39 = v38;
  [(_GCGamepadEventImpl *)self floatValueForElement:34];
  double v41 = v40;
  [(_GCGamepadEventImpl *)self floatValueForElement:35];
  double v43 = v42;
  [(_GCGamepadEventImpl *)self floatValueForElement:36];
  double v45 = v44;
  [(_GCGamepadEventImpl *)self floatValueForElement:37];
  double v47 = v46;
  [(_GCGamepadEventImpl *)self floatValueForElement:38];
  double v49 = v48;
  [(_GCGamepadEventImpl *)self floatValueForElement:39];
  double v51 = v50;
  [(_GCGamepadEventImpl *)self floatValueForElement:40];
  return +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<%@ %p> {\n\t.DpadUp: %f\n\t.DpadDown: %f\n\t.DpadLeft: %f\n\t.DpadRight: %f\n\t.ButtonA: %f\n\t.ButtonB: %f\n\t.ButtonX: %f\n\t.ButtonY: %f\n\t.LeftShoulder: %f\n\t.RightShoulder: %f\n\t.LeftThumbstickUp: %f\n\t.LeftThumbstickDown: %f\n\t.LeftThumbstickLeft: %f\n\t.LeftThumbstickRight: %f\n\t.RightThumbstickUp: %f\n\t.RightThumbstickDown: %f\n\t.RightThumbstickLeft: %f\n\t.RightThumbstickRight: %f\n\t.LeftTrigger: %f\n\t.RightTrigger: %f\n\t.LeftThumbstickButton: %f\n\t.RightThumbstickButton: %f\n\t.ButtonHome: %f\n\t.ButtonMenu: %f\n\t.ButtonOptions: %f\n\t.ButtonSpecial0: %f\n\t.ButtonSpecial1: %f\n\t.ButtonSpecial2: %f\n\t.ButtonSpecial3: %f\n\t.ButtonSpecial4: %f\n\t.ButtonSpecial5: %f\n\t.ButtonSpecial6: %f\n\t.ButtonSpecial7: %f\n\t.ButtonSpecial8: %f\n\t.ButtonSpecial9: %f\n\t.ButtonSpecial10: %f\n\t.ButtonSpecial11: %f\n\t.ButtonSpecial12: %f\n\t.ButtonSpecial13: %f\n\t.ButtonSearch: %f\n\t.ButtonShare: %f\n}", v3, self, *(void *)&v85, *(void *)&v84, *(void *)&v83, *(void *)&v82, *(void *)&v81, *(void *)&v80, *(void *)&v79, *(void *)&v78, *(void *)&v77, *(void *)&v76, *(void *)&v75, *(void *)&v74, *(void *)&v73, *(void *)&v72,
           *(void *)&v71,
           *(void *)&v70,
           *(void *)&v69,
           *(void *)&v68,
           *(void *)&v67,
           *(void *)&v66,
           *(void *)&v65,
           *(void *)&v64,
           *(void *)&v63,
           *(void *)&v62,
           *(void *)&v61,
           *(void *)&v60,
           *(void *)&v59,
           *(void *)&v58,
           *(void *)&v57,
           *(void *)&v56,
           *(void *)&v55,
           *(void *)&v54,
           *(void *)&v37,
           *(void *)&v39,
           *(void *)&v41,
           *(void *)&v43,
           *(void *)&v45,
           *(void *)&v47,
           *(void *)&v49,
           *(void *)&v51,
           v52);
}

- (BOOL)hasValidValueForElement:(int64_t)a3
{
  if (a3 > 46)
  {
    float v6 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v6 handleFailureInMethod:a2 object:self file:@"_GCGamepadEventImpl.m" lineNumber:214 description:@"Unknown element"];

    LOBYTE(v4) = 0;
  }
  else
  {
    return (self->_data.mask >> a3) & 1;
  }
  return v4;
}

- (float)floatValueForElement:(int64_t)a3
{
  if (a3 <= 46) {
    return self->_data.buttons[a3];
  }
  float v6 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  [v6 handleFailureInMethod:a2 object:self file:@"_GCGamepadEventImpl.m" lineNumber:223 description:@"Unknown element"];

  return 0.0;
}

- (void)setFloatValue:(float)a3 forElement:(int64_t)a4
{
  if (a4 > 46)
  {
    unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2 object:self file:@"_GCGamepadEventImpl.m" lineNumber:233 description:@"Unknown element"];
  }
  else
  {
    self->_data.mask |= 1 << a4;
    self->_data.buttons[a4] = a3;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

@end