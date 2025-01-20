@interface MSVehicle
+ (Class)managedClass;
- (MSVehicle)initWithColorHex:(id)a3 currentVehicleState:(id)a4 dateOfVehicleIngestion:(id)a5 displayName:(id)a6 headUnitBluetoothIdentifier:(id)a7 headUnitMacAddress:(id)a8 iapIdentifier:(id)a9 lastStateUpdateDate:(id)a10 licensePlate:(id)a11 lprPowerType:(id)a12 lprVehicleType:(id)a13 manufacturer:(id)a14 model:(id)a15 pairedAppIdentifier:(id)a16 positionIndex:(int64_t)a17 powerByConnector:(id)a18 preferredChargingNetworks:(id)a19 siriIntentsIdentifier:(id)a20 supportedConnectors:(id)a21 vehicleIdentifier:(id)a22 vehicleType:(id)a23 year:(id)a24;
- (MSVehicle)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSVehicle)initWithStore:(id)a3 colorHex:(id)a4 currentVehicleState:(id)a5 dateOfVehicleIngestion:(id)a6 displayName:(id)a7 headUnitBluetoothIdentifier:(id)a8 headUnitMacAddress:(id)a9 iapIdentifier:(id)a10 lastStateUpdateDate:(id)a11 licensePlate:(id)a12 lprPowerType:(id)a13 lprVehicleType:(id)a14 manufacturer:(id)a15 model:(id)a16 pairedAppIdentifier:(id)a17 positionIndex:(int64_t)a18 powerByConnector:(id)a19 preferredChargingNetworks:(id)a20 siriIntentsIdentifier:(id)a21 supportedConnectors:(id)a22 vehicleIdentifier:(id)a23 vehicleType:(id)a24 year:(id)a25;
- (NSData)currentVehicleState;
- (NSData)powerByConnector;
- (NSData)preferredChargingNetworks;
- (NSDate)dateOfVehicleIngestion;
- (NSDate)lastStateUpdateDate;
- (NSNumber)supportedConnectors;
- (NSNumber)vehicleType;
- (NSNumber)year;
- (NSString)colorHex;
- (NSString)displayName;
- (NSString)headUnitBluetoothIdentifier;
- (NSString)headUnitMacAddress;
- (NSString)iapIdentifier;
- (NSString)licensePlate;
- (NSString)lprPowerType;
- (NSString)lprVehicleType;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)pairedAppIdentifier;
- (NSString)siriIntentsIdentifier;
- (NSString)vehicleIdentifier;
- (int64_t)positionIndex;
- (void)setColorHex:(id)a3;
- (void)setCurrentVehicleState:(id)a3;
- (void)setDateOfVehicleIngestion:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHeadUnitBluetoothIdentifier:(id)a3;
- (void)setHeadUnitMacAddress:(id)a3;
- (void)setIapIdentifier:(id)a3;
- (void)setLastStateUpdateDate:(id)a3;
- (void)setLicensePlate:(id)a3;
- (void)setLprPowerType:(id)a3;
- (void)setLprVehicleType:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setPairedAppIdentifier:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPowerByConnector:(id)a3;
- (void)setPreferredChargingNetworks:(id)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setSiriIntentsIdentifier:(id)a3;
- (void)setSupportedConnectors:(id)a3;
- (void)setVehicleIdentifier:(id)a3;
- (void)setVehicleType:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation MSVehicle

