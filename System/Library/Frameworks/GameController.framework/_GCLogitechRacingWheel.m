@interface _GCLogitechRacingWheel
- (BOOL)acquireDeviceWithError:(id *)a3;
- (BOOL)isAcquired;
- (_GCLogitechRacingWheel)initWithService:(unsigned int)a3;
- (id)eventObservers;
- (id)observeGamepadEvents:(id)a3;
- (void)dealloc;
- (void)relinquishDevice;
- (void)setEventObservers:(void *)a1;
@end

@implementation _GCLogitechRacingWheel

- (_GCLogitechRacingWheel)initWithService:(unsigned int)a3
{
  v3 = IOHIDDeviceCreate(kCFAllocatorDefault, a3);
  if (v3)
  {
    v4 = v3;
    v5 = IOHIDDeviceGetProperty(v3, @"VendorID");
    v6 = IOHIDDeviceGetProperty(v4, @"ProductID");
    if ([v5 unsignedIntValue] == 1133
      && [v6 unsignedIntValue] == 49774)
    {
      v142 = v6;
      v143 = v5;
      int v7 = 0;
    }
    else if ([v5 unsignedIntValue] == 1133 {
           && [v6 unsignedIntValue] == 49766)
    }
    {
      v142 = v6;
      v143 = v5;
      int v7 = 1;
    }
    else if ([v5 unsignedIntValue] == 1133 {
           && [v6 unsignedIntValue] == 49762)
    }
    {
      v142 = v6;
      v143 = v5;
      int v7 = 2;
    }
    else
    {
      if ([v5 unsignedIntValue] != 1133
        || [v6 unsignedIntValue] != 49743)
      {
        CFRelease(v4);
        v8 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v142 = v6;
      v143 = v5;
      int v7 = 3;
    }
    self->_mode = v7;
    self->_device = (__IOHIDDevice *)CFRetain(v4);
    v9 = (OS_dispatch_queue *)dispatch_queue_create("LogitechRacingWheel", 0);
    queue = self->_queue;
    self->_queue = v9;

    v11 = (NSArray *)objc_opt_new();
    eventObservers = self->_eventObservers;
    self->_eventObservers = v11;

    IOHIDDeviceRegisterInputReportWithTimeStampCallback(v4, &self->_report.g920.reportID, 64, (IOHIDReportWithTimeStampCallback)HandleReport, self);
    IOHIDDeviceSetDispatchQueue(v4, (dispatch_queue_t)self->_queue);
    v13 = objc_opt_new();
    v14 = v13;
    if (self->_mode >= 2u) {
      v15 = @"Logitech DRIVING FORCE";
    }
    else {
      v15 = @"Logitech TRUEFORCE";
    }
    [v13 setProductCategory:v15];
    v141 = v14;
    objc_msgSend(v14, "setVendorName:", IOHIDDeviceGetProperty(v4, @"Product"));
    v16 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"dpad"];
    v17 = +[NSSet setWithObject:@"Direction Pad"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v16, v17);

    _GCFConvertStringToLocalizedString();
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v16, v18);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"dpad");
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v16, v19);

    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventUpValueField:]((uint64_t)v16, 0);
    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventDownValueField:]((uint64_t)v16, 1);
    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventLeftValueField:]((uint64_t)v16, 2);
    v156 = v16;
    -[_GCDevicePhysicalInputDirectionPadElementParameters setEventRightValueField:]((uint64_t)v16, 3);
    v20 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.a"];
    v21 = +[NSSet setWithObject:@"Button A"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v20, v21);

    _GCFConvertStringToLocalizedString();
    v22 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v20, v22);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"a.circle");
    v23 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v20, v23);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v20, 0);
    v155 = v20;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v20, 4);
    v24 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.b"];
    v25 = +[NSSet setWithObject:@"Button B"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v24, v25);

    _GCFConvertStringToLocalizedString();
    v26 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v24, v26);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"b.circle");
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v24, v27);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v24, 0);
    v154 = v24;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v24, 5);
    v28 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.x"];
    v29 = +[NSSet setWithObject:@"Button X"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v28, v29);

    _GCFConvertStringToLocalizedString();
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v28, v30);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"x.circle");
    v31 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v28, v31);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v28, 0);
    v153 = v28;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v28, 6);
    v32 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.y"];
    v33 = +[NSSet setWithObject:@"Button Y"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v32, v33);

    _GCFConvertStringToLocalizedString();
    v34 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v32, v34);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"y.circle");
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v32, v35);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v32, 0);
    v152 = v32;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v32, 7);
    v36 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.l2"];
    v37 = +[NSSet setWithObject:@"Left Trigger"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v36, v37);

    _GCFConvertStringToLocalizedString();
    v38 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v36, v38);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v36, 0);
    v146 = v36;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v36, 18);
    v39 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.r2"];
    v40 = +[NSSet setWithObject:@"Right Trigger"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v39, v40);

    _GCFConvertStringToLocalizedString();
    v41 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v39, v41);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v39, 0);
    v145 = v39;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v39, 19);
    v42 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.l3"];
    v43 = +[NSSet setWithObject:@"Left Thumbstick Button"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v42, v43);

    _GCFConvertStringToLocalizedString();
    v44 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v42, v44);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v42, 0);
    v151 = v42;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v42, 20);
    v45 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.r3"];
    v46 = +[NSSet setWithObject:@"Right Thumbstick Button"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v45, v46);

    _GCFConvertStringToLocalizedString();
    v47 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v45, v47);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v45, 0);
    v150 = v45;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v45, 21);
    v48 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"leftPaddle"];
    v49 = +[NSSet setWithObjects:@"Left Paddle", @"Left Shoulder", 0];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v48, v49);

    _GCFConvertStringToLocalizedString();
    v50 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v48, v50);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v48, 0);
    v149 = v48;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v48, 8);
    v51 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"rightPaddle"];
    v52 = +[NSSet setWithObjects:@"Right Paddle", @"Right Shoulder", 0];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v51, v52);

    _GCFConvertStringToLocalizedString();
    v53 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v51, v53);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v51, 0);
    v148 = v51;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v51, 9);
    v54 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.home"];
    v55 = +[NSSet setWithObject:@"Button Home"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v54, v55);

    _GCFConvertStringToLocalizedString();
    v56 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v54, v56);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"house.circle");
    v57 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v54, v57);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v54, 0);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v54, 22);
    v58 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.menu"];
    v59 = +[NSSet setWithObject:@"Button Menu"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v58, v59);

    _GCFConvertStringToLocalizedString();
    v60 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v58, v60);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"line.horizontal.3.circle");
    v61 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v58, v61);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v58, 0);
    v144 = v58;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v58, 23);
    v62 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.options"];
    v63 = +[NSSet setWithObject:@"Button Options"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v62, v63);

    _GCFConvertStringToLocalizedString();
    v64 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v62, v64);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"ellipsis.circle");
    v65 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v62, v65);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v62, 0);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v62, 24);
    v66 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"button.share"];
    v67 = +[NSSet setWithObject:@"Button Share"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v66, v67);

    _GCFConvertStringToLocalizedString();
    v68 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v66, v68);

    unk_26D2ABAD4(&off_26D2ABD28, "symbolWithSFSymbolsName:", @"square.and.arrow.up");
    v69 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setSymbol:](v66, v69);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v66, 0);
    v139 = v66;
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v66, 40);
    v70 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"pedal.accelerator"];
    v71 = +[NSSet setWithObject:@"Accelerator Pedal"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v70, v71);

    _GCFConvertStringToLocalizedString();
    v72 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v70, v72);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v70, 1);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v70, 25);
    v73 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"pedal.brake"];
    v74 = +[NSSet setWithObject:@"Brake Pedal"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v73, v74);

    _GCFConvertStringToLocalizedString();
    v75 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v73, v75);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v73, 1);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v73, 26);
    v76 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"pedal.clutch"];
    v77 = +[NSSet setWithObject:@"Clutch Pedal"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v76, v77);

    _GCFConvertStringToLocalizedString();
    v78 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v76, v78);

    -[_GCDevicePhysicalInputButtonElementParameters setAnalog:]((uint64_t)v76, 1);
    -[_GCDevicePhysicalInputButtonElementParameters setEventPressedValueField:]((uint64_t)v76, 27);
    v79 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"wheel"];
    v80 = +[NSSet setWithObject:@"Steering Wheel"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v79, v80);

    _GCFConvertStringToLocalizedString();
    v81 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v79, v81);

    -[_GCSteeringWheelElementParameters setMaximumDegreesOfRotation:]((uint64_t)v79, 900.0);
    -[_GCSteeringWheelElementParameters setEventRotationValueField:]((uint64_t)v79, 28);
    v82 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"shifter"];
    v83 = +[NSSet setWithObject:@"Shifter"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v82, v83);

    -[_GCGearShifterElementParameters setPatternShifter:]((uint64_t)v82, 1);
    [(_GCGearShifterElementParameters *)(uint64_t)v82 setPositionRange:8];
    _GCFConvertStringToLocalizedString();
    v84 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v82, v84);

    -[_GCGearShifterElementParameters setEventShifterValueField:]((uint64_t)v82, 29);
    v133 = objc_opt_new();
    v140 = v54;
    v137 = v73;
    v138 = v70;
    v135 = v79;
    v136 = v76;
    v134 = v82;
    if (self->_mode)
    {
      v131 = [[_GCDevicePhysicalInputDirectionPadElement alloc] initWithParameters:v156];
      v129 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v155];
      v127 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v154];
      v120 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v153];
      v125 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v152];
      v118 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v146];
      v116 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v145];
      v114 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v151];
      v112 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v150];
      v124 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v149];
      v110 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v148];
      v108 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v54];
      v85 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v70];
      v86 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v73];
      v87 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v76];
      v88 = [[GCGearShifterElement alloc] initWithParameters:v82];
      v89 = [[GCSteeringWheelElement alloc] initWithParameters:v79];
      +[NSMutableSet setWithObjects:](&off_26D2B4EF0, "setWithObjects:", v131, v129, v127, v120, v125, v118, v116, v114, v112, v124, v110, v108, v85, v86, v87, v88, v89,
      v122 = 0);

      if (self->_mode == 2)
      {
        v91 = v145;
        v90 = v146;
        v92 = v144;
        v93 = v139;
        v94 = v122;
LABEL_25:
        v102 = [[_GCDevicePhysicalInput alloc] initWithFacade:v133 elements:v94];
        v103 = [[_GCDevicePhysicalInputComponent alloc] initWithIdentifier:&stru_26D27BBB8 defaultPhysicalInput:v102];
        [(_GCDevicePhysicalInputComponent *)v103 setGamepadEventSource:self];

        v159[0] = v141;
        v159[1] = v103;
        v104 = +[NSArray arrayWithObjects:v159 count:2];
        v158.receiver = self;
        v158.super_class = (Class)_GCLogitechRacingWheel;
        v105 = [(GCRacingWheel *)&v158 initWithComponents:v104];

        IOHIDDeviceActivate(v105->_device);
        v8 = v105;

        self = v8;
        v6 = v142;
        v5 = v143;
        goto LABEL_26;
      }
      v101 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v62];
      v94 = v122;
      [v122 addObject:v101];

      v93 = v139;
      v99 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v139];
      [v122 addObject:v99];
      v92 = v144;
      v91 = v145;
    }
    else
    {
      v123 = [[_GCDevicePhysicalInputDirectionPadElement alloc] initWithParameters:v156];
      v147 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v155];
      v132 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v154];
      v130 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v153];
      v128 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v152];
      v121 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v151];
      v119 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v150];
      v117 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v149];
      v115 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v148];
      v126 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v54];
      v111 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v144];
      v109 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v62];
      v113 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v70];
      v107 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v73];
      v95 = [[_GCDevicePhysicalInputButtonElement alloc] initWithParameters:v76];
      v96 = [[GCGearShifterElement alloc] initWithParameters:v82];
      v97 = [GCSteeringWheelElement alloc];
      v98 = v79;
      v99 = (_GCDevicePhysicalInputButtonElement *)v123;
      v100 = [(GCSteeringWheelElement *)v97 initWithParameters:v98];
      +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v123, v147, v132, v130, v128, v121, v119, v117, v115, v126, v111, v109, v113, v107, v95, v96, v100,
      v94 = 0);

      v92 = v144;
      v91 = v145;
      v93 = v139;
    }

    v90 = v146;
    goto LABEL_25;
  }
  v8 = 0;