- (MSVehicle)initWithColorHex:(id)a3 currentVehicleState:(id)a4 dateOfVehicleIngestion:(id)a5 displayName:(id)a6 headUnitBluetoothIdentifier:(id)a7 headUnitMacAddress:(id)a8 iapIdentifier:(id)a9 lastStateUpdateDate:(id)a10 licensePlate:(id)a11 lprPowerType:(id)a12 lprVehicleType:(id)a13 manufacturer:(id)a14 model:(id)a15 pairedAppIdentifier:(id)a16 positionIndex:(int64_t)a17 powerByConnector:(id)a18 preferredChargingNetworks:(id)a19 siriIntentsIdentifier:(id)a20 supportedConnectors:(id)a21 vehicleIdentifier:(id)a22 vehicleType:(id)a23 year:(id)a24
{
  id v150 = a5;
  id v151 = a6;
  v147 = self;
  id v148 = a4;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v28 = MEMORY[0x1F4188790](v27 - 8);
  uint64_t v158 = (uint64_t)&v127 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v28);
  uint64_t v159 = (uint64_t)&v127 - v30;
  id v152 = a7;
  id v153 = a8;
  if (a3)
  {
    uint64_t v31 = sub_1A709D438();
    uint64_t v145 = v32;
    uint64_t v146 = v31;
  }
  else
  {
    uint64_t v145 = 0;
    uint64_t v146 = 0;
  }
  id v156 = a23;
  id v157 = a24;
  id v154 = a20;
  id v155 = a22;
  id v149 = a19;
  id v144 = a21;
  v141 = a15;
  id v142 = a16;
  v139 = a13;
  v140 = a14;
  v137 = a12;
  v136 = a11;
  id v133 = a10;
  id v131 = a9;
  if (v148)
  {
    id v135 = a18;
    id v138 = v148;
    id v33 = v150;
    id v34 = v151;
    id v35 = v152;
    id v36 = v153;
    id v37 = a9;
    id v38 = a10;
    id v39 = a11;
    id v40 = a12;
    id v41 = a13;
    id v42 = a14;
    id v43 = a15;
    id v44 = a16;
    id v45 = v135;
    id v46 = v135;
    id v47 = v149;
    id v48 = v154;
    id v49 = a21;
    id v50 = v155;
    id v51 = v156;
    id v52 = v157;
    id v148 = (id)sub_1A709D198();
    unint64_t v143 = v53;

    id v54 = v150;
    if (v150)
    {
LABEL_6:
      uint64_t v55 = v159;
      sub_1A709D1D8();

      uint64_t v56 = sub_1A709D1F8();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v55, 0, 1, v56);
      goto LABEL_9;
    }
  }
  else
  {
    id v57 = v150;
    id v58 = v151;
    id v59 = v152;
    id v60 = v153;
    id v61 = a9;
    id v62 = a10;
    id v63 = a11;
    id v64 = a12;
    id v65 = a13;
    id v66 = a14;
    id v67 = a15;
    id v68 = a16;
    id v45 = a18;
    id v69 = a18;
    id v70 = v149;
    id v71 = v154;
    id v72 = a21;
    id v73 = v155;
    id v74 = v156;
    id v75 = v157;
    id v148 = 0;
    unint64_t v143 = 0xF000000000000000;
    id v54 = v150;
    if (v150) {
      goto LABEL_6;
    }
  }
  uint64_t v76 = sub_1A709D1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v159, 1, 1, v76);
LABEL_9:
  v77 = v140;
  v78 = v141;
  v79 = v139;
  v80 = v137;
  v81 = v136;
  id v82 = v151;
  id v83 = v152;
  v84 = v45;
  id v85 = v133;
  if (v151)
  {
    id v150 = (id)sub_1A709D438();
    id v138 = v86;

    id v87 = v153;
    if (v83) {
      goto LABEL_11;
    }
LABEL_14:
    id v151 = 0;
    id v135 = 0;
    if (v87) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  id v150 = 0;
  id v138 = 0;
  id v87 = v153;
  if (!v152) {
    goto LABEL_14;
  }
LABEL_11:
  id v151 = (id)sub_1A709D438();
  id v135 = v88;

  if (v87)
  {
LABEL_12:
    id v152 = (id)sub_1A709D438();
    uint64_t v134 = v89;

    goto LABEL_16;
  }
LABEL_15:
  id v152 = 0;
  uint64_t v134 = 0;
LABEL_16:
  id v90 = v131;
  if (v131)
  {
    id v153 = (id)sub_1A709D438();
    uint64_t v132 = v91;

    if (v85)
    {
LABEL_18:
      uint64_t v92 = v158;
      sub_1A709D1D8();

      uint64_t v93 = sub_1A709D1F8();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v92, 0, 1, v93);
      goto LABEL_21;
    }
  }
  else
  {
    id v153 = 0;
    uint64_t v132 = 0;
    if (v85) {
      goto LABEL_18;
    }
  }
  uint64_t v94 = sub_1A709D1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v158, 1, 1, v94);
LABEL_21:
  id v95 = v154;
  id v96 = v149;
  if (v81)
  {
    id v154 = (id)sub_1A709D438();
    id v133 = v97;

    if (v80) {
      goto LABEL_23;
    }
  }
  else
  {
    id v154 = 0;
    id v133 = 0;
    if (v80)
    {
LABEL_23:
      v136 = (void *)sub_1A709D438();
      id v131 = v98;

      if (v79) {
        goto LABEL_24;
      }
      goto LABEL_33;
    }
  }
  v136 = 0;
  id v131 = 0;
  if (v79)
  {
LABEL_24:
    v137 = (void *)sub_1A709D438();
    uint64_t v130 = v99;

    if (v77) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_33:
  v137 = 0;
  uint64_t v130 = 0;
  if (v77)
  {
LABEL_25:
    v139 = (void *)sub_1A709D438();
    uint64_t v129 = v100;

    if (v78) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  v139 = 0;
  uint64_t v129 = 0;
  if (v78)
  {
LABEL_26:
    v140 = (void *)sub_1A709D438();
    uint64_t v128 = v101;

    v102 = v142;
    if (v142) {
      goto LABEL_27;
    }
    goto LABEL_36;
  }
LABEL_35:
  v140 = 0;
  uint64_t v128 = 0;
  v102 = v142;
  if (v142)
  {
LABEL_27:
    v141 = (void *)sub_1A709D438();
    uint64_t v127 = v103;

    if (v84) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }
LABEL_36:
  v141 = 0;
  uint64_t v127 = 0;
  if (v84)
  {
LABEL_28:
    uint64_t v104 = sub_1A709D198();
    unint64_t v106 = v105;

    if (v96) {
      goto LABEL_29;
    }
LABEL_38:
    uint64_t v107 = 0;
    unint64_t v109 = 0xF000000000000000;
    if (v95) {
      goto LABEL_30;
    }
    goto LABEL_39;
  }
LABEL_37:
  uint64_t v104 = 0;
  unint64_t v106 = 0xF000000000000000;
  if (!v96) {
    goto LABEL_38;
  }
LABEL_29:
  uint64_t v107 = sub_1A709D198();
  unint64_t v109 = v108;

  if (v95)
  {
LABEL_30:
    uint64_t v110 = sub_1A709D438();
    uint64_t v112 = v111;

    goto LABEL_40;
  }
LABEL_39:
  uint64_t v110 = 0;
  uint64_t v112 = 0;
LABEL_40:
  id v113 = v155;
  if (v155)
  {
    uint64_t v114 = sub_1A709D438();
    uint64_t v116 = v115;
  }
  else
  {
    uint64_t v114 = 0;
    uint64_t v116 = 0;
  }
  uint64_t v126 = v114;
  uint64_t v124 = v110;
  uint64_t v125 = v112;
  id v117 = v144;
  id v118 = v157;
  id v119 = v156;
  uint64_t v120 = (uint64_t)v148;
  unint64_t v121 = v143;
  v122 = (MSVehicle *)sub_1A7011130(v146, v145, (uint64_t)v148, v143, v159, (uint64_t)v150, (uint64_t)v138, (uint64_t)v151, (uint64_t)v135, (uint64_t)v152, v134, (uint64_t)v153, v132, v158, (uint64_t)v154, (uint64_t)v133, (uint64_t)v136, (uint64_t)v131, (uint64_t)v137,
                        v130,
                        (uint64_t)v139,
                        v129,
                        (uint64_t)v140,
                        v128,
                        (uint64_t)v141,
                        v127,
                        a17,
                        v104,
                        v106,
                        v107,
                        v109,
                        v124,
                        v125,
                        (uint64_t)v144,
                        v126,
                        v116,
                        (uint64_t)v156,
                        (uint64_t)v157);

  sub_1A6EEF5F4(v107, v109);
  sub_1A6EEF5F4(v104, v106);
  sub_1A6EEF5F4(v120, v121);
  return v122;
}

- (MSVehicle)initWithStore:(id)a3 colorHex:(id)a4 currentVehicleState:(id)a5 dateOfVehicleIngestion:(id)a6 displayName:(id)a7 headUnitBluetoothIdentifier:(id)a8 headUnitMacAddress:(id)a9 iapIdentifier:(id)a10 lastStateUpdateDate:(id)a11 licensePlate:(id)a12 lprPowerType:(id)a13 lprVehicleType:(id)a14 manufacturer:(id)a15 model:(id)a16 pairedAppIdentifier:(id)a17 positionIndex:(int64_t)a18 powerByConnector:(id)a19 preferredChargingNetworks:(id)a20 siriIntentsIdentifier:(id)a21 supportedConnectors:(id)a22 vehicleIdentifier:(id)a23 vehicleType:(id)a24 year:(id)a25
{
  id v145 = a7;
  id v134 = a6;
  id v142 = self;
  id v143 = a5;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v29 = MEMORY[0x1F4188790](v28 - 8);
  uint64_t v152 = (uint64_t)&v119 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v29);
  unint64_t v153 = (unint64_t)&v119 - v31;
  id v146 = a8;
  if (a4)
  {
    uint64_t v32 = sub_1A709D438();
    uint64_t v140 = v33;
    uint64_t v141 = v32;
  }
  else
  {
    uint64_t v140 = 0;
    uint64_t v141 = 0;
  }
  id v144 = a24;
  id v149 = a23;
  id v150 = a25;
  id v151 = a22;
  id v148 = a21;
  id v132 = a20;
  id v147 = a19;
  id v139 = a3;
  v136 = a15;
  v137 = a16;
  id v135 = a14;
  id v133 = a13;
  id v131 = a12;
  id v128 = a11;
  id v125 = a10;
  uint64_t v127 = a9;
  if (v143)
  {
    id v130 = v143;
    id v34 = v134;
    id v35 = v134;
    id v36 = v145;
    id v37 = v146;
    id v38 = a9;
    id v39 = a10;
    id v40 = a11;
    id v41 = a12;
    id v42 = a13;
    id v43 = a14;
    id v44 = a15;
    id v45 = a16;
    id v46 = a17;
    id v47 = a17;
    id v48 = v147;
    id v49 = v132;
    id v50 = v132;
    id v51 = v148;
    id v52 = v151;
    id v53 = v149;
    id v54 = v144;
    id v55 = v150;
    id v143 = (id)sub_1A709D198();
    unint64_t v138 = v56;

    if (v34)
    {
LABEL_6:
      unint64_t v57 = v153;
      sub_1A709D1D8();

      uint64_t v58 = sub_1A709D1F8();
      (*(void (**)(unint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v57, 0, 1, v58);
      goto LABEL_9;
    }
  }
  else
  {
    id v34 = v134;
    id v59 = v134;
    id v60 = v145;
    id v61 = v146;
    id v62 = a9;
    id v63 = a10;
    id v64 = a11;
    id v65 = a12;
    id v66 = a13;
    id v67 = a14;
    id v68 = a15;
    id v69 = a16;
    id v46 = a17;
    id v70 = a17;
    id v71 = v147;
    id v49 = v132;
    id v72 = v132;
    id v73 = v148;
    id v74 = v151;
    id v75 = v149;
    id v76 = v144;
    id v77 = v150;
    id v143 = 0;
    unint64_t v138 = 0xF000000000000000;
    if (v34) {
      goto LABEL_6;
    }
  }
  uint64_t v78 = sub_1A709D1F8();
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v153, 1, 1, v78);
LABEL_9:
  v79 = v46;
  v81 = v135;
  v80 = v136;
  id v82 = v133;
  id v83 = v131;
  id v84 = v128;
  id v85 = v145;
  id v86 = v146;
  id v87 = v137;
  if (v145)
  {
    id v134 = (id)sub_1A709D438();
    id v132 = v88;
  }
  else
  {
    id v134 = 0;
    id v132 = 0;
  }
  uint64_t v89 = v127;
  if (v86)
  {
    id v145 = (id)sub_1A709D438();
    id v130 = v90;
  }
  else
  {
    id v145 = 0;
    id v130 = 0;
  }
  id v91 = v125;
  if (v89)
  {
    id v146 = (id)sub_1A709D438();
    uint64_t v129 = v92;

    if (v91) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v127 = 0;
    uint64_t v126 = 0;
    if (v84) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  id v146 = 0;
  uint64_t v129 = 0;
  if (!v125) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v127 = (void *)sub_1A709D438();
  uint64_t v126 = v93;

  if (v84)
  {
LABEL_18:
    uint64_t v94 = v152;
    sub_1A709D1D8();

    uint64_t v95 = sub_1A709D1F8();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v94, 0, 1, v95);
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v96 = sub_1A709D1F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v152, 1, 1, v96);
LABEL_22:
  id v97 = v148;
  if (v83)
  {
    id v148 = (id)sub_1A709D438();
    id v128 = v98;

    if (v82) {
      goto LABEL_24;
    }
  }
  else
  {
    id v148 = 0;
    id v128 = 0;
    if (v82)
    {
LABEL_24:
      id v131 = (void *)sub_1A709D438();
      id v125 = v99;

      if (v81) {
        goto LABEL_25;
      }
      goto LABEL_34;
    }
  }
  id v131 = 0;
  id v125 = 0;
  if (v81)
  {
LABEL_25:
    id v133 = (void *)sub_1A709D438();
    uint64_t v124 = v100;

    if (v80) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  id v133 = 0;
  uint64_t v124 = 0;
  if (v80)
  {
LABEL_26:
    id v135 = (void *)sub_1A709D438();
    uint64_t v123 = v101;

    if (v87) {
      goto LABEL_27;
    }
    goto LABEL_36;
  }
LABEL_35:
  id v135 = 0;
  uint64_t v123 = 0;
  if (v87)
  {
LABEL_27:
    v136 = (void *)sub_1A709D438();
    uint64_t v122 = v102;

    if (v79) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }
LABEL_36:
  v136 = 0;
  uint64_t v122 = 0;
  if (v79)
  {
LABEL_28:
    v137 = (void *)sub_1A709D438();
    uint64_t v121 = v103;

    id v104 = v147;
    if (v147) {
      goto LABEL_29;
    }
    goto LABEL_38;
  }
LABEL_37:
  v137 = 0;
  uint64_t v121 = 0;
  id v104 = v147;
  if (v147)
  {
LABEL_29:
    uint64_t v120 = sub_1A709D198();
    unint64_t v106 = v105;

    id v107 = v144;
    if (v49) {
      goto LABEL_30;
    }
LABEL_39:
    uint64_t v108 = 0;
    unint64_t v110 = 0xF000000000000000;
    if (v97) {
      goto LABEL_31;
    }
    goto LABEL_40;
  }
LABEL_38:
  uint64_t v120 = 0;
  unint64_t v106 = 0xF000000000000000;
  id v107 = v144;
  if (!v49) {
    goto LABEL_39;
  }
LABEL_30:
  uint64_t v108 = sub_1A709D198();
  unint64_t v110 = v109;

  if (v97)
  {
LABEL_31:
    uint64_t v111 = sub_1A709D438();
    uint64_t v113 = v112;

    goto LABEL_41;
  }
LABEL_40:
  uint64_t v111 = 0;
  uint64_t v113 = 0;
LABEL_41:
  id v114 = v149;
  if (v149)
  {
    unint64_t v115 = sub_1A709D438();
    unint64_t v117 = v116;
  }
  else
  {
    unint64_t v115 = 0;
    unint64_t v117 = 0;
  }
  return (MSVehicle *)Vehicle.init(store:colorHex:currentVehicleState:dateOfVehicleIngestion:displayName:headUnitBluetoothIdentifier:headUnitMacAddress:iapIdentifier:lastStateUpdateDate:licensePlate:lprPowerType:lprVehicleType:manufacturer:model:pairedAppIdentifier:positionIndex:powerByConnector:preferredChargingNetworks:siriIntentsIdentifier:supportedConnectors:vehicleIdentifier:vehicleType:year:)(v139, v141, v140, (uint64_t)v143, v138, v153, (uint64_t)v134, (uint64_t)v132, (uint64_t)v145, (uint64_t)v130, (uint64_t)v146, v129, (uint64_t)v127, v126, v152, (uint64_t)v148, (uint64_t)v128, (uint64_t)v131, (uint64_t)v125,
                        (uint64_t)v133,
                        v124,
                        (uint64_t)v135,
                        v123,
                        (uint64_t)v136,
                        v122,
                        (uint64_t)v137,
                        v121,
                        a18,
                        v120,
                        v106,
                        v108,
                        v110,
                        v111,
                        v113,
                        v151,
                        v115,
                        v117,
                        v107,
                        v150);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedVehicle();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A7008CF8(v6, a4);
}

- (NSString)colorHex
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A7009848);
}