LABEL_27:

  return v8;
}

- (void)dealloc
{
  device = self->_device;
  if (device)
  {
    IOHIDDeviceClose(device, 0);
    CFRelease(self->_device);
    self->_device = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_GCLogitechRacingWheel;
  [(_GCLogitechRacingWheel *)&v4 dealloc];
}

- (BOOL)acquireDeviceWithError:(id *)a3
{
  if (gc_isInternalBuild())
  {
    v10 = getGCLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      device = self->_device;
      *(_DWORD *)report = 138412290;
      *(void *)&report[4] = device;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "Aquire device: %@", report, 0xCu);
    }
  }
  IOReturn v5 = IOHIDDeviceOpen(self->_device, 0);
  if (v5)
  {
    if (a3)
    {
      uint64_t v6 = v5;
      v15[0] = NSLocalizedDescriptionKey;
      v15[1] = NSLocalizedFailureReasonErrorKey;
      v16[0] = @"Aquire device failed";
      v16[1] = @"Failed to open device";
      int v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      *a3 = +[NSError errorWithDomain:@"IOKitErrorDomain" code:v6 userInfo:v7];
    }
    return 0;
  }
  if (self->_mode == 3)
  {
    *(_DWORD *)&report[3] = 0;
    *(_DWORD *)report = 1016;
    if (IOHIDDeviceSetReport(self->_device, kIOHIDReportTypeOutput, 248, report, 7))
    {
      if (gc_isInternalBuild())
      {
        v12 = getGCLogger();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[_GCLogitechRacingWheel acquireDeviceWithError:]();
        }

        if (!a3) {
          return 0;
        }
      }
      else if (!a3)
      {
        return 0;
      }
      v13[0] = NSLocalizedDescriptionKey;
      v13[1] = NSLocalizedFailureReasonErrorKey;
      v14[0] = @"Aquire device failed";
      v14[1] = @"Failed to switch wheel mode to 900 degrses.";
      v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
      *a3 = +[NSError errorWithDomain:@"IOKitErrorDomain" code:0 userInfo:v9];

      return 0;
    }
  }
  BOOL result = 1;
  self->_isOpen = 1;
  return result;
}