- (void)setColorHex:(id)a3
{
}

- (NSData)currentVehicleState
{
  return (NSData *)sub_1A700E870(self, (uint64_t)a2, sub_1A7009C4C);
}

- (void)setCurrentVehicleState:(id)a3
{
}

- (NSDate)dateOfVehicleIngestion
{
  return (NSDate *)sub_1A700B8E0(self, (uint64_t)a2, (void (*)(void))sub_1A700A074);
}

- (void)setDateOfVehicleIngestion:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700A8D0);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)headUnitBluetoothIdentifier
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700ACD4);
}

- (void)setHeadUnitBluetoothIdentifier:(id)a3
{
}

- (NSString)headUnitMacAddress
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700B0D8);
}

- (void)setHeadUnitMacAddress:(id)a3
{
}

- (NSString)iapIdentifier
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700B4DC);
}

- (void)setIapIdentifier:(id)a3
{
}

- (NSDate)lastStateUpdateDate
{
  return (NSDate *)sub_1A700B8E0(self, (uint64_t)a2, (void (*)(void))sub_1A700BA0C);
}

- (void)setLastStateUpdateDate:(id)a3
{
}

- (NSString)licensePlate
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700C86C);
}

- (void)setLicensePlate:(id)a3
{
}

- (NSString)lprPowerType
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700CC70);
}