- (void)relinquishDevice
{
  self->_isOpen = 0;
}

- (BOOL)isAcquired
{
  return self->_isOpen;
}

- (id)observeGamepadEvents:(id)a3
{
  IOReturn v5 = (void *)[a3 copy];
  if (!self) {
    goto LABEL_9;
  }
LABEL_2:
  for (id i = objc_getProperty(self, v4, 144, 1); ; id i = 0)
  {
    id v7 = i;
    v8 = (void *)MEMORY[0x223C6E420](v5);
    char v9 = [v7 containsObject:v8];

    if (v9) {
      break;
    }
    if (self) {
      id Property = objc_getProperty(self, v10, 144, 1);
    }
    else {
      id Property = 0;
    }
    v12 = (void *)[Property mutableCopy];
    v13 = (void *)MEMORY[0x223C6E420](v5);
    [v12 addObject:v13];

    if (self) {
      objc_setProperty_atomic_copy(self, v14, v12, 144);
    }

    if (self) {
      goto LABEL_2;
    }
LABEL_9:
    ;
  }
  v15 = [_GCObservation alloc];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __47___GCLogitechRacingWheel_observeGamepadEvents___block_invoke;
  v19[3] = &unk_26D22A870;
  v19[4] = self;
  id v20 = v5;
  id v16 = v5;
  v17 = [(_GCObservation *)v15 initWithCleanupHandler:v19];

  return v17;
}

- (id)eventObservers
{
  if (result) {
    return objc_getProperty(result, a2, 144, 1);
  }
  return result;
}

- (void)setEventObservers:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic_copy(a1, newValue, newValue, 144);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventObservers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)acquireDeviceWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_220998000, v0, OS_LOG_TYPE_ERROR, "Error issuing wheel mode switch command: %{mach.errno}d", v1, 8u);
}

@end