- (void)setLprPowerType:(id)a3
{
}

- (NSString)lprVehicleType
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700D074);
}

- (void)setLprVehicleType:(id)a3
{
}

- (NSString)manufacturer
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700D478);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)model
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700D87C);
}

- (void)setModel:(id)a3
{
}

- (NSString)pairedAppIdentifier
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700DC80);
}

- (void)setPairedAppIdentifier:(id)a3
{
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSVehicle__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A700E184(a3);
}

- (NSData)powerByConnector
{
  return (NSData *)sub_1A700E870(self, (uint64_t)a2, sub_1A700E448);
}

- (void)setPowerByConnector:(id)a3
{
}

- (NSData)preferredChargingNetworks
{
  return (NSData *)sub_1A700E870(self, (uint64_t)a2, sub_1A700E8FC);
}

- (void)setPreferredChargingNetworks:(id)a3
{
}

- (NSString)siriIntentsIdentifier
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700F0A4);
}

- (void)setSiriIntentsIdentifier:(id)a3
{
}

- (NSNumber)supportedConnectors
{
  v2 = self;
  v3 = (void *)sub_1A700F4D4();

  return (NSNumber *)v3;
}

- (void)setSupportedConnectors:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A701373C(a3);
}

- (NSString)vehicleIdentifier
{
  return (NSString *)sub_1A700A850(self, (uint64_t)a2, (void (*)(void))sub_1A700F900);
}

- (void)setVehicleIdentifier:(id)a3
{
}

- (NSNumber)vehicleType
{
  v2 = self;
  v3 = (void *)sub_1A701006C();

  return (NSNumber *)v3;
}

- (void)setVehicleType:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A7013B28(a3);
}

- (NSNumber)year
{
  v2 = self;
  v3 = (void *)sub_1A70104C4();

  return (NSNumber *)v3;
}

- (void)setYear:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A7013D14(a3);
}

- (MSVehicle)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSVehicle *)sub_1A7010B28(a3, a4, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSVehicle__currentVehicleState), *(void *)&self->super._store[OBJC_IVAR___MSVehicle__currentVehicleState]);
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSVehicle__dateOfVehicleIngestion);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSVehicle__lastStateUpdateDate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSVehicle__powerByConnector), *(void *)&self->super._store[OBJC_IVAR___MSVehicle__powerByConnector]);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSVehicle__preferredChargingNetworks), *(void *)&self->super._store[OBJC_IVAR___MSVehicle__preferredChargingNetworks]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSVehicle__year);
}

@end