uint64_t HomeAutomationUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HomeAutomationUIPlugin.init()()
{
  return v0;
}

uint64_t HomeAutomationUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v87 = a1;
  uint64_t v86 = type metadata accessor for TemperatureView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1();
  uint64_t v85 = v2;
  OUTLINED_FUNCTION_3();
  uint64_t v3 = type metadata accessor for TemperatureSnippetModel();
  uint64_t v4 = OUTLINED_FUNCTION_4(v3);
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2();
  uint64_t v83 = v5;
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6();
  v84 = (char *)v7;
  OUTLINED_FUNCTION_3();
  uint64_t v82 = type metadata accessor for CallToActionView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_1();
  uint64_t v81 = v9;
  OUTLINED_FUNCTION_3();
  uint64_t v10 = type metadata accessor for CallToActionSnippetModel();
  uint64_t v11 = OUTLINED_FUNCTION_4(v10);
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2();
  uint64_t v79 = v12;
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_6();
  v80 = (char *)v14;
  OUTLINED_FUNCTION_3();
  uint64_t v78 = type metadata accessor for AutomationView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1();
  uint64_t v77 = v16;
  OUTLINED_FUNCTION_3();
  uint64_t v17 = type metadata accessor for AutomationSnippetModel();
  uint64_t v18 = OUTLINED_FUNCTION_4(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_2();
  uint64_t v75 = v19;
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_6();
  v76 = (char *)v21;
  OUTLINED_FUNCTION_3();
  uint64_t v74 = type metadata accessor for CompletionView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_1();
  uint64_t v73 = v23;
  OUTLINED_FUNCTION_3();
  uint64_t v24 = type metadata accessor for CompletionSnippetModel();
  uint64_t v25 = OUTLINED_FUNCTION_4(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_2();
  uint64_t v71 = v26;
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_6();
  v72 = (char *)v28;
  OUTLINED_FUNCTION_3();
  uint64_t v70 = type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_5();
  uint64_t v32 = v31 - v30;
  uint64_t v33 = type metadata accessor for ConfirmationSnippetModel();
  uint64_t v34 = OUTLINED_FUNCTION_4(v33);
  uint64_t v35 = MEMORY[0x270FA5388](v34);
  v37 = (char *)&v70 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  v39 = (char *)&v70 - v38;
  type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_5();
  uint64_t v43 = v42 - v41;
  uint64_t v44 = type metadata accessor for DisambiguationSnippetModel(0);
  uint64_t v45 = OUTLINED_FUNCTION_4(v44);
  uint64_t v46 = MEMORY[0x270FA5388](v45);
  v48 = (char *)&v70 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v46);
  v50 = (char *)&v70 - v49;
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v51);
  OUTLINED_FUNCTION_5();
  uint64_t v54 = v53 - v52;
  sub_2519792E4(v87, v53 - v52, (void (*)(void))type metadata accessor for HomeAutomationSnippetModels);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_251979284(v54, (uint64_t)v39, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
      sub_2519792E4((uint64_t)v39, (uint64_t)v37, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
      ConfirmationView.init(model:)((uint64_t)v37, v32);
      sub_2519793FC(&qword_269B93BC8, (void (*)(uint64_t))type metadata accessor for ConfirmationView);
      uint64_t v55 = sub_2519C9D30();
      sub_251979344(v32, (void (*)(void))type metadata accessor for ConfirmationView);
      v57 = type metadata accessor for ConfirmationSnippetModel;
      uint64_t v58 = (uint64_t)v39;
      goto LABEL_9;
    case 2u:
      v50 = v72;
      sub_251979284(v54, (uint64_t)v72, (void (*)(void))type metadata accessor for CompletionSnippetModel);
      sub_2519792E4((uint64_t)v50, v71, (void (*)(void))type metadata accessor for CompletionSnippetModel);
      uint64_t v59 = v73;
      uint64_t v60 = OUTLINED_FUNCTION_8();
      CompletionView.init(model:)(v60, v61);
      sub_2519793FC(&qword_269B93BC0, (void (*)(uint64_t))type metadata accessor for CompletionView);
      uint64_t v55 = sub_2519C9D30();
      sub_251979344(v59, (void (*)(void))type metadata accessor for CompletionView);
      v56 = type metadata accessor for CompletionSnippetModel;
      goto LABEL_8;
    case 3u:
      v50 = v76;
      sub_251979284(v54, (uint64_t)v76, (void (*)(void))type metadata accessor for AutomationSnippetModel);
      sub_2519792E4((uint64_t)v50, v75, (void (*)(void))type metadata accessor for AutomationSnippetModel);
      uint64_t v62 = v77;
      uint64_t v63 = OUTLINED_FUNCTION_8();
      AutomationView.init(model:)(v63, v64);
      sub_2519793FC(&qword_269B93BB8, (void (*)(uint64_t))type metadata accessor for AutomationView);
      uint64_t v55 = sub_2519C9D30();
      sub_251979344(v62, (void (*)(void))type metadata accessor for AutomationView);
      v56 = type metadata accessor for AutomationSnippetModel;
      goto LABEL_8;
    case 4u:
      v50 = v80;
      sub_251979284(v54, (uint64_t)v80, (void (*)(void))type metadata accessor for CallToActionSnippetModel);
      sub_2519792E4((uint64_t)v50, v79, (void (*)(void))type metadata accessor for CallToActionSnippetModel);
      uint64_t v65 = v81;
      uint64_t v66 = OUTLINED_FUNCTION_8();
      CallToActionView.init(model:)(v66, v67);
      sub_2519793FC(&qword_269B93BB0, (void (*)(uint64_t))type metadata accessor for CallToActionView);
      uint64_t v55 = sub_2519C9D30();
      sub_251979344(v65, (void (*)(void))type metadata accessor for CallToActionView);
      v56 = type metadata accessor for CallToActionSnippetModel;
      goto LABEL_8;
    case 5u:
      v50 = v84;
      sub_251979284(v54, (uint64_t)v84, (void (*)(void))type metadata accessor for TemperatureSnippetModel);
      sub_2519792E4((uint64_t)v50, v83, (void (*)(void))type metadata accessor for TemperatureSnippetModel);
      uint64_t v68 = v85;
      OUTLINED_FUNCTION_8();
      TemperatureView.init(model:)();
      sub_2519793FC(&qword_269B93BA8, (void (*)(uint64_t))type metadata accessor for TemperatureView);
      uint64_t v55 = sub_2519C9D30();
      sub_251979344(v68, (void (*)(void))type metadata accessor for TemperatureView);
      v56 = type metadata accessor for TemperatureSnippetModel;
      goto LABEL_8;
    default:
      sub_251979284(v54, (uint64_t)v50, (void (*)(void))type metadata accessor for DisambiguationSnippetModel);
      sub_2519792E4((uint64_t)v50, (uint64_t)v48, (void (*)(void))type metadata accessor for DisambiguationSnippetModel);
      sub_2519BAD14((uint64_t)v48, v43);
      sub_2519793FC(&qword_269B93BD0, (void (*)(uint64_t))type metadata accessor for DisambiguationView);
      uint64_t v55 = sub_2519C9D30();
      sub_251979344(v43, (void (*)(void))type metadata accessor for DisambiguationView);
      v56 = (uint64_t (*)())type metadata accessor for DisambiguationSnippetModel;
LABEL_8:
      v57 = v56;
      uint64_t v58 = (uint64_t)v50;
LABEL_9:
      sub_251979344(v58, (void (*)(void))v57);
      return v55;
  }
}

uint64_t sub_251979284(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_2519792E4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_251979344(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t HomeAutomationUIPlugin.deinit()
{
  return v0;
}

uint64_t HomeAutomationUIPlugin.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2519793B4()
{
  return sub_2519793FC(&qword_269B93BD8, (void (*)(uint64_t))type metadata accessor for HomeAutomationSnippetModels);
}

uint64_t sub_2519793FC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_251979444@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = HomeAutomationUIPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_25197946C(uint64_t a1)
{
  return HomeAutomationUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t type metadata accessor for HomeAutomationUIPlugin()
{
  return self;
}

uint64_t method lookup function for HomeAutomationUIPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeAutomationUIPlugin);
}

uint64_t dispatch thunk of HomeAutomationUIPlugin.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void type metadata accessor for VRXVisualResponseLocation()
{
  if (!qword_269B93BE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269B93BE0);
    }
  }
}

uint64_t OUTLINED_FUNCTION_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return v0;
}

uint64_t AutomationSnippetModel.triggerValue.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25197961C()
{
  return AutomationSnippetModel.triggerValue.setter();
}

uint64_t AutomationSnippetModel.triggerValue.setter()
{
  return sub_2519C9930();
}

uint64_t (*AutomationSnippetModel.triggerValue.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  v1[4] = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t AutomationSnippetModel.targetedEntitiesIcons.getter()
{
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  sub_2519C9920();
  return v1;
}

uint64_t type metadata accessor for AutomationSnippetModel()
{
  uint64_t result = qword_269B93C68;
  if (!qword_269B93C68) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_251979788()
{
  return AutomationSnippetModel.targetedEntitiesIcons.setter();
}

uint64_t AutomationSnippetModel.targetedEntitiesIcons.setter()
{
  return sub_2519C9930();
}

uint64_t (*AutomationSnippetModel.targetedEntitiesIcons.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t AutomationSnippetModel.triggerIcon.getter()
{
  return sub_2519C9920();
}

uint64_t sub_2519798A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25197AAB0(a1, (uint64_t)v4, (void (*)(void))type metadata accessor for IconConfiguration);
  return AutomationSnippetModel.triggerIcon.setter((uint64_t)v4);
}

uint64_t AutomationSnippetModel.triggerIcon.setter(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_5();
  sub_25197AAB0(a1, v4 - v3, (void (*)(void))type metadata accessor for IconConfiguration);
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  sub_2519C9930();
  return sub_25197AB10(a1, (void (*)(void))type metadata accessor for IconConfiguration);
}

uint64_t (*AutomationSnippetModel.triggerIcon.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t AutomationSnippetModel.automationSubtext.getter()
{
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t sub_251979AB0()
{
  return AutomationSnippetModel.automationSubtext.setter();
}

uint64_t AutomationSnippetModel.automationSubtext.setter()
{
  return sub_2519C9930();
}

uint64_t (*AutomationSnippetModel.automationSubtext.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t AutomationSnippetModel.scheduledText.getter()
{
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t sub_251979BEC()
{
  return AutomationSnippetModel.scheduledText.setter();
}

uint64_t AutomationSnippetModel.scheduledText.setter()
{
  return sub_2519C9930();
}

uint64_t (*AutomationSnippetModel.scheduledText.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t AutomationSnippetModel.isSceneAutomation.getter()
{
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  return v1;
}

uint64_t AutomationSnippetModel.isSceneAutomation.setter()
{
  return sub_2519C9930();
}

uint64_t (*AutomationSnippetModel.isSceneAutomation.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

void sub_251979DD8(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_251979E24()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

uint64_t sub_251979E74()
{
  return 6;
}

uint64_t sub_251979E7C()
{
  return 0;
}

unint64_t sub_251979E88(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x4972656767697274;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x656C756465686373;
      break;
    default:
      unint64_t result = 0x5672656767697274;
      break;
  }
  return result;
}

unint64_t sub_251979F70(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x4972656767697274;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x656C756465686373;
      break;
    default:
      unint64_t result = 0x5672656767697274;
      break;
  }
  return result;
}

uint64_t sub_25197A058(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2519BE804(*a1, *a2);
}

uint64_t sub_25197A064()
{
  return sub_2519BE930();
}

uint64_t sub_25197A06C(uint64_t a1)
{
  return sub_2519BED10(a1, *v1);
}

uint64_t sub_25197A074(uint64_t a1)
{
  return sub_2519BEE08(a1, *v1);
}

uint64_t sub_25197A07C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251979E24();
  *a1 = result;
  return result;
}

unint64_t sub_25197A0AC@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_251979E88(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25197A0D8()
{
  return sub_251979F70(*v0);
}

uint64_t sub_25197A0E0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251979E70();
  *a1 = result;
  return result;
}

uint64_t sub_25197A108()
{
  return sub_251979E7C();
}

uint64_t sub_25197A128@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251979E74();
  *a1 = result;
  return result;
}

uint64_t sub_25197A150(uint64_t a1)
{
  unint64_t v2 = sub_25197A9CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25197A18C(uint64_t a1)
{
  unint64_t v2 = sub_25197A9CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::String __swiftcall AutomationSnippetModel.responseViewId()()
{
  unint64_t v0 = (void *)0x80000002519CDF00;
  uint64_t v1 = 0xD000000000000019;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t AutomationSnippetModel.init(triggerValue:targetedEntitiesIcons:triggerIcon:automationSubtext:scheduledText:isSceneAutomation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v22 = a7;
  uint64_t v23 = a8;
  uint64_t v21 = a6;
  int v24 = a9;
  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v21 - v18;
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  sub_2519C9900();
  type metadata accessor for AutomationSnippetModel();
  uint64_t v25 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C08);
  sub_2519C9900();
  sub_25197AAB0(a4, (uint64_t)v19, (void (*)(void))type metadata accessor for IconConfiguration);
  sub_25197AAB0((uint64_t)v19, (uint64_t)v17, (void (*)(void))type metadata accessor for IconConfiguration);
  sub_2519C9900();
  sub_25197AB10((uint64_t)v19, (void (*)(void))type metadata accessor for IconConfiguration);
  uint64_t v25 = a5;
  uint64_t v26 = v21;
  sub_2519C9900();
  uint64_t v25 = v22;
  uint64_t v26 = v23;
  sub_2519C9900();
  LOBYTE(v25) = v24;
  sub_2519C9900();
  return sub_25197AB10(a4, (void (*)(void))type metadata accessor for IconConfiguration);
}

uint64_t AutomationSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v31 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v28 = (uint64_t)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v24 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C10);
  OUTLINED_FUNCTION_4_0();
  uint64_t v29 = v9;
  uint64_t v30 = v8;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5();
  uint64_t v10 = type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25197A9CC();
  uint64_t v15 = (uint64_t)v32;
  sub_2519CA550();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v32 = a1;
  uint64_t v26 = v10;
  LOBYTE(v33) = 0;
  uint64_t v33 = sub_2519CA460();
  uint64_t v34 = v16;
  sub_2519C9900();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C08);
  LOBYTE(v35) = 1;
  sub_25197AF98(&qword_269B93C20, &qword_269B93C28);
  sub_2519CA480();
  uint64_t v25 = v14;
  uint64_t v35 = v33;
  sub_2519C9900();
  LOBYTE(v33) = 2;
  sub_25197B970(&qword_269B93C28, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
  sub_2519CA480();
  v24[1] = v25 + *(int *)(v26 + 24);
  sub_25197AAB0((uint64_t)v7, v28, (void (*)(void))type metadata accessor for IconConfiguration);
  sub_2519C9900();
  sub_25197AB10((uint64_t)v7, (void (*)(void))type metadata accessor for IconConfiguration);
  uint64_t v17 = OUTLINED_FUNCTION_11(3);
  uint64_t v18 = v25;
  uint64_t v33 = v17;
  uint64_t v34 = v19;
  sub_2519C9900();
  uint64_t v33 = OUTLINED_FUNCTION_11(4);
  uint64_t v34 = v20;
  sub_2519C9900();
  LOBYTE(v33) = 5;
  LOBYTE(v33) = sub_2519CA470() & 1;
  sub_2519C9900();
  uint64_t v21 = OUTLINED_FUNCTION_1_0();
  v22(v21);
  sub_25197AAB0(v18, v27, (void (*)(void))type metadata accessor for AutomationSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return sub_25197AB10(v18, (void (*)(void))type metadata accessor for AutomationSnippetModel);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25197A9CC()
{
  unint64_t result = qword_269B93C18;
  if (!qword_269B93C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93C18);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25197AAB0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25197AB10(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t AutomationSnippetModel.encode(to:)(void *a1)
{
  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C30);
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5();
  uint64_t v12 = v11 - v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25197A9CC();
  sub_2519CA560();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA4B0();
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for AutomationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    sub_2519C9920();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C08);
    sub_25197AF98(&qword_269B93C38, &qword_269B93C40);
    sub_2519CA4D0();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
    sub_2519C9920();
    sub_25197B970(&qword_269B93C40, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    sub_2519CA4D0();
    sub_25197AB10(v5, (void (*)(void))type metadata accessor for IconConfiguration);
    sub_2519C9920();
    OUTLINED_FUNCTION_12(3);
    sub_2519CA4B0();
    swift_bridgeObjectRelease();
    sub_2519C9920();
    OUTLINED_FUNCTION_12(4);
    sub_2519CA4B0();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    sub_2519C9920();
    sub_2519CA4C0();
    uint64_t v14 = OUTLINED_FUNCTION_10();
    return v15(v14);
  }
}

uint64_t sub_25197AF98(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93C08);
    sub_25197B970(a2, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t AutomationSnippetModel.description.getter()
{
  type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v2 = v1 - v0;
  unint64_t v5 = 0xD000000000000017;
  unint64_t v6 = 0x80000002519CDF20;
  OUTLINED_FUNCTION_6_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v4, "triggerValue: ");
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  type metadata accessor for AutomationSnippetModel();
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  v4[0] = 0xD000000000000019;
  v4[1] = 0x80000002519CDF60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  sub_2519C9920();
  swift_bridgeObjectRelease();
  sub_2519CA4F0();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  sub_2519C9920();
  IconConfiguration.description.getter();
  sub_25197AB10(v2, (void (*)(void))type metadata accessor for IconConfiguration);
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  v4[0] = 0xD000000000000015;
  v4[1] = 0x80000002519CDFA0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  return v5;
}

uint64_t AutomationSnippetModel.stringId.getter()
{
  return 0x7265676769727423;
}

uint64_t static AutomationSnippetModel.== infix(_:_:)()
{
  if ((sub_2519C9940() & 1) == 0) {
    return 0;
  }
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C08);
  sub_25197AF98(&qword_269B93C48, &qword_269B93C50);
  if ((OUTLINED_FUNCTION_13() & 1) == 0) {
    return 0;
  }
  type metadata accessor for IconConfiguration();
  sub_25197B970(&qword_269B93C50, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
  if ((OUTLINED_FUNCTION_13() & 1) == 0 || (sub_2519C9940() & 1) == 0 || (sub_2519C9940() & 1) == 0) {
    return 0;
  }

  return sub_2519C9940();
}

uint64_t sub_25197B8E0()
{
  return sub_25197B970(&qword_269B93C58, (void (*)(uint64_t))type metadata accessor for AutomationSnippetModel);
}

uint64_t sub_25197B928()
{
  return sub_25197B970(&qword_269B93C60, (void (*)(uint64_t))type metadata accessor for AutomationSnippetModel);
}

uint64_t sub_25197B970(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25197B9BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AutomationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_25197B9D4(void *a1)
{
  return AutomationSnippetModel.encode(to:)(a1);
}

uint64_t sub_25197B9EC()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = AutomationSnippetModel.triggerValue.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25197BA18()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = AutomationSnippetModel.targetedEntitiesIcons.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_25197BA44()
{
  return AutomationSnippetModel.triggerIcon.getter();
}

uint64_t sub_25197BA6C()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = AutomationSnippetModel.automationSubtext.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25197BA98()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = AutomationSnippetModel.scheduledText.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25197BAC4()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = AutomationSnippetModel.isSceneAutomation.getter();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_25197BAF0()
{
  return AutomationSnippetModel.isSceneAutomation.setter();
}

uint64_t *initializeBufferWithCopyOfBuffer for AutomationSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
    v8((uint64_t *)((char *)a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]), v7);
    uint64_t v17 = a3[9];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for AutomationSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v5(a1 + a2[7], v4);
  v5(a1 + a2[8], v4);
  uint64_t v10 = a1 + a2[9];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);

  return v12(v10, v11);
}

uint64_t initializeWithCopy for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for AutomationSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v16 = a3[9];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutomationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25197C52C);
}

uint64_t sub_25197C52C(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        uint64_t v12 = a3[9];
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AutomationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25197C63C);
}

uint64_t sub_25197C63C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        uint64_t v14 = a4[9];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void sub_25197C740()
{
  sub_25197C958(319, (unint64_t *)&qword_269B93C78);
  if (v0 <= 0x3F)
  {
    sub_25197C8A4();
    if (v1 <= 0x3F)
    {
      sub_25197C900();
      if (v2 <= 0x3F)
      {
        sub_25197C958(319, &qword_269B93C90);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_25197C8A4()
{
  if (!qword_269B93C80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93C08);
    unint64_t v0 = sub_2519C9950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B93C80);
    }
  }
}

void sub_25197C900()
{
  if (!qword_269B93C88)
  {
    type metadata accessor for IconConfiguration();
    unint64_t v0 = sub_2519C9950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B93C88);
    }
  }
}

void sub_25197C958(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2519C9950();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AutomationSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AutomationSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25197CB04);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_25197CB2C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25197CB38(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AutomationSnippetModel.CodingKeys()
{
  return &type metadata for AutomationSnippetModel.CodingKeys;
}

unint64_t sub_25197CB54()
{
  unint64_t result = qword_269B93C98;
  if (!qword_269B93C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93C98);
  }
  return result;
}

unint64_t sub_25197CBA4()
{
  unint64_t result = qword_269B93CA0;
  if (!qword_269B93CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93CA0);
  }
  return result;
}

unint64_t sub_25197CBF4()
{
  unint64_t result = qword_269B93CA8;
  if (!qword_269B93CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93CA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for AutomationSnippetModel();
}

void OUTLINED_FUNCTION_6_0()
{
  *(void *)(v1 - 112) = 0;
  *(void *)(v1 - 104) = v0;
}

void *OUTLINED_FUNCTION_7_0()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_2519C9910();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_11@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_2519CA460();
}

void OUTLINED_FUNCTION_12(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_2519C9940();
}

uint64_t AutomationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = type metadata accessor for AutomationView();
  uint64_t v11 = (uint64_t *)(a2 + *(int *)(v10 + 20));
  sub_2519CA170();
  sub_251982468(&qword_269B93CB0, MEMORY[0x263F77980]);
  *uint64_t v11 = sub_2519C9AC0();
  v11[1] = v12;
  sub_251980D90(a1, a2, (void (*)(void))type metadata accessor for AutomationSnippetModel);
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  *(unsigned char *)(a2 + *(int *)(v10 + 24)) = v18;
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  id v13 = (id)qword_269B99498;
  sub_2519C99A0();
  sub_2519CA300();
  sub_2519C9990();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v4, (uint64_t)qword_269B99480);
  OUTLINED_FUNCTION_8_1();
  v14();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  AutomationSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 0xD00000000000002FLL;
  v16._countAndFlagsBits = 0xD000000000000067;
  v16._object = (void *)0x80000002519CE090;
  v15._object = (void *)0x80000002519CE060;
  Logger.debug(output:test:caller:)(v15, 0, v16);
  swift_bridgeObjectRelease();
  sub_2519824B0(a1, (void (*)(void))type metadata accessor for AutomationSnippetModel);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v4);
}

uint64_t type metadata accessor for AutomationView()
{
  uint64_t result = qword_269B93D18;
  if (!qword_269B93D18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AutomationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v20 = a1;
  uint64_t v4 = type metadata accessor for AutomationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93CB8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_6_1();
  sub_251980D90(v1, (uint64_t)v7, (void (*)(void))type metadata accessor for AutomationView);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_251980DE8((uint64_t)v7, v12 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93CC0);
  sub_251980E9C();
  sub_2519CA030();
  sub_251980D90(v3, (uint64_t)v7, (void (*)(void))type metadata accessor for AutomationView);
  uint64_t v13 = swift_allocObject();
  sub_251980DE8((uint64_t)v7, v13 + v11);
  uint64_t v15 = v19;
  uint64_t v14 = v20;
  OUTLINED_FUNCTION_8_1();
  v16();
  uint64_t v17 = (void (**)())(v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93D10) + 36));
  *uint64_t v17 = sub_251981200;
  v17[1] = (void (*)())v13;
  v17[2] = 0;
  v17[3] = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v2, v15);
}

uint64_t sub_25197D29C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v143 = a2;
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D08);
  MEMORY[0x270FA5388](v144);
  v125 = (char *)&v105 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_2519CA130();
  uint64_t v124 = *(void *)(v126 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v126);
  v122 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v123 = (char *)&v105 - v6;
  uint64_t v121 = sub_2519C9860();
  uint64_t v120 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  v119 = (char *)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v8 - 8);
  v109 = (char *)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2519C98F0();
  MEMORY[0x270FA5388](v10 - 8);
  v108 = (char *)&v105 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_2519CA000();
  uint64_t v115 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  v113 = (char *)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DA0);
  uint64_t v114 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  v111 = (char *)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DA8);
  MEMORY[0x270FA5388](v112);
  v110 = (char *)&v105 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93CF8);
  MEMORY[0x270FA5388](v134);
  uint64_t v116 = (uint64_t)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DB0);
  uint64_t v16 = MEMORY[0x270FA5388](v127);
  v128 = (char *)&v105 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v129 = (uint64_t)&v105 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DB8);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v107 = (uint64_t)&v105 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v106 = (uint64_t *)((char *)&v105 - v22);
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DC0);
  MEMORY[0x270FA5388](v140);
  uint64_t v142 = (uint64_t)&v105 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DC8);
  MEMORY[0x270FA5388](v130);
  uint64_t v131 = (uint64_t)&v105 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93CE8);
  MEMORY[0x270FA5388](v132);
  uint64_t v26 = (char *)&v105 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93CD8);
  MEMORY[0x270FA5388](v141);
  v133 = (char *)&v105 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_2519CA0D0();
  uint64_t v136 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  v135 = (char *)&v105 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_2519CA0F0();
  uint64_t v138 = *(void *)(v139 - 8);
  uint64_t v29 = MEMORY[0x270FA5388](v139);
  uint64_t v31 = (char *)&v105 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  v145 = (char *)&v105 - v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DD0);
  uint64_t v34 = MEMORY[0x270FA5388](v33 - 8);
  uint64_t v36 = (char *)&v105 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v105 - v37;
  uint64_t v39 = type metadata accessor for AutomationView();
  uint64_t v40 = MEMORY[0x270FA5388](v39);
  uint64_t v42 = (char *)&v105 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = (id *)(a1 + *(int *)(v40 + 20));
  if (!*v43) {
    goto LABEL_12;
  }
  id v44 = *v43;
  sub_2519CA140();

  LOBYTE(v44) = sub_2519CA310();
  sub_251980D90(a1, (uint64_t)v42, (void (*)(void))type metadata accessor for AutomationView);
  if (v44)
  {
    sub_2519824B0((uint64_t)v42, (void (*)(void))type metadata accessor for AutomationView);
LABEL_6:
    v48 = v38;
    *(void *)uint64_t v38 = sub_2519C9BD0();
    *((void *)v38 + 1) = 0x4018000000000000;
    v38[16] = 0;
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DF8);
    sub_25197E7BC(a1, (uint64_t)&v38[*(int *)(v49 + 44)]);
    type metadata accessor for AutomationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    sub_2519C9920();
    uint64_t v157 = MEMORY[0x263F8D310];
    uint64_t v158 = MEMORY[0x263F77998];
    (*(void (**)(char *, void, uint64_t))(v136 + 104))(v135, *MEMORY[0x263F77780], v137);
    v50 = v145;
    sub_2519CA0E0();
    sub_251982930((uint64_t)v38, (uint64_t)v36, &qword_269B93DD0);
    uint64_t v51 = v138;
    uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v138 + 16);
    uint64_t v53 = v139;
    v52(v31, v50, v139);
    sub_251982930((uint64_t)v36, (uint64_t)v26, &qword_269B93DD0);
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E00);
    v52(&v26[*(int *)(v54 + 48)], v31, v53);
    uint64_t v55 = *(void (**)(char *, uint64_t))(v51 + 8);
    v55(v31, v53);
    sub_251982980((uint64_t)v36, &qword_269B93DD0);
    sub_251982930((uint64_t)v26, v131, &qword_269B93CE8);
    swift_storeEnumTagMultiPayload();
    sub_2519827F8(&qword_269B93CE0, &qword_269B93CE8);
    sub_2519827F8(&qword_269B93CF0, &qword_269B93CF8);
    uint64_t v56 = (uint64_t)v133;
    sub_2519C9C30();
    sub_251982980((uint64_t)v26, &qword_269B93CE8);
    sub_251982930(v56, v142, &qword_269B93CD8);
    swift_storeEnumTagMultiPayload();
    sub_251980F3C();
    sub_2519827F8(&qword_269B93D00, &qword_269B93D08);
    sub_2519C9C30();
    sub_251982980(v56, &qword_269B93CD8);
    v55(v145, v53);
    uint64_t v57 = (uint64_t)v48;
    uint64_t v58 = &qword_269B93DD0;
    return sub_251982980(v57, v58);
  }
  uint64_t v45 = *(void **)&v42[*(int *)(v39 + 20)];
  if (!v45) {
    goto LABEL_12;
  }
  id v46 = v45;
  sub_2519CA140();

  char v47 = sub_2519CA330();
  sub_2519824B0((uint64_t)v42, (void (*)(void))type metadata accessor for AutomationView);
  if (v47) {
    goto LABEL_6;
  }
  if (*v43)
  {
    id v60 = *v43;
    sub_2519CA140();

    if (sub_2519CA320())
    {
      uint64_t v61 = sub_2519C9BD0();
      uint64_t v62 = (uint64_t)v106;
      uint64_t *v106 = v61;
      *(void *)(v62 + 8) = 0;
      *(unsigned char *)(v62 + 16) = 0;
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DE8);
      sub_25197F5F0(a1, v62 + *(int *)(v63 + 44));
      type metadata accessor for AutomationSnippetModel();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      sub_2519C9920();
      uint64_t v157 = MEMORY[0x263F8D310];
      uint64_t v158 = MEMORY[0x263F77998];
      (*(void (**)(char *, void, uint64_t))(v136 + 104))(v135, *MEMORY[0x263F77780], v137);
      uint64_t v64 = v145;
      sub_2519CA0E0();
      uint64_t v65 = sub_2519C9EC0();
      char v66 = sub_2519C9C50();
      uint64_t v67 = v138;
      uint64_t v68 = (uint64_t)v128;
      uint64_t v69 = v139;
      (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v128, v64, v139);
      uint64_t v70 = v68 + *(int *)(v127 + 36);
      *(void *)uint64_t v70 = v65;
      *(unsigned char *)(v70 + 8) = v66;
      (*(void (**)(char *, uint64_t))(v67 + 8))(v64, v69);
      uint64_t v71 = v129;
      sub_2519828D4(v68, v129, &qword_269B93DB0);
      uint64_t v72 = v107;
      sub_251982930(v62, v107, &qword_269B93DB8);
      sub_251982930(v71, v68, &qword_269B93DB0);
      uint64_t v73 = v116;
      sub_251982930(v72, v116, &qword_269B93DB8);
      uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DF0);
      sub_251982930(v68, v73 + *(int *)(v74 + 48), &qword_269B93DB0);
      sub_251982980(v68, &qword_269B93DB0);
      sub_251982980(v72, &qword_269B93DB8);
      sub_251982930(v73, v131, &qword_269B93CF8);
      swift_storeEnumTagMultiPayload();
      sub_2519827F8(&qword_269B93CE0, &qword_269B93CE8);
      sub_2519827F8(&qword_269B93CF0, &qword_269B93CF8);
      uint64_t v75 = (uint64_t)v133;
      sub_2519C9C30();
      sub_251982980(v73, &qword_269B93CF8);
      sub_251982930(v75, v142, &qword_269B93CD8);
      swift_storeEnumTagMultiPayload();
      sub_251980F3C();
      sub_2519827F8(&qword_269B93D00, &qword_269B93D08);
      sub_2519C9C30();
      sub_251982980(v75, &qword_269B93CD8);
      sub_251982980(v71, &qword_269B93DB0);
      uint64_t v57 = v62;
      uint64_t v58 = &qword_269B93DB8;
      return sub_251982980(v57, v58);
    }
    type metadata accessor for AutomationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
    uint64_t v76 = (uint64_t)v109;
    sub_2519C9920();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    sub_2519C9920();
    sub_2519824B0(v76, (void (*)(void))type metadata accessor for IconConfiguration);
    sub_2519C98E0();
    swift_bridgeObjectRelease();
    uint64_t v77 = v113;
    sub_2519CA010();
    uint64_t v78 = v120;
    uint64_t v79 = v119;
    uint64_t v80 = v121;
    (*(void (**)(char *, void, uint64_t))(v120 + 104))(v119, *MEMORY[0x263F76568], v121);
    sub_251982468(&qword_269B93D70, MEMORY[0x263F77558]);
    uint64_t v81 = v111;
    uint64_t v82 = v118;
    sub_2519C9D40();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v79, v80);
    (*(void (**)(char *, uint64_t))(v115 + 8))(v77, v82);
    uint64_t v83 = sub_2519C9F00();
    uint64_t v84 = v114;
    uint64_t v85 = (uint64_t)v110;
    uint64_t v86 = v117;
    (*(void (**)(char *, char *, uint64_t))(v114 + 16))(v110, v81, v117);
    *(void *)(v85 + *(int *)(v112 + 36)) = v83;
    (*(void (**)(char *, uint64_t))(v84 + 8))(v81, v86);
    sub_251982504();
    uint64_t v87 = sub_2519C9D30();
    sub_251982980(v85, &qword_269B93DA8);
    sub_2519C9920();
    uint64_t v88 = MEMORY[0x263F8D310];
    uint64_t v89 = MEMORY[0x263F77998];
    uint64_t v157 = MEMORY[0x263F8D310];
    uint64_t v158 = MEMORY[0x263F77998];
    sub_2519C9920();
    uint64_t v155 = v88;
    uint64_t v156 = v89;
    uint64_t v154 = 0;
    long long v152 = 0u;
    long long v153 = 0u;
    uint64_t v151 = 0;
    long long v149 = 0u;
    long long v150 = 0u;
    uint64_t v148 = MEMORY[0x263F774B0];
    uint64_t v147 = MEMORY[0x263F1B720];
    uint64_t v134 = v87;
    uint64_t v146 = v87;
    swift_retain();
    v90 = v123;
    sub_2519CA120();
    sub_2519C9920();
    uint64_t v157 = v88;
    uint64_t v158 = v89;
    (*(void (**)(char *, void, uint64_t))(v136 + 104))(v135, *MEMORY[0x263F77780], v137);
    v91 = v145;
    sub_2519CA0E0();
    uint64_t v92 = sub_2519C9EC0();
    LOBYTE(v86) = sub_2519C9C50();
    uint64_t v93 = v138;
    uint64_t v94 = (uint64_t)v128;
    uint64_t v95 = v139;
    (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v128, v91, v139);
    uint64_t v96 = v94 + *(int *)(v127 + 36);
    *(void *)uint64_t v96 = v92;
    *(unsigned char *)(v96 + 8) = v86;
    (*(void (**)(char *, uint64_t))(v93 + 8))(v91, v95);
    uint64_t v97 = v129;
    sub_2519828D4(v94, v129, &qword_269B93DB0);
    uint64_t v98 = v124;
    v99 = *(void (**)(char *, char *, uint64_t))(v124 + 16);
    v100 = v122;
    uint64_t v101 = v126;
    v99(v122, v90, v126);
    sub_251982930(v97, v94, &qword_269B93DB0);
    uint64_t v102 = (uint64_t)v125;
    v99(v125, v100, v101);
    uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DE0);
    sub_251982930(v94, v102 + *(int *)(v103 + 48), &qword_269B93DB0);
    sub_251982980(v94, &qword_269B93DB0);
    v104 = *(void (**)(char *, uint64_t))(v98 + 8);
    v104(v100, v101);
    sub_251982930(v102, v142, &qword_269B93D08);
    swift_storeEnumTagMultiPayload();
    sub_251980F3C();
    sub_2519827F8(&qword_269B93D00, &qword_269B93D08);
    sub_2519C9C30();
    swift_release();
    sub_251982980(v102, &qword_269B93D08);
    sub_251982980(v97, &qword_269B93DB0);
    return ((uint64_t (*)(char *, uint64_t))v104)(v90, v101);
  }
  else
  {
LABEL_12:
    sub_2519CA170();
    sub_251982468(&qword_269B93CB0, MEMORY[0x263F77980]);
    uint64_t result = sub_2519C9AB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_25197E7BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v51 = sub_2519CA130();
  uint64_t v49 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  uint64_t v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E08);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v50 = (uint64_t)&v49 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E10);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E18);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v49 - v19;
  *(void *)uint64_t v13 = sub_2519C9B70();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E20);
  sub_25197EC40(a1, (uint64_t)&v13[*(int *)(v21 + 44)]);
  char v22 = sub_2519C9C70();
  sub_2519C9A40();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_251982930((uint64_t)v13, (uint64_t)v18, &qword_269B93E10);
  uint64_t v31 = &v18[*(int *)(v15 + 44)];
  *uint64_t v31 = v22;
  *((void *)v31 + 1) = v24;
  *((void *)v31 + 2) = v26;
  *((void *)v31 + 3) = v28;
  *((void *)v31 + 4) = v30;
  v31[40] = 0;
  sub_251982980((uint64_t)v13, &qword_269B93E10);
  sub_2519828D4((uint64_t)v18, (uint64_t)v20, &qword_269B93E18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  uint64_t v32 = MEMORY[0x263F8D310];
  uint64_t v33 = MEMORY[0x263F77998];
  uint64_t v64 = MEMORY[0x263F8D310];
  uint64_t v65 = MEMORY[0x263F77998];
  type metadata accessor for AutomationSnippetModel();
  sub_2519C9920();
  uint64_t v62 = v32;
  uint64_t v63 = v33;
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v58 = 0;
  long long v57 = 0u;
  long long v56 = 0u;
  uint64_t v55 = 0;
  long long v54 = 0u;
  long long v53 = 0u;
  sub_2519CA120();
  LOBYTE(a1) = sub_2519C9C70();
  sub_2519C9A40();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v42 = v49;
  uint64_t v43 = v51;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v9, v4, v51);
  id v44 = &v9[*(int *)(v6 + 44)];
  *id v44 = a1;
  *((void *)v44 + 1) = v35;
  *((void *)v44 + 2) = v37;
  *((void *)v44 + 3) = v39;
  *((void *)v44 + 4) = v41;
  v44[40] = 0;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v4, v43);
  uint64_t v45 = v50;
  sub_2519828D4((uint64_t)v9, v50, &qword_269B93E08);
  sub_251982930((uint64_t)v20, (uint64_t)v18, &qword_269B93E18);
  sub_251982930(v45, (uint64_t)v9, &qword_269B93E08);
  uint64_t v46 = v52;
  sub_251982930((uint64_t)v18, v52, &qword_269B93E18);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E28);
  sub_251982930((uint64_t)v9, v46 + *(int *)(v47 + 48), &qword_269B93E08);
  sub_251982980(v45, &qword_269B93E08);
  sub_251982980((uint64_t)v20, &qword_269B93E18);
  sub_251982980((uint64_t)v9, &qword_269B93E08);
  return sub_251982980((uint64_t)v18, &qword_269B93E18);
}

uint64_t sub_25197EC40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v87 = a1;
  uint64_t v94 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E30);
  uint64_t v89 = *(void *)(v2 - 8);
  uint64_t v90 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v95 = (char *)v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v91 = (char *)v76 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v92 = (char *)v76 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E38);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2519C98F0();
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v86 = (char *)v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v81 = sub_2519CA000();
  uint64_t v17 = *(void *)(v81 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v81);
  uint64_t v82 = (char *)v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)v76 - v20;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E40) - 8;
  uint64_t v22 = MEMORY[0x270FA5388](v96);
  uint64_t v83 = (char *)v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)v76 - v24;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E48) - 8;
  uint64_t v26 = MEMORY[0x270FA5388](v80);
  uint64_t v85 = (uint64_t)v76 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  uint64_t v93 = (char *)v76 - v28;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E50);
  uint64_t v29 = MEMORY[0x270FA5388](v79);
  uint64_t v84 = (uint64_t)v76 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)v76 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v97 = (uint64_t)v76 - v34;
  uint64_t v88 = type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519824B0((uint64_t)v13, (void (*)(void))type metadata accessor for IconConfiguration);
  sub_2519C98E0();
  swift_bridgeObjectRelease();
  sub_2519CA010();
  uint64_t v78 = sub_2519C9CB0();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v78);
  uint64_t v35 = sub_2519C9CC0();
  sub_251982980((uint64_t)v10, &qword_269B93E38);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = v17;
  uint64_t v77 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  uint64_t v38 = v81;
  v77(v25, v21, v81);
  uint64_t v39 = (uint64_t *)&v25[*(int *)(v96 + 44)];
  uint64_t *v39 = KeyPath;
  v39[1] = v35;
  uint64_t v40 = *(void (**)(char *, uint64_t))(v37 + 8);
  v76[1] = v37 + 8;
  v40(v21, v38);
  LOBYTE(v35) = sub_2519C9C50();
  uint64_t v41 = (uint64_t)v93;
  sub_251982930((uint64_t)v25, (uint64_t)v93, &qword_269B93E40);
  uint64_t v42 = v80;
  uint64_t v43 = v41 + *(int *)(v80 + 44);
  *(unsigned char *)uint64_t v43 = v35;
  *(_OWORD *)(v43 + 8) = 0u;
  *(_OWORD *)(v43 + 24) = 0u;
  *(unsigned char *)(v43 + 40) = 1;
  sub_251982980((uint64_t)v25, &qword_269B93E40);
  uint64_t v44 = sub_2519C9F00();
  sub_251982930(v41, (uint64_t)v33, &qword_269B93E48);
  uint64_t v45 = v79;
  *(void *)&v33[*(int *)(v79 + 36)] = v44;
  sub_251982980(v41, &qword_269B93E48);
  uint64_t v93 = v33;
  sub_2519828D4((uint64_t)v33, v97, &qword_269B93E50);
  sub_2519C98E0();
  uint64_t v46 = v82;
  sub_2519CA010();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v78);
  uint64_t v47 = sub_2519C9CC0();
  sub_251982980((uint64_t)v10, &qword_269B93E38);
  uint64_t v48 = swift_getKeyPath();
  uint64_t v49 = (uint64_t)v83;
  v77(v83, v46, v38);
  uint64_t v50 = v90;
  uint64_t v51 = (uint64_t *)(v49 + *(int *)(v96 + 44));
  *uint64_t v51 = v48;
  v51[1] = v47;
  v40(v46, v38);
  LOBYTE(v47) = sub_2519C9CA0();
  sub_2519C9A40();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v85;
  sub_251982930(v49, v85, &qword_269B93E40);
  uint64_t v61 = v60 + *(int *)(v42 + 44);
  *(unsigned char *)uint64_t v61 = v47;
  *(void *)(v61 + 8) = v53;
  *(void *)(v61 + 16) = v55;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = v59;
  *(unsigned char *)(v61 + 40) = 0;
  sub_251982980(v49, &qword_269B93E40);
  uint64_t v62 = sub_2519C9E60();
  uint64_t v63 = v84;
  sub_251982930(v60, v84, &qword_269B93E48);
  *(void *)(v63 + *(int *)(v45 + 36)) = v62;
  sub_251982980(v60, &qword_269B93E48);
  sub_25198260C();
  sub_2519C9DF0();
  sub_251982980(v63, &qword_269B93E50);
  uint64_t v64 = v89;
  uint64_t v65 = v92;
  uint64_t v66 = v50;
  (*(void (**)(void))(v89 + 32))();
  if (*(unsigned char *)(v87 + *(int *)(type metadata accessor for AutomationView() + 24)) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    sub_2519C9920();
    uint64_t v98 = v100;
    char v99 = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    sub_2519C9920();
    uint64_t v98 = v100;
    char v99 = 1;
  }
  sub_25198283C();
  sub_251982888();
  sub_2519C9C30();
  uint64_t v67 = v100;
  LODWORD(v96) = v101;
  uint64_t v68 = (uint64_t)v93;
  sub_251982930(v97, (uint64_t)v93, &qword_269B93E50);
  uint64_t v69 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
  uint64_t v70 = v95;
  v69(v95, v65, v66);
  uint64_t v71 = v94;
  sub_251982930(v68, v94, &qword_269B93E50);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E90);
  v69((char *)(v71 + *(int *)(v72 + 48)), v70, v66);
  uint64_t v73 = v71 + *(int *)(v72 + 64);
  *(void *)uint64_t v73 = v67;
  *(unsigned char *)(v73 + 8) = v96;
  uint64_t v74 = *(void (**)(char *, uint64_t))(v64 + 8);
  swift_bridgeObjectRetain();
  v74(v65, v66);
  sub_251982980(v97, &qword_269B93E50);
  swift_bridgeObjectRelease();
  v74(v70, v66);
  return sub_251982980(v68, &qword_269B93E50);
}

uint64_t sub_25197F5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v57 = sub_2519CA130();
  uint64_t v56 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v54 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E98) - 8;
  uint64_t v4 = MEMORY[0x270FA5388](v53);
  uint64_t v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v55 = (uint64_t)&v53 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EA0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EA8);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EB0);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v53 - v20;
  *(void *)uint64_t v10 = sub_2519C9B70();
  *((void *)v10 + 1) = 0;
  v10[16] = 0;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EB8);
  sub_25197FB20(a1, (uint64_t)&v10[*(int *)(v22 + 44)]);
  char v23 = sub_2519C9C60();
  sub_2519C9A40();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_251982930((uint64_t)v10, (uint64_t)v14, &qword_269B93EA0);
  uint64_t v32 = &v14[*(int *)(v12 + 44)];
  *uint64_t v32 = v23;
  *((void *)v32 + 1) = v25;
  *((void *)v32 + 2) = v27;
  *((void *)v32 + 3) = v29;
  *((void *)v32 + 4) = v31;
  v32[40] = 0;
  sub_251982980((uint64_t)v10, &qword_269B93EA0);
  LOBYTE(v12) = sub_2519C9C70();
  sub_2519C9A40();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_251982930((uint64_t)v14, (uint64_t)v19, &qword_269B93EA8);
  uint64_t v41 = &v19[*(int *)(v16 + 44)];
  *uint64_t v41 = v12;
  *((void *)v41 + 1) = v34;
  *((void *)v41 + 2) = v36;
  *((void *)v41 + 3) = v38;
  *((void *)v41 + 4) = v40;
  v41[40] = 0;
  sub_251982980((uint64_t)v14, &qword_269B93EA8);
  sub_2519828D4((uint64_t)v19, (uint64_t)v21, &qword_269B93EB0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  uint64_t v42 = MEMORY[0x263F8D310];
  uint64_t v43 = MEMORY[0x263F77998];
  uint64_t v70 = MEMORY[0x263F8D310];
  uint64_t v71 = MEMORY[0x263F77998];
  type metadata accessor for AutomationSnippetModel();
  sub_2519C9920();
  uint64_t v68 = v42;
  uint64_t v69 = v43;
  uint64_t v67 = 0;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v64 = 0;
  long long v63 = 0u;
  long long v62 = 0u;
  uint64_t v61 = 0;
  long long v60 = 0u;
  long long v59 = 0u;
  uint64_t v44 = v54;
  sub_2519CA120();
  uint64_t v45 = sub_2519C9EC0();
  LOBYTE(v10) = sub_2519C9C50();
  uint64_t v46 = v56;
  uint64_t v47 = v57;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v6, v44, v57);
  uint64_t v48 = &v6[*(int *)(v53 + 44)];
  *(void *)uint64_t v48 = v45;
  v48[8] = (char)v10;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v44, v47);
  uint64_t v49 = v55;
  sub_2519828D4((uint64_t)v6, v55, &qword_269B93E98);
  sub_251982930((uint64_t)v21, (uint64_t)v19, &qword_269B93EB0);
  sub_251982930(v49, (uint64_t)v6, &qword_269B93E98);
  uint64_t v50 = v58;
  sub_251982930((uint64_t)v19, v58, &qword_269B93EB0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EC0);
  sub_251982930((uint64_t)v6, v50 + *(int *)(v51 + 48), &qword_269B93E98);
  sub_251982980(v49, &qword_269B93E98);
  sub_251982980((uint64_t)v21, &qword_269B93EB0);
  sub_251982980((uint64_t)v6, &qword_269B93E98);
  return sub_251982980((uint64_t)v19, &qword_269B93EB0);
}

uint64_t sub_25197FB20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v109 = a1;
  uint64_t v122 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E38);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v112 = (uint64_t)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E40) - 8;
  MEMORY[0x270FA5388](v115);
  v113 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E48) - 8;
  MEMORY[0x270FA5388](v118);
  uint64_t v114 = (uint64_t)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EC8) - 8;
  MEMORY[0x270FA5388](v119);
  uint64_t v117 = (uint64_t)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93ED0) - 8;
  uint64_t v7 = MEMORY[0x270FA5388](v120);
  uint64_t v121 = (uint64_t)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v116 = (uint64_t)&v97 - v10;
  MEMORY[0x270FA5388](v9);
  v111 = (char *)&v97 - v11;
  uint64_t v99 = sub_2519C9860();
  uint64_t v106 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  uint64_t v13 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2519C98F0();
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v108 = (char *)&v97 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v123 = sub_2519CA000();
  uint64_t v105 = *(void *)(v123 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v123);
  uint64_t v107 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  char v23 = (char *)&v97 - v22;
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DA0);
  uint64_t v103 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  uint64_t v25 = (char *)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93ED8);
  uint64_t v27 = v26 - 8;
  MEMORY[0x270FA5388](v26);
  uint64_t v29 = (char *)&v97 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EE0) - 8;
  MEMORY[0x270FA5388](v101);
  uint64_t v31 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EE8) - 8;
  uint64_t v32 = MEMORY[0x270FA5388](v102);
  uint64_t v98 = (char *)&v97 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v100 = (uint64_t)&v97 - v34;
  uint64_t v110 = type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519824B0((uint64_t)v16, (void (*)(void))type metadata accessor for IconConfiguration);
  sub_2519C98E0();
  swift_bridgeObjectRelease();
  sub_2519CA010();
  uint64_t v35 = v106;
  uint64_t v36 = v99;
  (*(void (**)(char *, void, uint64_t))(v106 + 104))(v13, *MEMORY[0x263F76558], v99);
  sub_251982468(&qword_269B93D70, MEMORY[0x263F77558]);
  uint64_t v37 = v25;
  uint64_t v38 = v13;
  uint64_t v39 = v123;
  sub_2519C9D40();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v36);
  uint64_t v40 = v105;
  uint64_t v106 = *(void *)(v105 + 8);
  ((void (*)(char *, uint64_t))v106)(v23, v39);
  char v41 = sub_2519C9C80();
  sub_2519C9A40();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v50 = v103;
  uint64_t v51 = v104;
  (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v29, v37, v104);
  uint64_t v52 = &v29[*(int *)(v27 + 44)];
  *uint64_t v52 = v41;
  *((void *)v52 + 1) = v43;
  *((void *)v52 + 2) = v45;
  *((void *)v52 + 3) = v47;
  *((void *)v52 + 4) = v49;
  v52[40] = 0;
  (*(void (**)(char *, uint64_t))(v50 + 8))(v37, v51);
  LOBYTE(v27) = sub_2519C9C50();
  sub_251982930((uint64_t)v29, (uint64_t)v31, &qword_269B93ED8);
  uint64_t v53 = &v31[*(int *)(v101 + 44)];
  *uint64_t v53 = v27;
  *(_OWORD *)(v53 + 8) = 0u;
  *(_OWORD *)(v53 + 24) = 0u;
  v53[40] = 1;
  uint64_t v54 = (uint64_t)v29;
  uint64_t v55 = (uint64_t)v98;
  sub_251982980(v54, &qword_269B93ED8);
  uint64_t v56 = sub_2519C9F00();
  sub_251982930((uint64_t)v31, v55, &qword_269B93EE0);
  *(void *)(v55 + *(int *)(v102 + 44)) = v56;
  sub_251982980((uint64_t)v31, &qword_269B93EE0);
  uint64_t v57 = v100;
  sub_2519828D4(v55, v100, &qword_269B93EE8);
  sub_2519C98E0();
  uint64_t v58 = v107;
  sub_2519CA010();
  uint64_t v59 = sub_2519C9CB0();
  uint64_t v60 = v112;
  __swift_storeEnumTagSinglePayload(v112, 1, 1, v59);
  uint64_t v61 = sub_2519C9CC0();
  sub_251982980(v60, &qword_269B93E38);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v63 = (uint64_t)v113;
  uint64_t v64 = v123;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v113, v58, v123);
  long long v65 = (uint64_t *)(v63 + *(int *)(v115 + 44));
  *long long v65 = KeyPath;
  v65[1] = v61;
  ((void (*)(char *, uint64_t))v106)(v58, v64);
  uint64_t v66 = (uint64_t)v111;
  LOBYTE(v61) = sub_2519C9CA0();
  sub_2519C9A40();
  uint64_t v68 = v67;
  uint64_t v70 = v69;
  uint64_t v72 = v71;
  uint64_t v74 = v73;
  uint64_t v75 = v114;
  sub_251982930(v63, v114, &qword_269B93E40);
  uint64_t v76 = v75 + *(int *)(v118 + 44);
  *(unsigned char *)uint64_t v76 = v61;
  *(void *)(v76 + 8) = v68;
  *(void *)(v76 + 16) = v70;
  *(void *)(v76 + 24) = v72;
  *(void *)(v76 + 32) = v74;
  *(unsigned char *)(v76 + 40) = 0;
  sub_251982980(v63, &qword_269B93E40);
  LOBYTE(v61) = sub_2519C9C80();
  sub_2519C9A40();
  uint64_t v78 = v77;
  uint64_t v80 = v79;
  uint64_t v82 = v81;
  uint64_t v84 = v83;
  uint64_t v85 = v117;
  sub_251982930(v75, v117, &qword_269B93E48);
  uint64_t v86 = v85 + *(int *)(v119 + 44);
  *(unsigned char *)uint64_t v86 = v61;
  *(void *)(v86 + 8) = v78;
  *(void *)(v86 + 16) = v80;
  *(void *)(v86 + 24) = v82;
  *(void *)(v86 + 32) = v84;
  *(unsigned char *)(v86 + 40) = 0;
  sub_251982980(v75, &qword_269B93E48);
  uint64_t v87 = sub_2519C9E60();
  uint64_t v88 = v116;
  sub_251982930(v85, v116, &qword_269B93EC8);
  *(void *)(v88 + *(int *)(v120 + 44)) = v87;
  sub_251982980(v85, &qword_269B93EC8);
  sub_2519828D4(v88, v66, &qword_269B93ED0);
  if (*(unsigned char *)(v109 + *(int *)(type metadata accessor for AutomationView() + 24)) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    sub_2519C9920();
    uint64_t v124 = v126;
    char v125 = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    sub_2519C9920();
    uint64_t v124 = v126;
    char v125 = 1;
  }
  sub_25198283C();
  sub_251982888();
  sub_2519C9C30();
  uint64_t v89 = v126;
  char v90 = v127;
  uint64_t v91 = v57;
  sub_251982930(v57, v55, &qword_269B93EE8);
  uint64_t v92 = v121;
  sub_251982930(v66, v121, &qword_269B93ED0);
  uint64_t v93 = v122;
  sub_251982930(v55, v122, &qword_269B93EE8);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93EF0);
  sub_251982930(v92, v93 + *(int *)(v94 + 48), &qword_269B93ED0);
  uint64_t v95 = v93 + *(int *)(v94 + 64);
  *(void *)uint64_t v95 = v89;
  *(unsigned char *)(v95 + 8) = v90;
  swift_bridgeObjectRetain();
  sub_251982980(v66, &qword_269B93ED0);
  sub_251982980(v91, &qword_269B93EE8);
  swift_bridgeObjectRelease();
  sub_251982980(v92, &qword_269B93ED0);
  return sub_251982980(v55, &qword_269B93EE8);
}

void sub_2519806E4()
{
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  type metadata accessor for AutomationView();
  sub_2519CA2F0();
  sub_2519C9980();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2519C99D0();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
  v1._countAndFlagsBits = 0xD000000000000067;
  v2._object = (void *)0x80000002519CE120;
  v1._object = (void *)0x80000002519CE090;
  v2._countAndFlagsBits = 0xD000000000000027;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

uint64_t sub_25198082C()
{
  return sub_2519C9DE0();
}

uint64_t sub_251980850()
{
  return sub_251980880();
}

uint64_t sub_251980880()
{
  return sub_2519C9FE0();
}

uint64_t sub_25198097C@<X0>(uint64_t a1@<X8>)
{
  sub_2519C9860();
  OUTLINED_FUNCTION_4_0();
  uint64_t v44 = v3;
  uint64_t v45 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5();
  uint64_t v43 = v5 - v4;
  uint64_t v6 = sub_2519C98F0();
  MEMORY[0x270FA5388](v6 - 8);
  OUTLINED_FUNCTION_5();
  uint64_t v40 = sub_2519CA000();
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_6_1();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D60);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5();
  uint64_t v13 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D90);
  OUTLINED_FUNCTION_4_0();
  uint64_t v41 = v15;
  uint64_t v42 = v14;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_5();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D58);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_5();
  uint64_t v23 = v22 - v21;
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  if (v47)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    sub_2519C9920();
    sub_2519C98E0();
    swift_bridgeObjectRelease();
    sub_2519CA010();
    char v24 = sub_2519C9CA0();
    sub_2519C9A40();
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    OUTLINED_FUNCTION_8_1();
    v33();
    uint64_t v34 = v13 + *(int *)(v39 + 36);
    *(unsigned char *)uint64_t v34 = v24;
    *(void *)(v34 + 8) = v26;
    *(void *)(v34 + 16) = v28;
    *(void *)(v34 + 24) = v30;
    *(void *)(v34 + 32) = v32;
    *(unsigned char *)(v34 + 40) = 0;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v40);
    (*(void (**)(uint64_t, void, uint64_t))(v44 + 104))(v43, *MEMORY[0x263F76568], v45);
    sub_2519823BC();
    sub_2519C9D40();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
    sub_251982980(v13, &qword_269B93D60);
    uint64_t v35 = static ColorUtils.fromString(_:)();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_1();
    v36();
    *(void *)(v23 + *(int *)(v19 + 36)) = v35;
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v18, v42);
    sub_2519828D4(v23, a1, &qword_269B93D58);
    uint64_t v37 = 0;
  }
  else
  {
    uint64_t v37 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a1, v37, 1, v19);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_251980D90(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_9_0();
  v5(v4);
  return a2;
}

uint64_t sub_251980DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutomationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_251980E4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AutomationView();
  OUTLINED_FUNCTION_4_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_25197D29C(v5, a1);
}

unint64_t sub_251980E9C()
{
  unint64_t result = qword_269B93CC8;
  if (!qword_269B93CC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93CC0);
    sub_251980F3C();
    sub_2519827F8(&qword_269B93D00, &qword_269B93D08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93CC8);
  }
  return result;
}

unint64_t sub_251980F3C()
{
  unint64_t result = qword_269B93CD0;
  if (!qword_269B93CD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93CD8);
    sub_2519827F8(&qword_269B93CE0, &qword_269B93CE8);
    sub_2519827F8(&qword_269B93CF0, &qword_269B93CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93CD0);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for AutomationView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = *(void (**)(void))(v7 + 8);
  OUTLINED_FUNCTION_7_1();
  v8();
  type metadata accessor for AutomationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v10();
  OUTLINED_FUNCTION_7_1();
  v8();
  OUTLINED_FUNCTION_7_1();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v11();

  sub_2519C99B0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v12();

  return MEMORY[0x270FA0238](v0, v4, v5);
}

void sub_251981200()
{
  uint64_t v0 = type metadata accessor for AutomationView();
  OUTLINED_FUNCTION_4_1(v0);

  sub_2519806E4();
}

uint64_t sub_251981240()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for AutomationView(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v35 = *a2;
    *a1 = *a2;
    a1 = (void *)(v35 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = (int *)type metadata accessor for AutomationSnippetModel();
    uint64_t v10 = v9[5];
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = v9[6];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    v8((void *)((char *)a1 + v9[7]), (void *)((char *)a2 + v9[7]), v7);
    v8((void *)((char *)a1 + v9[8]), (void *)((char *)a2 + v9[8]), v7);
    uint64_t v18 = v9[9];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = a3[5];
    uint64_t v23 = a3[6];
    char v24 = (void *)((char *)a1 + v22);
    uint64_t v25 = (char *)a2 + v22;
    uint64_t v27 = *(void **)v25;
    uint64_t v26 = *((void *)v25 + 1);
    char v28 = *((unsigned char *)a2 + v23);
    *char v24 = v27;
    v24[1] = v26;
    *((unsigned char *)a1 + v23) = v28;
    uint64_t v29 = a3[7];
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = sub_2519C99B0();
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
    id v34 = v27;
    v33(v30, v31, v32);
  }
  return a1;
}

uint64_t destroy for AutomationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = (int *)type metadata accessor for AutomationSnippetModel();
  uint64_t v7 = a1 + v6[5];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + v6[6];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v5(a1 + v6[7], v4);
  v5(a1 + v6[8], v4);
  uint64_t v11 = a1 + v6[9];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  uint64_t v13 = a1 + *(int *)(a2 + 28);
  uint64_t v14 = sub_2519C99B0();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);

  return v15(v13, v14);
}

uint64_t initializeWithCopy for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for AutomationSnippetModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = v8[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  uint64_t v17 = v8[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = a3[5];
  uint64_t v22 = a3[6];
  uint64_t v23 = (void *)(a1 + v21);
  uint64_t v24 = a2 + v21;
  uint64_t v26 = *(void **)v24;
  uint64_t v25 = *(void *)(v24 + 8);
  char v27 = *(unsigned char *)(a2 + v22);
  *uint64_t v23 = v26;
  v23[1] = v25;
  *(unsigned char *)(a1 + v22) = v27;
  uint64_t v28 = a3[7];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  uint64_t v31 = sub_2519C99B0();
  uint64_t v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16);
  id v33 = v26;
  v32(v29, v30, v31);
  return a1;
}

uint64_t assignWithCopy for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for AutomationSnippetModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = v8[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  uint64_t v17 = v8[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  uint64_t v21 = a3[5];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void **)(a1 + v21);
  uint64_t v25 = *(void **)(a2 + v21);
  *uint64_t v22 = v25;
  id v26 = v25;

  v22[1] = *(void *)(v23 + 8);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v27 = a3[7];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
  return a1;
}

uint64_t initializeWithTake for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for AutomationSnippetModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = v8[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  uint64_t v17 = v8[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v21) = *(unsigned char *)(a2 + v21);
  uint64_t v22 = a3[7];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
  return a1;
}

uint64_t assignWithTake for AutomationView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = (int *)type metadata accessor for AutomationSnippetModel();
  uint64_t v9 = v8[5];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = v8[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  v7(a1 + v8[7], a2 + v8[7], v6);
  v7(a1 + v8[8], a2 + v8[8], v6);
  uint64_t v17 = v8[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[5];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = *(void **)(a1 + v21);
  *uint64_t v22 = *v23;

  v22[1] = v23[1];
  uint64_t v25 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 40))(v26, v27, v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for AutomationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_251981F58);
}

uint64_t sub_251981F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_2519C99B0();
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for AutomationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_251982028);
}

void sub_251982028(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_2519C99B0();
    uint64_t v11 = a1 + *(int *)(a4 + 28);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_2519820D4()
{
  uint64_t result = type metadata accessor for AutomationSnippetModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2519C99B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_2519821B4()
{
  unint64_t result = qword_269B93D28;
  if (!qword_269B93D28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93D10);
    sub_2519827F8(&qword_269B93D30, &qword_269B93CB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93D28);
  }
  return result;
}

ValueMetadata *type metadata accessor for DevicesSnippetView()
{
  return &type metadata for DevicesSnippetView;
}

ValueMetadata *type metadata accessor for ScenesSnippetView()
{
  return &type metadata for ScenesSnippetView;
}

uint64_t sub_251982274()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_251982290()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2519822AC()
{
  return sub_251982A20(&qword_269B93D48, &qword_269B93D38, (void (*)(void))sub_2519822E8);
}

unint64_t sub_2519822E8()
{
  unint64_t result = qword_269B93D50;
  if (!qword_269B93D50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93D58);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93D60);
    sub_2519823BC();
    swift_getOpaqueTypeConformance2();
    sub_2519827F8(&qword_269B93D78, &qword_269B93D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93D50);
  }
  return result;
}

unint64_t sub_2519823BC()
{
  unint64_t result = qword_269B93D68;
  if (!qword_269B93D68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93D60);
    sub_251982468(&qword_269B93D70, MEMORY[0x263F77558]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93D68);
  }
  return result;
}

uint64_t sub_251982468(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519824B0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

unint64_t sub_251982504()
{
  unint64_t result = qword_269B93DD8;
  if (!qword_269B93DD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93DA8);
    sub_2519CA000();
    sub_251982468(&qword_269B93D70, MEMORY[0x263F77558]);
    swift_getOpaqueTypeConformance2();
    sub_2519827F8(&qword_269B93D78, &qword_269B93D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93DD8);
  }
  return result;
}

unint64_t sub_25198260C()
{
  unint64_t result = qword_269B93E58;
  if (!qword_269B93E58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93E50);
    sub_2519826AC();
    sub_2519827F8(&qword_269B93D78, &qword_269B93D80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93E58);
  }
  return result;
}

unint64_t sub_2519826AC()
{
  unint64_t result = qword_269B93E60;
  if (!qword_269B93E60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93E48);
    sub_251982728();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93E60);
  }
  return result;
}

unint64_t sub_251982728()
{
  unint64_t result = qword_269B93E68;
  if (!qword_269B93E68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93E40);
    sub_251982468(&qword_269B93D70, MEMORY[0x263F77558]);
    sub_2519827F8(&qword_269B93E70, &qword_269B93E78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93E68);
  }
  return result;
}

uint64_t sub_2519827F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25198283C()
{
  unint64_t result = qword_269B93E80;
  if (!qword_269B93E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93E80);
  }
  return result;
}

unint64_t sub_251982888()
{
  unint64_t result = qword_269B93E88;
  if (!qword_269B93E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93E88);
  }
  return result;
}

uint64_t sub_2519828D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_251982930(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_9_0();
  v5(v4);
  return a2;
}

uint64_t sub_251982980(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

uint64_t sub_2519829D0()
{
  return sub_251982A20(&qword_269B93EF8, &qword_269B93F00, (void (*)(void))sub_2519822AC);
}

uint64_t sub_251982A20(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

uint64_t TemperatureSnippetModel.primaryText.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t sub_251982B2C()
{
  return TemperatureSnippetModel.primaryText.setter();
}

uint64_t TemperatureSnippetModel.primaryText.setter()
{
  return sub_2519C9930();
}

uint64_t (*TemperatureSnippetModel.primaryText.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  v1[4] = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t TemperatureSnippetModel.secondaryText.getter()
{
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  return v1;
}

uint64_t type metadata accessor for TemperatureSnippetModel()
{
  uint64_t result = qword_269B93F80;
  if (!qword_269B93F80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TemperatureSnippetModel.secondaryText.setter()
{
  return sub_2519C9930();
}

uint64_t (*TemperatureSnippetModel.secondaryText.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t TemperatureSnippetModel.temperature.getter()
{
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  return v1;
}

uint64_t sub_251982D90(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v6, v7);
}

uint64_t TemperatureSnippetModel.temperature.setter()
{
  return sub_2519C9930();
}

uint64_t (*TemperatureSnippetModel.temperature.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t TemperatureSnippetModel.isHeating.getter()
{
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  return v1;
}

uint64_t TemperatureSnippetModel.isHeating.setter()
{
  return sub_2519C9930();
}

uint64_t (*TemperatureSnippetModel.isHeating.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t TemperatureSnippetModel.punchOut.getter()
{
  return sub_2519C9920();
}

uint64_t sub_251982FC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2519830FC(a1, (uint64_t)v4);
  return TemperatureSnippetModel.punchOut.setter((uint64_t)v4);
}

uint64_t TemperatureSnippetModel.punchOut.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388](v2 - 8);
  OUTLINED_FUNCTION_5();
  sub_2519830FC(a1, v4 - v3);
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  sub_2519C9930();
  return sub_251983164(a1);
}

uint64_t sub_2519830FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_251983164(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t (*TemperatureSnippetModel.punchOut.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t sub_251983224()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_251983274()
{
  return 5;
}

uint64_t sub_25198327C(char a1)
{
  return *(void *)&aTemperatprimar[8 * a1];
}

uint64_t sub_25198329C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2519BE678(*a1, *a2);
}

uint64_t sub_2519832A8()
{
  return sub_2519BE948();
}

uint64_t sub_2519832B0(uint64_t a1)
{
  return sub_2519BEBD0(a1, *v1);
}

uint64_t sub_2519832B8(uint64_t a1)
{
  return sub_2519BEF6C(a1, *v1);
}

uint64_t sub_2519832C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251983224();
  *a1 = result;
  return result;
}

uint64_t sub_2519832F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25198327C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25198331C()
{
  return sub_25198327C(*v0);
}

uint64_t sub_251983324@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251983270();
  *a1 = result;
  return result;
}

uint64_t sub_25198334C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251983274();
  *a1 = result;
  return result;
}

uint64_t sub_251983374(uint64_t a1)
{
  unint64_t v2 = sub_251983C08();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519833B0(uint64_t a1)
{
  unint64_t v2 = sub_251983C08();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::String __swiftcall TemperatureSnippetModel.responseViewId()()
{
  unint64_t v0 = (void *)0x80000002519CE150;
  uint64_t v1 = 0xD000000000000019;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t TemperatureSnippetModel.init(primaryText:temperature:secondaryText:isHeating:punchOut:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  int v30 = a7;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  OUTLINED_FUNCTION_0();
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v23 - v15;
  uint64_t v17 = type metadata accessor for TemperatureSnippetModel();
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  sub_2519C9900();
  uint64_t v18 = a9 + *(int *)(v17 + 24);
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  sub_2519C9900();
  LOBYTE(v31) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  OUTLINED_FUNCTION_10_0();
  sub_2519C9900();
  uint64_t v19 = sub_2519C9820();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v19);
  sub_2519830FC((uint64_t)v16, (uint64_t)v14);
  sub_2519C9900();
  sub_251983164((uint64_t)v16);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v18, v20);
  uint64_t v31 = v24;
  uint64_t v32 = v25;
  sub_2519C9900();
  uint64_t v31 = v26;
  uint64_t v32 = v27;
  sub_2519C9900();
  uint64_t v31 = v28;
  uint64_t v32 = v29;
  sub_2519C9930();
  LOBYTE(v31) = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  OUTLINED_FUNCTION_10_0();
  sub_2519C9930();
  sub_2519830FC(a8, (uint64_t)v16);
  sub_2519830FC((uint64_t)v16, (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  sub_2519C9930();
  sub_251983164((uint64_t)v16);
  return sub_251983164(a8);
}

uint64_t TemperatureSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F30);
  OUTLINED_FUNCTION_4_0();
  uint64_t v48 = v5;
  uint64_t v49 = v4;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  uint64_t v56 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_2();
  uint64_t v47 = v9;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v42 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v42 - v14;
  uint64_t v16 = type metadata accessor for TemperatureSnippetModel();
  uint64_t v17 = (int *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_7_2();
  uint64_t v18 = v2 + v17[7];
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  uint64_t v51 = v18;
  sub_2519C9900();
  uint64_t v19 = v2 + v17[8];
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  sub_2519C9900();
  uint64_t v20 = v2 + v17[9];
  LOBYTE(v54) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  OUTLINED_FUNCTION_10_0();
  uint64_t v53 = v20;
  sub_2519C9900();
  uint64_t v21 = v2 + v17[10];
  uint64_t v22 = sub_2519C9820();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v22);
  sub_2519830FC((uint64_t)v15, (uint64_t)v13);
  uint64_t v52 = v21;
  sub_2519C9900();
  sub_251983164((uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_251983C08();
  uint64_t v23 = v50;
  sub_2519CA550();
  if (v23)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0();
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v28(v51, v26);
    v28(v19, v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    OUTLINED_FUNCTION_0();
    (*(void (**)(uint64_t))(v29 + 8))(v53);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    OUTLINED_FUNCTION_0();
    return (*(uint64_t (**)(uint64_t))(v30 + 8))(v52);
  }
  else
  {
    uint64_t v44 = v15;
    uint64_t v45 = v22;
    uint64_t v50 = v2;
    uint64_t v24 = v48;
    uint64_t v25 = v49;
    LOBYTE(v54) = 1;
    uint64_t v54 = sub_2519CA460();
    uint64_t v55 = v31;
    sub_2519C9900();
    LOBYTE(v54) = 2;
    uint64_t v32 = v25;
    uint64_t v33 = sub_2519CA460();
    uint64_t v43 = a1;
    uint64_t v54 = v33;
    uint64_t v55 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    sub_2519C9930();
    LOBYTE(v54) = 0;
    OUTLINED_FUNCTION_9_1();
    uint64_t v54 = sub_2519CA460();
    uint64_t v55 = v35;
    sub_2519C9930();
    LOBYTE(v54) = 3;
    OUTLINED_FUNCTION_9_1();
    LOBYTE(v54) = sub_2519CA470() & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    OUTLINED_FUNCTION_10_0();
    sub_2519C9930();
    LOBYTE(v54) = 4;
    sub_251984930(&qword_269B93F40, MEMORY[0x263F06EA8]);
    uint64_t v36 = v56;
    sub_2519CA480();
    uint64_t v37 = v50;
    uint64_t v38 = v46;
    uint64_t v39 = v47;
    uint64_t v40 = (uint64_t)v44;
    __swift_storeEnumTagSinglePayload(v47, 0, 1, v45);
    sub_2519830FC(v39, v40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    sub_2519C9930();
    sub_251983164(v39);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v36, v32);
    sub_251983C54(v37, v38);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    return sub_251983CB8(v37);
  }
}

unint64_t sub_251983C08()
{
  unint64_t result = qword_269B93F38;
  if (!qword_269B93F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93F38);
  }
  return result;
}

uint64_t sub_251983C54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TemperatureSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_251983CB8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TemperatureSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t TemperatureSnippetModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_7_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F48);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_251983C08();
  sub_2519CA560();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA4B0();
  if (v10)
  {
    uint64_t v5 = OUTLINED_FUNCTION_11_0();
    v6(v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for TemperatureSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    sub_2519C9920();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
    sub_251984094((unint64_t *)&qword_269B93F50, &qword_269B93F20);
    OUTLINED_FUNCTION_8_2();
    swift_bridgeObjectRelease();
    sub_2519C9920();
    OUTLINED_FUNCTION_8_2();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    sub_2519C9920();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
    sub_251984094(&qword_269B93F58, &qword_269B93F28);
    sub_2519CA4D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    sub_2519C9920();
    sub_2519840F8();
    sub_2519CA4D0();
    sub_251983164(v1);
    uint64_t v8 = OUTLINED_FUNCTION_11_0();
    return v9(v8);
  }
}

uint64_t sub_251984094(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2519840F8()
{
  unint64_t result = qword_269B93F60;
  if (!qword_269B93F60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93F18);
    sub_251984930(&qword_269B93F68, MEMORY[0x263F06EA8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93F60);
  }
  return result;
}

unint64_t TemperatureSnippetModel.description.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v2 = v1 - v0;
  uint64_t v3 = sub_2519C9820();
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_2();
  uint64_t v17 = v6;
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v16 - v7;
  unint64_t v21 = 0xD000000000000018;
  unint64_t v22 = 0x80000002519CE170;
  v20[0] = 0;
  v20[1] = 0xE000000000000000;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v20, "primaryText: ");
  HIWORD(v20[1]) = -4864;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v20[0] = 0;
  v20[1] = 0xE000000000000000;
  sub_2519CA210();
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  sub_2519CA400();
  sub_2519CA210();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  if (v20[1])
  {
    v20[0] = 0;
    v20[1] = 0xE000000000000000;
    sub_2519CA3B0();
    swift_bridgeObjectRelease();
    v20[0] = 0xD000000000000011;
    v20[1] = 0x80000002519CE190;
    sub_2519CA210();
    swift_bridgeObjectRelease();
    sub_2519CA210();
    swift_bridgeObjectRelease();
  }
  sub_2519C9920();
  if (v20[1])
  {
    v20[0] = 0;
    v20[1] = 0xE000000000000000;
    sub_2519CA3B0();
    swift_bridgeObjectRelease();
    v20[0] = 0x7265706D6574202CLL;
    v20[1] = 0xEF203A6572757461;
    sub_2519CA210();
    swift_bridgeObjectRelease();
    sub_2519CA210();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  sub_2519C9920();
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) == 1)
  {
    sub_251983164(v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v8, v2, v3);
    uint64_t v9 = v17;
    sub_2519C9810();
    uint64_t v10 = sub_2519C97F0();
    uint64_t v12 = v11;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v13(v9, v3);
    v20[0] = v10;
    v20[1] = v12;
    swift_bridgeObjectRetain();
    LOBYTE(v10) = sub_2519CA250();
    uint64_t v14 = swift_bridgeObjectRelease();
    if (v10)
    {
      sub_251984668(v14);
      swift_bridgeObjectRelease();
    }
    uint64_t v18 = 0x74756F68636E7570;
    unint64_t v19 = 0xEA0000000000203ALL;
    sub_2519CA210();
    swift_bridgeObjectRelease();
    sub_2519CA210();
    sub_2519CA210();
    swift_bridgeObjectRelease();
    v13((uint64_t)v8, v3);
  }
  sub_2519CA210();
  return v21;
}

uint64_t sub_251984668(uint64_t a1)
{
  uint64_t v2 = v1[1];
  if ((v2 & 0x2000000000000000) == 0)
  {
    if ((*v1 & 0xFFFFFFFFFFFFLL) != 0) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if ((v2 & 0xF00000000000000) == 0)
  {
    __break(1u);
    return MEMORY[0x270F9D7B8](a1);
  }
LABEL_5:
  a1 = sub_2519CA1F0();

  return MEMORY[0x270F9D7B8](a1);
}

uint64_t TemperatureSnippetModel.stringId.getter()
{
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "#primaryText: ");
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  sub_2519CA1B0();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t sub_2519848A0()
{
  return sub_251984930(&qword_269B93F70, (void (*)(uint64_t))type metadata accessor for TemperatureSnippetModel);
}

uint64_t sub_2519848E8()
{
  return sub_251984930(&qword_269B93F78, (void (*)(uint64_t))type metadata accessor for TemperatureSnippetModel);
}

uint64_t sub_251984930(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_251984978@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TemperatureSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_251984990(void *a1)
{
  return TemperatureSnippetModel.encode(to:)(a1);
}

uint64_t sub_2519849A8()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = TemperatureSnippetModel.primaryText.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2519849D4()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = TemperatureSnippetModel.secondaryText.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2519849FC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_251982D90(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))TemperatureSnippetModel.secondaryText.setter);
}

uint64_t sub_251984A28()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = TemperatureSnippetModel.temperature.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_251984A50(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_251982D90(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))TemperatureSnippetModel.temperature.setter);
}

uint64_t sub_251984A7C()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = TemperatureSnippetModel.isHeating.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_251984AA4()
{
  return TemperatureSnippetModel.isHeating.setter();
}

uint64_t sub_251984ACC()
{
  return TemperatureSnippetModel.punchOut.getter();
}

char *initializeBufferWithCopyOfBuffer for TemperatureSnippetModel(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&a1[a3[6]], (char *)a2 + a3[6], v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    uint64_t v18 = &a1[v17];
    unint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t destroy for TemperatureSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[6], v6);
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);

  return v12(v10, v11);
}

uint64_t initializeWithCopy for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t assignWithCopy for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t initializeWithTake for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t assignWithTake for TemperatureSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(a1 + a3[6], a2 + a3[6], v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for TemperatureSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_251985464);
}

uint64_t sub_251985464(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[7];
      }
      else
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        uint64_t v12 = a3[8];
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for TemperatureSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25198554C);
}

uint64_t sub_25198554C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[7];
      }
      else
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        uint64_t v14 = a4[8];
      }
    }
    uint64_t v11 = a1 + v14;
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_251985628()
{
  sub_251985798();
  if (v0 <= 0x3F)
  {
    sub_2519857E4(319, &qword_269B93F90, &qword_269B93F20);
    if (v1 <= 0x3F)
    {
      sub_2519857E4(319, &qword_269B93F98, &qword_269B93F28);
      if (v2 <= 0x3F)
      {
        sub_2519857E4(319, &qword_269B93FA0, &qword_269B93F18);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_251985798()
{
  if (!qword_269B93C78)
  {
    unint64_t v0 = sub_2519C9950();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B93C78);
    }
  }
}

void sub_2519857E4(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_2519C9950();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for TemperatureSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for TemperatureSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x251985988);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TemperatureSnippetModel.CodingKeys()
{
  return &type metadata for TemperatureSnippetModel.CodingKeys;
}

unint64_t sub_2519859C4()
{
  unint64_t result = qword_269B93FA8;
  if (!qword_269B93FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93FA8);
  }
  return result;
}

unint64_t sub_251985A14()
{
  unint64_t result = qword_269B93FB0;
  if (!qword_269B93FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93FB0);
  }
  return result;
}

unint64_t sub_251985A64()
{
  unint64_t result = qword_269B93FB8;
  if (!qword_269B93FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93FB8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for TemperatureSnippetModel();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_2519CA4D0();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return v0;
}

uint64_t ConfirmationSnippetModel.primaryText.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationSnippetModel.primaryText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ConfirmationSnippetModel.primaryText.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.secondaryText.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationSnippetModel.secondaryText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ConfirmationSnippetModel.secondaryText.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.confirmationText.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationSnippetModel.confirmationText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ConfirmationSnippetModel.confirmationText.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.confirmLabel.getter()
{
  type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t type metadata accessor for ConfirmationSnippetModel()
{
  uint64_t result = qword_269B94038;
  if (!qword_269B94038) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_251985D64()
{
  return ConfirmationSnippetModel.confirmLabel.setter();
}

uint64_t ConfirmationSnippetModel.confirmLabel.setter()
{
  return sub_2519C9930();
}

uint64_t (*ConfirmationSnippetModel.confirmLabel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_7_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  *(void *)(v0 + 32) = sub_2519C9910();
  return sub_2519796F0;
}

uint64_t ConfirmationSnippetModel.denyLabel.getter()
{
  type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t sub_251985EA8()
{
  return ConfirmationSnippetModel.denyLabel.setter();
}

uint64_t ConfirmationSnippetModel.denyLabel.setter()
{
  return sub_2519C9930();
}

uint64_t (*ConfirmationSnippetModel.denyLabel.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_7_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  *(void *)(v0 + 32) = sub_2519C9910();
  return sub_2519796F0;
}

uint64_t ConfirmationSnippetModel.confirmDirectInvocation.getter()
{
  return sub_2519C9890();
}

uint64_t sub_251985FDC(id *a1)
{
  id v1 = *a1;
  return ConfirmationSnippetModel.confirmDirectInvocation.setter();
}

uint64_t ConfirmationSnippetModel.confirmDirectInvocation.setter()
{
  return sub_2519C98A0();
}

uint64_t (*ConfirmationSnippetModel.confirmDirectInvocation.modify())()
{
  id v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_7_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  *(void *)(v0 + 32) = sub_2519C9880();
  return sub_2519796F0;
}

uint64_t ConfirmationSnippetModel.denyDirectInvocation.getter()
{
  return sub_2519C9890();
}

uint64_t sub_2519860EC(id *a1)
{
  id v1 = *a1;
  return ConfirmationSnippetModel.denyDirectInvocation.setter();
}

uint64_t ConfirmationSnippetModel.denyDirectInvocation.setter()
{
  return sub_2519C98A0();
}

uint64_t (*ConfirmationSnippetModel.denyDirectInvocation.modify())()
{
  id v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_7_3((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  *(void *)(v0 + 32) = sub_2519C9880();
  return sub_2519796F0;
}

uint64_t ConfirmationSnippetModel.iconConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ConfirmationSnippetModel() + 44);

  return sub_251986204(v3, a1);
}

uint64_t sub_251986204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ConfirmationSnippetModel.iconConfiguration.setter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_10_1() + 44);

  return sub_2519862A8(v0, v2);
}

uint64_t sub_2519862A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ConfirmationSnippetModel.iconConfiguration.modify())()
{
  return nullsub_1;
}

uint64_t ConfirmationSnippetModel.isDestructive.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ConfirmationSnippetModel() + 48));
}

uint64_t ConfirmationSnippetModel.isDestructive.setter(char a1)
{
  uint64_t result = type metadata accessor for ConfirmationSnippetModel();
  *(unsigned char *)(v1 + *(int *)(result + 48)) = a1;
  return result;
}

uint64_t (*ConfirmationSnippetModel.isDestructive.modify())()
{
  return nullsub_1;
}

uint64_t sub_2519863E4()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

uint64_t sub_251986434()
{
  return 9;
}

unint64_t sub_25198643C(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7261646E6F636573;
      break;
    case 2:
      unint64_t result = 0x4C6D7269666E6F63;
      break;
    case 3:
      unint64_t result = 0x6562614C796E6564;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    case 6:
      unint64_t result = 0x7572747365447369;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      unint64_t result = 0x547972616D697270;
      break;
  }
  return result;
}

unint64_t sub_25198658C(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7261646E6F636573;
      break;
    case 2:
      unint64_t result = 0x4C6D7269666E6F63;
      break;
    case 3:
      unint64_t result = 0x6562614C796E6564;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0xD000000000000014;
      break;
    case 6:
      unint64_t result = 0x7572747365447369;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      unint64_t result = 0x547972616D697270;
      break;
  }
  return result;
}

uint64_t sub_2519866DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2519BE550(*a1, *a2);
}

uint64_t sub_2519866E8()
{
  return sub_2519BE960();
}

uint64_t sub_2519866F0(uint64_t a1)
{
  return sub_2519BEB18(a1, *v1);
}

uint64_t sub_2519866F8(uint64_t a1)
{
  return sub_2519BF038(a1, *v1);
}

uint64_t sub_251986700@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519863E4();
  *a1 = result;
  return result;
}

unint64_t sub_251986730@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25198643C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25198675C()
{
  return sub_25198658C(*v0);
}

uint64_t sub_251986764@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251986430();
  *a1 = result;
  return result;
}

uint64_t sub_25198678C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_251986434();
  *a1 = result;
  return result;
}

uint64_t sub_2519867B4(uint64_t a1)
{
  unint64_t v2 = sub_251987114();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519867F0(uint64_t a1)
{
  unint64_t v2 = sub_251987114();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::String __swiftcall ConfirmationSnippetModel.responseViewId()()
{
  unint64_t v0 = (void *)0x80000002519CE1D0;
  uint64_t v1 = 0xD00000000000001BLL;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t ConfirmationSnippetModel.init(primaryText:secondaryText:confirmationText:confirmLabel:denyLabel:confirmDirectInvocation:denyDirectInvocation:iconConfiguration:isDestructive:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v18 = type metadata accessor for ConfirmationSnippetModel();
  a7[4] = 0;
  a7[5] = 0;
  uint64_t v19 = (uint64_t)a7 + *(int *)(v18 + 44);
  uint64_t v20 = type metadata accessor for IconConfiguration();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  sub_2519C9900();
  sub_2519C9900();
  sub_2519869B8();
  id v21 = a10;
  sub_2519C9870();
  sub_2519C9870();

  *((unsigned char *)a7 + *(int *)(v18 + 48)) = a13;
  sub_2519862A8(a12, v19);
  uint64_t result = swift_bridgeObjectRelease();
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

unint64_t sub_2519869B8()
{
  unint64_t result = qword_269B93FD0;
  if (!qword_269B93FD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B93FD0);
  }
  return result;
}

uint64_t ConfirmationSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_5();
  uint64_t v56 = v5 - v4;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v62 = v6;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v50 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FD8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v57 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_5();
  uint64_t v15 = type metadata accessor for ConfirmationSnippetModel();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_5();
  uint64_t v18 = v17 - v16;
  *(_OWORD *)(v18 + 16) = 0u;
  *(_OWORD *)(v18 + 32) = 0u;
  uint64_t v61 = v19;
  uint64_t v20 = (uint64_t *)v18;
  uint64_t v21 = v18 + *(int *)(v19 + 44);
  uint64_t v22 = type metadata accessor for IconConfiguration();
  uint64_t v60 = v21;
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  uint64_t v23 = a1[3];
  uint64_t v58 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_251987114();
  uint64_t v24 = v59;
  sub_2519CA550();
  if (v24)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
    int v34 = 0;
    int v25 = 0;
    int v26 = 0;
    goto LABEL_4;
  }
  uint64_t v59 = v12;
  uint64_t v53 = v22;
  uint64_t v54 = v10;
  LOBYTE(v63) = 0;
  *uint64_t v20 = sub_2519CA460();
  v20[1] = v31;
  void v20[2] = OUTLINED_FUNCTION_5_2(1);
  v20[3] = v32;
  v20[4] = OUTLINED_FUNCTION_5_2(8);
  v20[5] = v33;
  int v34 = 1;
  uint64_t v63 = OUTLINED_FUNCTION_5_2(2);
  uint64_t v64 = v35;
  sub_2519C9900();
  LOBYTE(v63) = 3;
  uint64_t v63 = sub_2519CA460();
  uint64_t v64 = v36;
  uint64_t v52 = 0;
  sub_2519C9900();
  LOBYTE(v63) = 4;
  sub_251987794(&qword_269B93FE8);
  uint64_t v37 = v52;
  sub_2519CA480();
  if (v37)
  {
    uint64_t v38 = OUTLINED_FUNCTION_11_1();
    v39(v38);
    int v26 = 0;
    int v25 = 1;
LABEL_11:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
    swift_bridgeObjectRelease();
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v34)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_5_1();
      v28();
      if (!v25)
      {
LABEL_6:
        if (!v26) {
          return sub_251987160(v60);
        }
LABEL_10:
        OUTLINED_FUNCTION_16();
        v30();
        return sub_251987160(v60);
      }
    }
    else if (!v25)
    {
      goto LABEL_6;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v29();
    if (!v26) {
      return sub_251987160(v60);
    }
    goto LABEL_10;
  }
  uint64_t v52 = 0;
  unint64_t v51 = sub_2519C9890();
  uint64_t v40 = *(void *)(v62 + 8);
  uint64_t v59 = (char *)(v62 + 8);
  v50[1] = v40;
  OUTLINED_FUNCTION_16();
  v41();
  unint64_t v51 = sub_2519869B8();
  sub_2519C9870();
  LOBYTE(v63) = 5;
  uint64_t v42 = v52;
  sub_2519CA480();
  if (v42)
  {
    OUTLINED_FUNCTION_5_1();
    v43();
    int v25 = 1;
    int v26 = 1;
    goto LABEL_11;
  }
  sub_2519C9890();
  OUTLINED_FUNCTION_16();
  v44();
  sub_2519C9870();
  LOBYTE(v63) = 7;
  sub_251987EC0(&qword_269B93C28, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
  uint64_t v45 = v56;
  uint64_t v46 = v53;
  sub_2519CA480();
  __swift_storeEnumTagSinglePayload(v45, 0, 1, v46);
  sub_2519862A8(v45, v60);
  LOBYTE(v63) = 6;
  char v47 = sub_2519CA470();
  uint64_t v48 = OUTLINED_FUNCTION_12_0();
  v49(v48);
  *((unsigned char *)v20 + *(int *)(v61 + 48)) = v47 & 1;
  sub_2519871C0((uint64_t)v20, v55);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  return sub_25198952C((uint64_t)v20, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
}

unint64_t sub_251987114()
{
  unint64_t result = qword_269B93FE0;
  if (!qword_269B93FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93FE0);
  }
  return result;
}

uint64_t sub_251987160(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2519871C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ConfirmationSnippetModel.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v26 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FF0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_251987114();
  sub_2519CA560();
  LOBYTE(v31) = 0;
  uint64_t v14 = v30;
  sub_2519CA4B0();
  if (v14)
  {
    uint64_t v15 = OUTLINED_FUNCTION_15();
    return v16(v15);
  }
  else
  {
    v26[3] = v8;
    uint64_t v27 = v10;
    uint64_t v30 = v12;
    uint64_t v18 = v2[3];
    uint64_t v31 = v2[2];
    uint64_t v32 = v18;
    char v33 = 1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
    sub_251987684();
    OUTLINED_FUNCTION_3_1();
    swift_bridgeObjectRelease();
    uint64_t v19 = v2[5];
    uint64_t v31 = v2[4];
    uint64_t v32 = v19;
    char v33 = 8;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3_1();
    swift_bridgeObjectRelease();
    uint64_t v20 = type metadata accessor for ConfirmationSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    sub_2519C9920();
    OUTLINED_FUNCTION_8_3(2);
    swift_bridgeObjectRelease();
    LOBYTE(v31) = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    sub_2519876F0();
    sub_2519CA4D0();
    uint64_t v21 = v27;
    sub_2519C9920();
    OUTLINED_FUNCTION_8_3(3);
    swift_bridgeObjectRelease();
    uint64_t v27 = (char *)v20;
    uint64_t v22 = v28;
    sub_2519C9890();
    v26[2] = sub_2519869B8();
    sub_2519C9870();
    LOBYTE(v31) = 4;
    sub_251987794(&qword_269B94000);
    OUTLINED_FUNCTION_18();
    uint64_t v23 = v29 + 8;
    uint64_t v24 = *(void (**)(void))(v29 + 8);
    ((void (*)(char *, uint64_t))v24)(v21, v22);
    uint64_t v29 = v23;
    v26[1] = v2;
    sub_2519C9890();
    sub_2519C9870();
    LOBYTE(v31) = 5;
    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_16();
    v24();
    LOBYTE(v31) = 6;
    sub_2519CA4C0();
    OUTLINED_FUNCTION_5_1();
    return v25();
  }
}

unint64_t sub_251987684()
{
  unint64_t result = qword_269B93F50;
  if (!qword_269B93F50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93F50);
  }
  return result;
}

unint64_t sub_2519876F0()
{
  unint64_t result = qword_269B93FF8;
  if (!qword_269B93FF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93FC8);
    sub_251987EC0(&qword_269B93C40, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B93FF8);
  }
  return result;
}

uint64_t sub_251987794(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93FC0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t ConfirmationSnippetModel.description.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v2 - v1;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  OUTLINED_FUNCTION_6_2();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_0();
  sub_2519CA3B0();
  sub_2519CA210();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  sub_2519CA400();
  OUTLINED_FUNCTION_6_2();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 24))
  {
    OUTLINED_FUNCTION_13_0();
    sub_2519CA3B0();
    swift_bridgeObjectRelease();
    sub_2519CA210();
    OUTLINED_FUNCTION_6_2();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_13_0();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  sub_251986204(v0 + *(int *)(v4 + 44), v3);
  uint64_t v5 = type metadata accessor for IconConfiguration();
  __swift_getEnumTagSinglePayload(v3, 1, v5);
  sub_251987160(v3);
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  return 0xD000000000000019;
}

uint64_t ConfirmationSnippetModel.stringId.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  MEMORY[0x270FA5388](v1 - 8);
  OUTLINED_FUNCTION_5();
  uint64_t v4 = v3 - v2;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "#primaryText: ");
  HIBYTE(v8[1]) = -18;
  swift_bridgeObjectRetain();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_15();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for ConfirmationSnippetModel();
  sub_251986204(v0 + *(int *)(v5 + 44), v4);
  uint64_t v6 = type metadata accessor for IconConfiguration();
  __swift_getEnumTagSinglePayload(v4, 1, v6);
  sub_251987160(v4);
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  return v8[0];
}

uint64_t sub_251987E30()
{
  return sub_251987EC0(&qword_269B94008, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
}

uint64_t sub_251987E78()
{
  return sub_251987EC0(&qword_269B94010, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
}

uint64_t sub_251987EC0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_251987F08@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ConfirmationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_251987F20(void *a1)
{
  return ConfirmationSnippetModel.encode(to:)(a1);
}

uint64_t sub_251987F38()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = ConfirmationSnippetModel.confirmLabel.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_251987F64()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = ConfirmationSnippetModel.denyLabel.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_251987F90()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = ConfirmationSnippetModel.confirmDirectInvocation.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_251987FBC()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = ConfirmationSnippetModel.denyDirectInvocation.getter();
  *uint64_t v0 = result;
  return result;
}

char *initializeBufferWithCopyOfBuffer for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v6;
    uint64_t v7 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = v7;
    uint64_t v8 = *((void *)a2 + 5);
    uint64_t v9 = a3[7];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    *((void *)a1 + 4) = *((void *)a2 + 4);
    *((void *)a1 + 5) = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v10, v11, v13);
    uint64_t v58 = v14;
    v14(&a1[a3[8]], &a2[a3[8]], v13);
    uint64_t v15 = a3[9];
    uint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
    v19(v16, v17, v18);
    v19(&a1[a3[10]], &a2[a3[10]], v18);
    uint64_t v59 = a3;
    uint64_t v20 = a3[11];
    uint64_t v21 = &a1[v20];
    uint64_t v22 = &a2[v20];
    uint64_t v23 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, (uint64_t)v23))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v54 = v19;
      uint64_t v55 = v18;
      v58(v21, v22, v13);
      uint64_t v26 = v23[5];
      uint64_t v27 = v21;
      uint64_t v28 = &v21[v26];
      uint64_t v29 = &v22[v26];
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v57 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
      v57(v28, v29, v30);
      uint64_t v31 = v23[6];
      uint64_t v32 = &v27[v31];
      char v33 = &v22[v31];
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
      uint64_t v35 = v23[7];
      uint64_t v56 = &v27[v35];
      uint64_t v36 = &v22[v35];
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
      v38(v56, v36, v37);
      v38(&v27[v23[8]], &v22[v23[8]], v37);
      uint64_t v39 = v23[9];
      uint64_t v40 = &v27[v39];
      uint64_t v41 = &v22[v39];
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
      v57(&v27[v23[10]], &v22[v23[10]], v30);
      uint64_t v43 = v23[11];
      uint64_t v44 = &v27[v43];
      uint64_t v45 = &v22[v43];
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
      v57(&v27[v23[12]], &v22[v23[12]], v30);
      v57(&v27[v23[13]], &v22[v23[13]], v30);
      uint64_t v47 = v23[14];
      uint64_t v48 = (uint64_t)v27;
      uint64_t v49 = &v27[v47];
      uint64_t v50 = &v22[v47];
      uint64_t v51 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v50, 1, v51))
      {
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        v54(v49, v50, v55);
        __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v51);
      }
      __swift_storeEnumTagSinglePayload(v48, 0, 1, (uint64_t)v23);
    }
    a1[v59[12]] = a2[v59[12]];
  }
  return a1;
}

uint64_t destroy for ConfirmationSnippetModel(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[8], v5);
  uint64_t v7 = a1 + a2[9];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v26)((void *)(v8 - 8), v7, v8);
  v26(a1 + a2[10], v8);
  uint64_t v9 = a1 + a2[11];
  uint64_t v10 = (int *)type metadata accessor for IconConfiguration();
  uint64_t result = __swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10);
  if (!result)
  {
    v6(v9, v5);
    uint64_t v12 = v9 + v10[5];
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
    v14(v12, v13);
    uint64_t v15 = v9 + v10[6];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
    uint64_t v17 = v9 + v10[7];
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
    v19(v17, v18);
    v19(v9 + v10[8], v18);
    uint64_t v20 = v9 + v10[9];
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
    v14(v9 + v10[10], v13);
    uint64_t v22 = v9 + v10[11];
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
    v14(v9 + v10[12], v13);
    v14(v9 + v10[13], v13);
    uint64_t v24 = v9 + v10[14];
    uint64_t v25 = type metadata accessor for DirectInvocationConfig();
    uint64_t result = __swift_getEnumTagSinglePayload(v24, 1, v25);
    if (!result)
    {
      return ((uint64_t (*)(uint64_t, uint64_t))v26)(v24, v8);
    }
  }
  return result;
}

char *initializeWithCopy for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  uint64_t v8 = *((void *)a2 + 5);
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  uint64_t v52 = v13;
  v13(&a1[a3[8]], &a2[a3[8]], v12);
  uint64_t v14 = a3[9];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
  v18(v15, v16, v17);
  v18(&a1[a3[10]], &a2[a3[10]], v17);
  uint64_t v19 = a3[11];
  __dst = &a1[v19];
  uint64_t v20 = &a2[v19];
  uint64_t v21 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, (uint64_t)v21))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(__dst, v20, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    uint64_t v49 = v17;
    v52(__dst, v20, v12);
    uint64_t v23 = v21[5];
    uint64_t v24 = &__dst[v23];
    uint64_t v25 = &v20[v23];
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16);
    v51(v24, v25, v50);
    uint64_t v26 = v21[6];
    uint64_t v27 = &__dst[v26];
    uint64_t v28 = &v20[v26];
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    uint64_t v30 = v21[7];
    uint64_t v31 = &__dst[v30];
    uint64_t v32 = &v20[v30];
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16);
    v34(v31, v32, v33);
    v34(&__dst[v21[8]], &v20[v21[8]], v33);
    uint64_t v35 = v21[9];
    uint64_t v36 = &__dst[v35];
    uint64_t v37 = &v20[v35];
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
    v51(&__dst[v21[10]], &v20[v21[10]], v50);
    uint64_t v39 = v21[11];
    uint64_t v40 = &__dst[v39];
    uint64_t v41 = &v20[v39];
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    v51(&__dst[v21[12]], &v20[v21[12]], v50);
    v51(&__dst[v21[13]], &v20[v21[13]], v50);
    uint64_t v43 = v21[14];
    uint64_t v44 = &__dst[v43];
    uint64_t v45 = &v20[v43];
    uint64_t v46 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46))
    {
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      v18(v44, v45, v49);
      __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v46);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, (uint64_t)v21);
  }
  a1[a3[12]] = a2[a3[12]];
  return a1;
}

char *assignWithCopy for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[7];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v86 = *(void *)(v9 - 8);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v86 + 24);
  v10(v7, v8, v9);
  uint64_t v87 = (void (*)(uint64_t, uint64_t, uint64_t))v10;
  v10(&a1[a3[8]], &a2[a3[8]], v9);
  uint64_t v11 = a3[9];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v84 = *(void *)(v14 - 8);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v84 + 24);
  v15(v12, v13, v14);
  uint64_t v85 = v14;
  uint64_t v16 = v14;
  uint64_t v17 = a2;
  v15(&a1[a3[10]], &a2[a3[10]], v16);
  uint64_t v89 = a1;
  char v90 = a3;
  uint64_t v18 = a3[11];
  uint64_t v19 = (uint64_t)&a1[v18];
  uint64_t v91 = v17;
  uint64_t v20 = (uint64_t)&v17[v18];
  uint64_t v21 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(a3) = __swift_getEnumTagSinglePayload(v19, 1, (uint64_t)v21);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v20, 1, (uint64_t)v21);
  if (a3)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v19, v20, v9);
      uint64_t v23 = v21[5];
      uint64_t v24 = v19 + v23;
      uint64_t v25 = v19;
      uint64_t v26 = v20 + v23;
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16);
      v28(v24, v26, v27);
      uint64_t v29 = v21[6];
      uint64_t v30 = v25 + v29;
      uint64_t v31 = v20 + v29;
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
      uint64_t v33 = v21[7];
      uint64_t v34 = v25 + v33;
      uint64_t v35 = v20 + v33;
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 16);
      v37(v34, v35, v36);
      v37(v25 + v21[8], v20 + v21[8], v36);
      uint64_t v38 = v21[9];
      uint64_t v39 = v25 + v38;
      uint64_t v40 = v20 + v38;
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
      v28(v25 + v21[10], v20 + v21[10], v27);
      uint64_t v42 = v21[11];
      uint64_t v43 = v25 + v42;
      uint64_t v44 = v20 + v42;
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
      v28(v25 + v21[12], v20 + v21[12], v27);
      v28(v25 + v21[13], v20 + v21[13], v27);
      uint64_t v46 = v21[14];
      uint64_t v47 = (void *)(v25 + v46);
      uint64_t v48 = (const void *)(v20 + v46);
      uint64_t v49 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v48, 1, v49))
      {
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v47, v48, *(void *)(*(void *)(v50 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v84 + 16))(v47, v48, v85);
        __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v49);
      }
      uint64_t v80 = v25;
      uint64_t v81 = (uint64_t)v21;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  uint64_t v83 = (void (*)(uint64_t, uint64_t, uint64_t))v15;
  if (EnumTagSinglePayload)
  {
    sub_25198952C(v19, (void (*)(void))type metadata accessor for IconConfiguration);
LABEL_7:
    size_t v51 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
    uint64_t v52 = (void *)v19;
    uint64_t v53 = (const void *)v20;
    goto LABEL_8;
  }
  v87(v19, v20, v9);
  uint64_t v54 = v21[5];
  uint64_t v55 = v19 + v54;
  uint64_t v56 = v20 + v54;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 24);
  v58(v55, v56, v57);
  uint64_t v59 = v21[6];
  uint64_t v60 = v19 + v59;
  uint64_t v61 = v20 + v59;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 24))(v60, v61, v62);
  uint64_t v63 = v21[7];
  uint64_t v64 = v19 + v63;
  uint64_t v88 = v20 + v63;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v65 - 8) + 24);
  v66(v64, v88, v65);
  v66(v19 + v21[8], v20 + v21[8], v65);
  uint64_t v67 = v21[9];
  uint64_t v68 = v19 + v67;
  uint64_t v69 = v20 + v67;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 24))(v68, v69, v70);
  v58(v19 + v21[10], v20 + v21[10], v57);
  uint64_t v71 = v21[11];
  uint64_t v72 = v19 + v71;
  uint64_t v73 = v20 + v71;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 24))(v72, v73, v74);
  v58(v19 + v21[12], v20 + v21[12], v57);
  v58(v19 + v21[13], v20 + v21[13], v57);
  uint64_t v75 = v21[14];
  uint64_t v76 = v19 + v75;
  uint64_t v77 = v20 + v75;
  uint64_t v78 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v72) = __swift_getEnumTagSinglePayload(v76, 1, v78);
  int v79 = __swift_getEnumTagSinglePayload(v77, 1, v78);
  if (v72)
  {
    if (!v79)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v76, v77, v85);
      uint64_t v80 = v76;
      uint64_t v81 = v78;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v80, 0, 1, v81);
      goto LABEL_15;
    }
  }
  else
  {
    if (!v79)
    {
      v83(v76, v77, v85);
      goto LABEL_15;
    }
    sub_25198952C(v76, (void (*)(void))type metadata accessor for DirectInvocationConfig);
  }
  size_t v51 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94030) - 8) + 64);
  uint64_t v52 = (void *)v76;
  uint64_t v53 = (const void *)v77;
LABEL_8:
  memcpy(v52, v53, v51);
LABEL_15:
  uint64_t result = v89;
  v89[v90[12]] = v91[v90[12]];
  return result;
}

uint64_t sub_25198952C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

char *initializeWithTake for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v7 = a3[7];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[8]], &a2[a3[8]], v10);
  uint64_t v12 = a3[9];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v16(&a1[a3[10]], &a2[a3[10]], v15);
  uint64_t v52 = a2;
  uint64_t v53 = a3;
  uint64_t v17 = a3[11];
  size_t v51 = a1;
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, (uint64_t)v20))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v49 = v15;
    v11(v18, v19, v10);
    uint64_t v22 = v20[5];
    uint64_t v23 = &v18[v22];
    uint64_t v24 = &v19[v22];
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32);
    v26(v23, v24, v25);
    uint64_t v27 = v20[6];
    uint64_t v28 = &v18[v27];
    uint64_t v29 = &v19[v27];
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
    uint64_t v31 = v20[7];
    uint64_t v50 = &v18[v31];
    uint64_t v32 = &v19[v31];
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32);
    v34(v50, v32, v33);
    v34(&v18[v20[8]], &v19[v20[8]], v33);
    uint64_t v35 = v20[9];
    uint64_t v36 = &v18[v35];
    uint64_t v37 = &v19[v35];
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
    v26(&v18[v20[10]], &v19[v20[10]], v25);
    uint64_t v39 = v20[11];
    uint64_t v40 = &v18[v39];
    uint64_t v41 = &v19[v39];
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
    v26(&v18[v20[12]], &v19[v20[12]], v25);
    v26(&v18[v20[13]], &v19[v20[13]], v25);
    uint64_t v43 = v20[14];
    uint64_t v44 = &v18[v43];
    uint64_t v45 = &v19[v43];
    uint64_t v46 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46))
    {
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      v16(v44, v45, v49);
      __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v46);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, (uint64_t)v20);
  }
  uint64_t result = v51;
  v51[v53[12]] = v52[v53[12]];
  return result;
}

char *assignWithTake for ConfirmationSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v87 = *(void *)(v12 - 8);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v87 + 40);
  v13(v10, v11, v12);
  uint64_t v89 = (void (*)(uint64_t, uint64_t, uint64_t))v13;
  v13(&a1[a3[8]], &a2[a3[8]], v12);
  uint64_t v14 = a3[9];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v85 = *(void *)(v17 - 8);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v85 + 40);
  v18(v15, v16, v17);
  uint64_t v86 = v17;
  v18(&a1[a3[10]], &a2[a3[10]], v17);
  uint64_t v92 = a2;
  uint64_t v93 = a3;
  uint64_t v19 = a3[11];
  uint64_t v91 = a1;
  uint64_t v20 = (uint64_t)&a1[v19];
  uint64_t v21 = (uint64_t)&a2[v19];
  uint64_t v22 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(a3) = __swift_getEnumTagSinglePayload(v20, 1, (uint64_t)v22);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v21, 1, (uint64_t)v22);
  if (a3)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 32))(v20, v21, v12);
      uint64_t v24 = v22[5];
      uint64_t v25 = v20 + v24;
      uint64_t v26 = v21 + v24;
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32);
      v28(v25, v26, v27);
      uint64_t v29 = v22[6];
      uint64_t v30 = v20 + v29;
      uint64_t v31 = v21 + v29;
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
      uint64_t v33 = v22[7];
      uint64_t v34 = v20 + v33;
      uint64_t v35 = v21 + v33;
      uint64_t v36 = v20;
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 32);
      v38(v34, v35, v37);
      v38(v36 + v22[8], v21 + v22[8], v37);
      uint64_t v39 = v22[9];
      uint64_t v40 = v36 + v39;
      uint64_t v41 = v21 + v39;
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
      v28(v36 + v22[10], v21 + v22[10], v27);
      uint64_t v43 = v22[11];
      uint64_t v44 = v36 + v43;
      uint64_t v45 = v21 + v43;
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      uint64_t v47 = v36;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
      v28(v36 + v22[12], v21 + v22[12], v27);
      v28(v36 + v22[13], v21 + v22[13], v27);
      uint64_t v48 = v22[14];
      uint64_t v49 = (void *)(v36 + v48);
      uint64_t v50 = (const void *)(v21 + v48);
      uint64_t v51 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v50, 1, v51))
      {
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v85 + 32))(v49, v50, v86);
        __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v51);
      }
      uint64_t v82 = v47;
      uint64_t v83 = (uint64_t)v22;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  uint64_t v88 = (void (*)(uint64_t, uint64_t, uint64_t))v18;
  if (EnumTagSinglePayload)
  {
    sub_25198952C(v20, (void (*)(void))type metadata accessor for IconConfiguration);
LABEL_7:
    size_t v53 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
    uint64_t v54 = (void *)v20;
    uint64_t v55 = (const void *)v21;
    goto LABEL_8;
  }
  v89(v20, v21, v12);
  uint64_t v56 = v22[5];
  uint64_t v57 = v20 + v56;
  uint64_t v58 = v21 + v56;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 40);
  v60(v57, v58, v59);
  uint64_t v61 = v22[6];
  uint64_t v62 = v20 + v61;
  uint64_t v63 = v21 + v61;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 40))(v62, v63, v64);
  uint64_t v65 = v22[7];
  uint64_t v66 = v20 + v65;
  uint64_t v90 = v21 + v65;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 40);
  v68(v66, v90, v67);
  v68(v20 + v22[8], v21 + v22[8], v67);
  uint64_t v69 = v22[9];
  uint64_t v70 = v20 + v69;
  uint64_t v71 = v21 + v69;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 40))(v70, v71, v72);
  v60(v20 + v22[10], v21 + v22[10], v59);
  uint64_t v73 = v22[11];
  uint64_t v74 = v20 + v73;
  uint64_t v75 = v21 + v73;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 40))(v74, v75, v76);
  v60(v20 + v22[12], v21 + v22[12], v59);
  v60(v20 + v22[13], v21 + v22[13], v59);
  uint64_t v77 = v22[14];
  uint64_t v78 = v20 + v77;
  uint64_t v79 = v21 + v77;
  uint64_t v80 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v74) = __swift_getEnumTagSinglePayload(v78, 1, v80);
  int v81 = __swift_getEnumTagSinglePayload(v79, 1, v80);
  if (v74)
  {
    if (!v81)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 32))(v78, v79, v86);
      uint64_t v82 = v78;
      uint64_t v83 = v80;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v82, 0, 1, v83);
      goto LABEL_15;
    }
  }
  else
  {
    if (!v81)
    {
      v88(v78, v79, v86);
      goto LABEL_15;
    }
    sub_25198952C(v78, (void (*)(void))type metadata accessor for DirectInvocationConfig);
  }
  size_t v53 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94030) - 8) + 64);
  uint64_t v54 = (void *)v78;
  uint64_t v55 = (const void *)v79;
LABEL_8:
  memcpy(v54, v55, v53);
LABEL_15:
  uint64_t result = v91;
  v91[v93[12]] = v92[v93[12]];
  return result;
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25198A204);
}

uint64_t sub_25198A204(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a3[7];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v13 + 84) == a2)
      {
        uint64_t v10 = v12;
        uint64_t v11 = a3[9];
      }
      else
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
        uint64_t v11 = a3[11];
      }
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25198A2F4);
}

uint64_t sub_25198A2F4(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a4[7];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v13 + 84) == a3)
      {
        uint64_t v10 = v12;
        uint64_t v11 = a4[9];
      }
      else
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
        uint64_t v11 = a4[11];
      }
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_25198A3CC()
{
  sub_251985798();
  if (v0 <= 0x3F)
  {
    sub_25198A550(319, (unint64_t *)&qword_269B94048, (uint64_t (*)(uint64_t))sub_2519869B8, MEMORY[0x263F76C68]);
    if (v1 <= 0x3F)
    {
      sub_25198A550(319, &qword_269B94050, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, MEMORY[0x263F8D8F0]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_25198A550(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ConfirmationSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25198A708);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippetModel.CodingKeys()
{
  return &type metadata for ConfirmationSnippetModel.CodingKeys;
}

unint64_t sub_25198A744()
{
  unint64_t result = qword_269B94058;
  if (!qword_269B94058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94058);
  }
  return result;
}

unint64_t sub_25198A794()
{
  unint64_t result = qword_269B94060;
  if (!qword_269B94060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94060);
  }
  return result;
}

unint64_t sub_25198A7E4()
{
  unint64_t result = qword_269B94068;
  if (!qword_269B94068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94068);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_2519CA4D0();
}

uint64_t OUTLINED_FUNCTION_5_2@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_2519CA460();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_2519CA210();
}

uint64_t OUTLINED_FUNCTION_7_3(uint64_t a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for ConfirmationSnippetModel();
}

uint64_t OUTLINED_FUNCTION_8_3@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_2519CA4B0();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return type metadata accessor for ConfirmationSnippetModel();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0;
}

void OUTLINED_FUNCTION_13_0()
{
  *(void *)(v1 - 112) = 0;
  *(void *)(v1 - 104) = v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_2519CA4D0();
}

uint64_t sub_25198A97C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v4 - 8);
  unsigned int v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2519CA170();
  sub_25198E78C(&qword_269B93CB0, MEMORY[0x263F77980]);
  *(void *)(a2 + 24) = sub_2519C9AC0();
  *(void *)(a2 + 32) = v7;
  unint64_t v8 = (int *)type metadata accessor for CompletionSnippetView();
  uint64_t v9 = (uint64_t *)(a2 + v8[6]);
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = a2 + v8[7];
  LOBYTE(v20) = 0;
  sub_2519C9F90();
  uint64_t v11 = v22;
  *(unsigned char *)uint64_t v10 = v21;
  *(void *)(v10 + 8) = v11;
  *(void *)a2 = sub_25198E6B8;
  *(void *)(a2 + 8) = a1;
  *(unsigned char *)(a2 + 16) = 0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2519C9A10();
  swift_release();
  swift_release();
  BOOL v12 = (sub_2519B1EC0() & 1) == 0 || (sub_2519B1EAC() & 1) == 0;
  LOBYTE(v21) = v12;
  char v13 = sub_2519B1ED4();
  char v14 = sub_2519B1F6C();
  type metadata accessor for CompletionStyleSettings();
  swift_allocObject();
  uint64_t v15 = sub_2519A9A24((uint64_t)v6, (char *)&v21, v13 & 1, (v14 & 1) == 0);
  uint64_t v16 = (void *)(a2 + v8[8]);
  uint64_t v20 = v15;
  sub_2519C9F90();
  uint64_t result = swift_release();
  uint64_t v18 = v22;
  *uint64_t v16 = v21;
  v16[1] = v18;
  return result;
}

uint64_t CompletionSnippetView.snippetDetailsModel.getter()
{
  return sub_25198ABF4(MEMORY[0x263F18660]);
}

uint64_t CompletionSnippetView.$snippetDetailsModel.getter()
{
  return sub_25198ABF4(MEMORY[0x263F18668]);
}

uint64_t sub_25198ABF4(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = *((unsigned __int8 *)v1 + 16);
  uint64_t v5 = type metadata accessor for SnippetDetailsModel();
  uint64_t v6 = sub_25198E78C(&qword_269B94070, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);

  return a1(v2, v3, v4, v5, v6);
}

uint64_t CompletionSnippetView.body.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v80 = a1;
  v67[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94078);
  OUTLINED_FUNCTION_4_0();
  v67[2] = v2;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  v67[1] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94080);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_1();
  uint64_t v73 = v6;
  uint64_t v7 = type metadata accessor for CompletionSnippetView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v72 = v7 - 8;
  uint64_t v81 = v8;
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v69 = (char *)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v68 = (char *)v67 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v85 = (char *)v67 - v13;
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94088);
  OUTLINED_FUNCTION_4_0();
  uint64_t v75 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1();
  uint64_t v83 = v16;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94090);
  OUTLINED_FUNCTION_4_0();
  uint64_t v77 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1();
  uint64_t v84 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94098);
  OUTLINED_FUNCTION_4_0();
  uint64_t v78 = v21;
  uint64_t v79 = v20;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_1();
  uint64_t v86 = v22;
  type metadata accessor for SnippetDetailsModel();
  sub_25198E78C(&qword_269B94070, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_2519C9A80();
  swift_getKeyPath();
  sub_2519C9AA0();
  swift_release();
  swift_release();
  uint64_t v93 = v87;
  uint64_t v94 = v88;
  uint64_t v95 = v89;
  uint64_t v96 = v90;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A0);
  MEMORY[0x2533A7E70](&v97);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v71 = v97;
  uint64_t v70 = v98;
  sub_2519C9A80();
  swift_getKeyPath();
  sub_2519C9AA0();
  swift_release();
  swift_release();
  uint64_t v93 = v87;
  uint64_t v94 = v88;
  uint64_t v95 = v89;
  uint64_t v96 = v90;
  MEMORY[0x2533A7E70](&v97, v23);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v24 = v97;
  uint64_t v25 = v98;
  sub_25198E724();
  uint64_t v26 = *(unsigned __int8 *)(v81 + 80);
  uint64_t v81 = v26 | 7;
  uint64_t v27 = (void *)swift_allocObject();
  uint64_t v28 = v70;
  v27[2] = v71;
  v27[3] = v28;
  v27[4] = v24;
  v27[5] = v25;
  sub_25198E6D0();
  sub_2519CA130();
  sub_25198E78C(&qword_269B940B0, MEMORY[0x263F778A0]);
  sub_2519CA030();
  uint64_t v29 = *(int *)(v72 + 40);
  uint64_t v82 = v1;
  uint64_t v30 = (uint64_t *)(v1 + v29);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  uint64_t v87 = v32;
  uint64_t v88 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940B8);
  sub_2519C9FA0();
  uint64_t v33 = v73;
  sub_2519A9C18(v73);
  swift_release();
  uint64_t v34 = sub_2519CA050();
  __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v34);
  sub_25198E724();
  uint64_t v35 = (v26 + 16) & ~v26;
  uint64_t v36 = (uint64_t *)(v35 + v9);
  swift_allocObject();
  sub_25198E6D0();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940C0);
  uint64_t v38 = sub_2519827F8(&qword_269B940C8, &qword_269B94088);
  unint64_t v66 = sub_25198DA64();
  uint64_t v39 = v74;
  sub_2519C9D80();
  swift_release();
  sub_251982980((uint64_t)v33, &qword_269B94080);
  OUTLINED_FUNCTION_5_1();
  v40();
  uint64_t v41 = type metadata accessor for CompletionSnippetModel();
  sub_25198E724();
  uint64_t v73 = v36;
  swift_allocObject();
  uint64_t v75 = v35;
  sub_25198E6D0();
  uint64_t v87 = v39;
  uint64_t v88 = v37;
  uint64_t v89 = v39;
  uint64_t v90 = v38;
  unint64_t v91 = v66;
  uint64_t v92 = v38;
  OUTLINED_FUNCTION_8_4();
  sub_25198E78C(&qword_269B940E8, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
  sub_25198E78C(&qword_269B940F0, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
  sub_25198E78C(&qword_269B940F8, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
  uint64_t v83 = v41;
  sub_2519C9D90();
  uint64_t v42 = v82;
  swift_release();
  OUTLINED_FUNCTION_5_1();
  v43();
  uint64_t v44 = *(void **)(v42 + 24);
  if (v44)
  {
    id v45 = v44;
    sub_2519CA140();

    if (sub_2519CA340())
    {
      OUTLINED_FUNCTION_7_4();
      OUTLINED_FUNCTION_8_4();
      uint64_t v93 = OUTLINED_FUNCTION_10_2();
      LOBYTE(v94) = 0;
LABEL_10:
      swift_retain();
      sub_2519C9C30();
      uint64_t v93 = v87;
      LOWORD(v94) = v88;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B94100);
      sub_25198DB7C();
      sub_2519C9C30();
      swift_release();
LABEL_11:
      uint64_t v57 = v87;
      char v58 = v88;
      char v59 = BYTE1(v88);
      OUTLINED_FUNCTION_5_1();
      uint64_t result = v60();
      uint64_t v62 = v80;
      uint64_t *v80 = v57;
      *((unsigned char *)v62 + 8) = v58;
      *((unsigned char *)v62 + 9) = v59;
      return result;
    }
    id v46 = v45;
    sub_2519CA140();

    char v47 = sub_2519CA350();
    uint64_t v48 = (uint64_t)v68;
    sub_25198E724();
    if (v47)
    {
      sub_25198EB5C(v48, (void (*)(void))type metadata accessor for CompletionSnippetView);
      uint64_t v49 = (uint64_t)v69;
      sub_25198E724();
LABEL_8:
      sub_25198EB5C(v49, (void (*)(void))type metadata accessor for CompletionSnippetView);
LABEL_9:
      sub_25198E724();
      swift_allocObject();
      sub_25198E6D0();
      OUTLINED_FUNCTION_7_4();
      uint64_t v53 = OUTLINED_FUNCTION_8_4();
      uint64_t v54 = v79;
      sub_2519C9D60();
      swift_release();
      uint64_t v87 = v54;
      uint64_t v88 = v53;
      OUTLINED_FUNCTION_8_4();
      uint64_t v55 = sub_2519C9D30();
      OUTLINED_FUNCTION_5_1();
      v56();
      uint64_t v93 = v55;
      LOBYTE(v94) = 1;
      goto LABEL_10;
    }
    uint64_t v50 = *(void **)(v48 + 24);
    uint64_t v49 = (uint64_t)v69;
    if (v50)
    {
      id v51 = v50;
      sub_2519CA140();

      char v52 = sub_2519CA310();
      sub_25198EB5C(v48, (void (*)(void))type metadata accessor for CompletionSnippetView);
      sub_25198E724();
      if (v52) {
        goto LABEL_8;
      }
      uint64_t v63 = *(void **)(v49 + 24);
      if (v63)
      {
        id v64 = v63;
        sub_2519CA140();

        char v65 = sub_2519CA330();
        sub_25198EB5C(v49, (void (*)(void))type metadata accessor for CompletionSnippetView);
        if ((v65 & 1) == 0)
        {
          OUTLINED_FUNCTION_7_4();
          OUTLINED_FUNCTION_8_4();
          uint64_t v93 = OUTLINED_FUNCTION_10_2();
          LOWORD(v94) = 256;
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B94100);
          sub_25198DB7C();
          sub_2519C9C30();
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
  }
  sub_2519CA170();
  sub_25198E78C(&qword_269B93CB0, MEMORY[0x263F77980]);
  uint64_t result = sub_2519C9AB0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CompletionSnippetView()
{
  uint64_t result = qword_269B94118;
  if (!qword_269B94118) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25198B95C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519B1E18();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25198B988@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519B1E18();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25198B9B4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25198BA68(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_2519B1BFC);
}

uint64_t sub_25198B9CC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25198BA68(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_2519B1BFC);
}

uint64_t sub_25198B9F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519B1E2C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25198BA24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519B1E2C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25198BA50(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25198BA68(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_2519B1C10);
}

uint64_t sub_25198BA68(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t sub_25198BAB0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25198BA68(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))sub_2519B1C10);
}

uint64_t sub_25198BADC()
{
  return sub_2519CA120();
}

uint64_t sub_25198BB90()
{
  type metadata accessor for CompletionSnippetView();
  OUTLINED_FUNCTION_4_3();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v5 = *(void *)(v4 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25198BCC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2519C9A50();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v6();
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v5, v2 | 7);
}

uint64_t sub_25198BCC8()
{
  return swift_release();
}

uint64_t sub_25198BCD0()
{
  uint64_t v0 = type metadata accessor for CompletionSnippetView();
  OUTLINED_FUNCTION_4_1(v0);

  return sub_25198BADC();
}

uint64_t sub_25198BD28()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CompletionSnippetView();
  uint64_t v3 = v2 - 8;
  uint64_t v91 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v92 = v4;
  uint64_t v93 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94158);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v90 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2519C98F0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v73 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_2519CA000();
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v74 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93DA0);
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v75 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94160);
  MEMORY[0x270FA5388](v72);
  uint64_t v71 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94168);
  MEMORY[0x270FA5388](v80);
  uint64_t v85 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94170);
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94178);
  uint64_t v82 = *(void *)(v15 - 8);
  uint64_t v83 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v70 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94180);
  MEMORY[0x270FA5388](v87);
  uint64_t v84 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94188);
  uint64_t v88 = *(void *)(v18 - 8);
  uint64_t v89 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v86 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94190);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (uint64_t *)(v1 + *(int *)(v3 + 40));
  unint64_t v25 = v23[1];
  uint64_t v97 = *v23;
  uint64_t v24 = v97;
  unint64_t v98 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940B8);
  sub_2519C9FA0();
  unint64_t v95 = sub_2519AA154();
  unint64_t v27 = v26;
  swift_release();
  uint64_t v97 = v24;
  unint64_t v98 = v25;
  sub_2519C9FA0();
  uint64_t v94 = v1;
  uint64_t v28 = *(void **)(v1 + 24);
  if (!v28)
  {
    sub_2519CA170();
    sub_25198E78C(&qword_269B93CB0, MEMORY[0x263F77980]);
    sub_2519C9AB0();
    __break(1u);
    JUMPOUT(0x25198C8B0);
  }
  uint64_t v29 = (uint64_t)&v22[*(int *)(v20 + 48)];
  id v30 = v28;
  uint64_t v31 = sub_2519CA140();

  sub_2519A9DEC((uint64_t)v22, v29, v31);
  swift_release();
  uint64_t v97 = v24;
  unint64_t v98 = v25;
  sub_2519C9FA0();
  sub_2519AA4C4((char *)&v97);
  swift_release();
  uint64_t v67 = v97;
  sub_25198E76C(v27);
  uint64_t v32 = sub_2519ACC58(v27);
  unint64_t v81 = v27;
  sub_25198E77C(v27);
  uint64_t v97 = v32;
  LOWORD(v98) = 256;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94198);
  uint64_t v34 = sub_2519827F8(&qword_269B941A0, &qword_269B94198);
  uint64_t v96 = v22;
  uint64_t v35 = v34;
  sub_2519C9D50();
  swift_release();
  uint64_t v97 = v33;
  unint64_t v98 = v35;
  swift_getOpaqueTypeConformance2();
  uint64_t v36 = v70;
  uint64_t v37 = v69;
  sub_2519C9D40();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v14, v37);
  uint64_t v97 = v24;
  unint64_t v98 = v25;
  sub_2519C9FA0();
  sub_2519AA6B0();
  swift_release();
  sub_2519C98E0();
  swift_bridgeObjectRelease();
  uint64_t v38 = v74;
  sub_2519CA010();
  sub_25198E78C(&qword_269B93D70, MEMORY[0x263F77558]);
  uint64_t v39 = v75;
  uint64_t v40 = v77;
  sub_2519C9D40();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v38, v40);
  unint64_t v41 = v95;
  sub_25198E76C(v95);
  uint64_t v42 = sub_2519ACC58(v41);
  sub_25198E77C(v41);
  uint64_t v43 = v78;
  uint64_t v44 = (uint64_t)v71;
  uint64_t v45 = v79;
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v71, v39, v79);
  *(void *)(v44 + *(int *)(v72 + 36)) = v42;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v39, v45);
  uint64_t v46 = (uint64_t)v90;
  switch(v67)
  {
    case 1:
      char v47 = v36;
      sub_2519C9BF0();
      break;
    case 2:
      char v47 = v36;
      sub_2519C9BE0();
      break;
    case 3:
      char v47 = v36;
      sub_2519C9C10();
      break;
    default:
      char v47 = v36;
      sub_2519C9C00();
      break;
  }
  uint64_t v48 = sub_2519C9C20();
  __swift_storeEnumTagSinglePayload(v46, 0, 1, v48);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v50 = (uint64_t)v85;
  id v51 = (uint64_t *)&v85[*(int *)(v80 + 36)];
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B941A8);
  sub_251982930(v46, (uint64_t)v51 + *(int *)(v52 + 28), &qword_269B94158);
  *id v51 = KeyPath;
  sub_251982930(v44, v50, &qword_269B94160);
  sub_251982980(v46, &qword_269B94158);
  sub_251982980(v44, &qword_269B94160);
  uint64_t v53 = sub_2519C9FF0();
  uint64_t v55 = v54;
  uint64_t v56 = v87;
  uint64_t v57 = (uint64_t)v84;
  uint64_t v58 = (uint64_t)&v84[*(int *)(v87 + 36)];
  sub_251982930(v50, v58, &qword_269B94168);
  char v59 = (uint64_t *)(v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B941B0) + 36));
  *char v59 = v53;
  v59[1] = v55;
  uint64_t v61 = v82;
  uint64_t v60 = v83;
  (*(void (**)(uint64_t, char *, uint64_t))(v82 + 16))(v57, v47, v83);
  sub_251982980(v50, &qword_269B94168);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v47, v60);
  sub_25198E724();
  swift_allocObject();
  sub_25198E6D0();
  unint64_t v62 = sub_25198EA28();
  uint64_t v63 = v86;
  sub_2519C9DD0();
  swift_release();
  sub_251982980(v57, &qword_269B94180);
  uint64_t v97 = v56;
  unint64_t v98 = v62;
  swift_getOpaqueTypeConformance2();
  uint64_t v64 = v89;
  uint64_t v65 = sub_2519C9D30();
  sub_25198E77C(v95);
  sub_25198E77C(v81);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v63, v64);
  sub_251982980((uint64_t)v96, &qword_269B94190);
  return v65;
}

uint64_t sub_25198C8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_2519C9A50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v11 = (uint64_t *)(a2 + *(int *)(type metadata accessor for CompletionSnippetView() + 32));
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  v18[1] = v13;
  v18[2] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940B8);
  sub_2519C9FA0();
  sub_2519A9A8C((uint64_t)v9);
  swift_release();
  uint64_t v14 = (uint64_t *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B940C0) + 36));
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940E0);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v14 + *(int *)(v15 + 28), v9, v6);
  *uint64_t v14 = KeyPath;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(a3, a1, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_25198CA74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94088);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, a1, v4);
}

void sub_25198CAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for IconConfiguration();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v34 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v35 = (char *)&v33 - v9;
  uint64_t v10 = sub_2519C99D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v10, (uint64_t)qword_269B99480);
  uint64_t v15 = *(void (**)(char *))(v11 + 16);
  uint64_t v37 = v14;
  v15(v13);
  v39._char countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  sub_2519CA3B0();
  sub_2519CA210();
  CompletionSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  unint64_t v36 = (unint64_t)"Received tap on the snippet.";
  v16._object = (void *)0x80000002519CE290;
  v16._char countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v39, 0, v16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  type metadata accessor for SnippetDetailsModel();
  sub_25198E78C(&qword_269B94070, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_2519C9A70();
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  sub_2519B1C10();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  sub_2519C9920();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_251982980((uint64_t)v5, &qword_269B93FC8);
  }
  else
  {
    uint64_t v17 = (uint64_t)v35;
    sub_25198E6D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    sub_2519C9920();
    char countAndFlagsBits = v39._countAndFlagsBits;
    if (LOBYTE(v39._countAndFlagsBits) != 2)
    {
      uint64_t v19 = (uint64_t)v34;
      sub_25198E724();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      sub_2519C9920();
      if (LOBYTE(v39._countAndFlagsBits)) {
        char v20 = (countAndFlagsBits & 1) == 0;
      }
      else {
        char v20 = 2;
      }
      LOBYTE(v39._countAndFlagsBits) = v20;
      sub_2519C9920();
      char v21 = v38;
      sub_2519C9920();
      char v22 = v38;
      type metadata accessor for CompletionStyleSettings();
      swift_allocObject();
      uint64_t v23 = sub_2519A9A24(v19, (char *)&v39, v21, (v22 & 1) == 0);
      uint64_t v24 = type metadata accessor for CompletionSnippetView();
      unint64_t v25 = (uint64_t *)(a2 + *(int *)(v24 + 32));
      uint64_t v27 = *v25;
      unint64_t v26 = (void *)v25[1];
      v39._char countAndFlagsBits = v27;
      v39._object = v26;
      uint64_t v38 = v23;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B940B8);
      sub_2519C9FB0();
      uint64_t v28 = (char *)(a2 + *(int *)(v24 + 28));
      char v29 = *v28;
      id v30 = (void *)*((void *)v28 + 1);
      LOBYTE(v39._countAndFlagsBits) = v29;
      v39._object = v30;
      LOBYTE(v38) = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B94150);
      sub_2519C9FB0();
    }
    sub_25198EB5C(v17, (void (*)(void))type metadata accessor for IconConfiguration);
  }
  v31._char countAndFlagsBits = 0xD000000000000015;
  v31._object = (void *)0x80000002519CE380;
  v32._object = (void *)(v36 | 0x8000000000000000);
  v32._char countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v31, 0, v32);
}

uint64_t sub_25198D030(uint64_t a1)
{
  uint64_t v2 = sub_2519C99D0();
  uint64_t v29 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v28 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2519C9820();
  uint64_t v27 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_269B99480);
  v11._char countAndFlagsBits = 0xD00000000000001CLL;
  v11._object = (void *)0x80000002519CE270;
  unint64_t v26 = (unint64_t)"Received tap on the snippet.";
  v12._object = (void *)0x80000002519CE290;
  v12._char countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v11, 0, v12);
  type metadata accessor for SnippetDetailsModel();
  sub_25198E78C(&qword_269B94070, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_2519C9A70();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2519C9A10();
  swift_release();
  swift_release();
  swift_release();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1) {
    return sub_251982980((uint64_t)v6, &qword_269B93F18);
  }
  uint64_t v14 = v27;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v9, v6, v7);
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  Swift::String v16 = *(void **)(a1 + 24);
  if (v16)
  {
    uint64_t v17 = v15;
    id v18 = v16;
    sub_2519CA140();

    sub_2519CA350();
    uint64_t v19 = (void *)sub_2519CA190();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_setBundleId_, v19);

    char v20 = (void *)sub_2519C9800();
    objc_msgSend(v17, sel_setPunchOutUri_, v20);

    id v21 = v18;
    id v22 = v17;
    sub_2519CA150();

    uint64_t v24 = v28;
    uint64_t v23 = v29;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v28, v10, v2);
    strcpy((char *)&v30, "Punchout to ");
    BYTE5(v30._object) = 0;
    HIWORD(v30._object) = -5120;
    sub_25198E78C(&qword_269B94140, MEMORY[0x263F06EA8]);
    sub_2519CA4F0();
    sub_2519CA210();
    swift_bridgeObjectRelease();
    sub_2519CA210();
    v25._object = (void *)(v26 | 0x8000000000000000);
    v25._char countAndFlagsBits = 0xD000000000000075;
    Logger.debug(output:test:caller:)(v30, 0, v25);

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v9, v7);
  }
  else
  {
    sub_2519CA170();
    sub_25198E78C(&qword_269B93CB0, MEMORY[0x263F77980]);
    uint64_t result = sub_2519C9AB0();
    __break(1u);
  }
  return result;
}

void sub_25198D598(uint64_t a1)
{
  uint64_t v2 = sub_2519C99D0();
  uint64_t v34 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v33 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v2, (uint64_t)qword_269B99480);
  v8._char countAndFlagsBits = 0xD000000000000035;
  v8._object = (void *)0x80000002519CE3A0;
  unint64_t v31 = (unint64_t)"Received tap on the snippet.";
  v9._object = (void *)0x80000002519CE290;
  v9._char countAndFlagsBits = 0xD000000000000075;
  Logger.debug(output:test:caller:)(v8, 0, v9);
  uint64_t v10 = type metadata accessor for CompletionSnippetView();
  uint64_t v11 = a1 + *(int *)(v10 + 28);
  Swift::String v12 = *(void **)(v11 + 8);
  LOBYTE(v36._countAndFlagsBits) = *(unsigned char *)v11;
  v36._object = v12;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94150);
  sub_2519C9FA0();
  if ((v35 & 1) == 0)
  {
    uint64_t v13 = (uint64_t *)(a1 + *(int *)(v10 + 32));
    uint64_t v14 = *v13;
    id v15 = (void *)v13[1];
    v36._char countAndFlagsBits = *v13;
    v36._object = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B940B8);
    sub_2519C9FA0();
    char v16 = sub_2519AA760();
    swift_release();
    if ((v16 & 1) == 0)
    {
      uint64_t v17 = a1;
      v36._char countAndFlagsBits = v14;
      v36._object = v15;
      sub_2519C9FA0();
      uint64_t v18 = v35;
      uint64_t v19 = OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig;
      uint64_t v20 = type metadata accessor for IconConfiguration();
      sub_251982930(v18 + *(int *)(v20 + 56) + v19, (uint64_t)v6, &qword_269B94030);
      swift_release();
      uint64_t v21 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v21) == 1)
      {
        sub_251982980((uint64_t)v6, &qword_269B94030);
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        id v22 = (void *)sub_2519C9890();
        sub_25198EB5C((uint64_t)v6, (void (*)(void))type metadata accessor for DirectInvocationConfig);
        uint64_t v24 = v33;
        uint64_t v23 = v34;
        (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v33, v7, v2);
        v36._char countAndFlagsBits = 0;
        v36._object = (void *)0xE000000000000000;
        sub_2519CA3B0();
        sub_2519CA210();
        id v25 = objc_msgSend(v22, sel_debugDescription);
        sub_2519CA1A0();

        sub_2519CA210();
        swift_bridgeObjectRelease();
        v26._object = (void *)(v31 | 0x8000000000000000);
        v26._char countAndFlagsBits = 0xD000000000000075;
        Logger.debug(output:test:caller:)(v36, 0, v26);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v2);
        uint64_t v27 = *(void **)(v11 + 8);
        LOBYTE(v36._countAndFlagsBits) = *(unsigned char *)v11;
        v36._object = v27;
        LOBYTE(v35) = 1;
        sub_2519C9FB0();
        uint64_t v28 = *(void **)(v17 + 24);
        if (v28)
        {
          id v29 = v28;
          sub_2519CA160();
        }
        else
        {
          sub_2519CA170();
          sub_25198E78C(&qword_269B93CB0, MEMORY[0x263F77980]);
          sub_2519C9AB0();
          __break(1u);
        }
      }
    }
  }
}

uint64_t sub_25198DA04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for CompletionSnippetView();
  OUTLINED_FUNCTION_4_1(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_25198C8C0(a1, v7, a2);
}

unint64_t sub_25198DA64()
{
  unint64_t result = qword_269B940D0;
  if (!qword_269B940D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B940C0);
    sub_2519827F8(&qword_269B940C8, &qword_269B94088);
    sub_2519827F8(&qword_269B940D8, &qword_269B940E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B940D0);
  }
  return result;
}

void sub_25198DB2C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for CompletionSnippetView();
  OUTLINED_FUNCTION_4_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  sub_25198CAE4(a1, v5);
}

unint64_t sub_25198DB7C()
{
  unint64_t result = qword_269B94108;
  if (!qword_269B94108)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94108);
  }
  return result;
}

uint64_t sub_25198DBEC()
{
  return sub_25198E9D4(sub_25198D030);
}

uint64_t sub_25198DC04()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for CompletionSnippetView(void *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    sub_25198DDA4();
    *uint64_t v4 = v7;
    v4[1] = v8;
    *((unsigned char *)v4 + 16) = v9;
    uint64_t v10 = (void *)a2[3];
    uint64_t v11 = a2[4];
    v4[3] = v10;
    v4[4] = v11;
    uint64_t v12 = a3[6];
    uint64_t v13 = (void *)((char *)v4 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    id v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_2519C9A50();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    uint64_t v20 = (char *)v4 + v18;
    uint64_t v21 = (char *)a2 + v18;
    *uint64_t v20 = *v21;
    *((void *)v20 + 1) = *((void *)v21 + 1);
    id v22 = (void *)((char *)v4 + v19);
    uint64_t v23 = (uint64_t *)((char *)a2 + v19);
    uint64_t v24 = v23[1];
    *id v22 = *v23;
    v22[1] = v24;
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_25198DDA4()
{
  return swift_retain();
}

uint64_t destroy for CompletionSnippetView(uint64_t a1, uint64_t a2)
{
  sub_25198BCC8();

  uint64_t v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2519C9A50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CompletionSnippetView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_25198DDA4();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  char v9 = (void *)a2[3];
  uint64_t v10 = a2[4];
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  id v14 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_2519C9A50();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = (uint64_t)a2 + v16;
  *(unsigned char *)uint64_t v18 = *(unsigned char *)v19;
  *(void *)(v18 + 8) = *(void *)(v19 + 8);
  uint64_t v20 = (void *)(a1 + v17);
  uint64_t v21 = (uint64_t *)((char *)a2 + v17);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CompletionSnippetView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_25198DDA4();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_25198BCC8();
  char v9 = *(void **)(a1 + 24);
  uint64_t v10 = (void *)a2[3];
  *(void *)(a1 + 24) = v10;
  id v11 = v10;

  *(void *)(a1 + 32) = a2[4];
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v12 = a3[6];
    uint64_t v13 = (void *)(a1 + v12);
    id v14 = (uint64_t *)((char *)a2 + v12);
    sub_251982980(a1 + v12, &qword_269B940A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_2519C9A50();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t)a2 + v16;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (uint64_t)a2 + v19;
  *(void *)(a1 + v19) = *(uint64_t *)((char *)a2 + v19);
  swift_retain();
  swift_release();
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CompletionSnippetView(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2519C9A50();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for CompletionSnippetView(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_25198BCC8();
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (a1 != a2)
  {
    uint64_t v8 = a3[6];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_251982980(a1 + v8, &qword_269B940A8);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2519C9A50();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_release();
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (void *)(a2 + v16);
  *(void *)(a1 + v16) = *v18;
  swift_release();
  *(void *)(v17 + 8) = v18[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionSnippetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25198E3F4);
}

uint64_t sub_25198E3F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94110);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 32));
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CompletionSnippetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25198E49C);
}

void sub_25198E49C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94110);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  }
}

void sub_25198E52C()
{
  sub_25198E5D8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25198E5D8()
{
  if (!qword_269B94128)
  {
    sub_2519C9A50();
    unint64_t v0 = sub_2519C9A60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B94128);
    }
  }
}

unint64_t sub_25198E634()
{
  unint64_t result = qword_269B94130;
  if (!qword_269B94130)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94138);
    sub_25198DB7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94130);
  }
  return result;
}

uint64_t sub_25198E6B8()
{
  return swift_retain();
}

uint64_t sub_25198E6D0()
{
  uint64_t v2 = OUTLINED_FUNCTION_9_2();
  v3(v2);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_25198E724()
{
  uint64_t v1 = OUTLINED_FUNCTION_9_2();
  v2(v1);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = OUTLINED_FUNCTION_9_0();
  v4(v3);
  return v0;
}

unint64_t sub_25198E76C(unint64_t result)
{
  if (result >= 4) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_25198E77C(unint64_t result)
{
  if (result >= 4) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25198E78C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25198E7D4()
{
  return sub_2519C9B30();
}

uint64_t sub_25198E7F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94158);
  MEMORY[0x270FA5388](v2 - 8);
  sub_251982930(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269B94158);
  return sub_2519C9B40();
}

uint64_t objectdestroy_6Tm()
{
  type metadata accessor for CompletionSnippetView();
  OUTLINED_FUNCTION_4_3();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v5 = *(void *)(v4 + 64);
  sub_25198BCC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2519C9A50();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v6();
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v5, v2 | 7);
}

uint64_t sub_25198E9BC()
{
  return sub_25198E9D4((uint64_t (*)(uint64_t))sub_25198D598);
}

uint64_t sub_25198E9D4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for CompletionSnippetView();
  OUTLINED_FUNCTION_4_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

unint64_t sub_25198EA28()
{
  unint64_t result = qword_269B941B8;
  if (!qword_269B941B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94180);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94170);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94198);
    sub_2519827F8(&qword_269B941A0, &qword_269B94198);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_2519827F8(&qword_269B941C0, &qword_269B941B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B941B8);
  }
  return result;
}

uint64_t sub_25198EB5C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

void OUTLINED_FUNCTION_7_4()
{
  uint64_t v6 = *(void *)(v5 - 216);
  *(void *)(v5 - 184) = v3;
  *(void *)(v5 - 176) = v6;
  *(void *)(v5 - 168) = v1;
  *(void *)(v5 - 160) = v2;
  *(void *)(v5 - 152) = v4;
  *(void *)(v5 - 144) = v0;
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_2519C9D30();
}

uint64_t CompletionSnippetViewTVOS.snippetDetailsModel.getter()
{
  return sub_25198EC60(MEMORY[0x263F18660]);
}

uint64_t CompletionSnippetViewTVOS.$snippetDetailsModel.getter()
{
  return sub_25198EC60(MEMORY[0x263F18668]);
}

uint64_t sub_25198EC60(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = *((unsigned __int8 *)v1 + 16);
  uint64_t v5 = type metadata accessor for SnippetDetailsModel();
  uint64_t v6 = sub_2519922D8(&qword_269B94070, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);

  return a1(v2, v3, v4, v5, v6);
}

uint64_t CompletionSnippetViewTVOS.body.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v2 = type metadata accessor for CompletionSnippetViewTVOS();
  uint64_t v3 = OUTLINED_FUNCTION_2_0(v2);
  uint64_t v58 = v4;
  uint64_t v66 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v57 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B941C8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v61 = v7;
  uint64_t v62 = v8;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_1();
  uint64_t v59 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B941D0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v63 = v10;
  uint64_t v64 = v11;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v60 = v12;
  uint64_t v13 = type metadata accessor for IconConfiguration();
  uint64_t v14 = OUTLINED_FUNCTION_2_0(v13);
  uint64_t v56 = v15;
  uint64_t v55 = *(void *)(v16 + 64);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v54 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v45 - v19;
  type metadata accessor for SnippetDetailsModel();
  sub_2519922D8(&qword_269B94070, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_2519C9A80();
  swift_getKeyPath();
  sub_2519C9AA0();
  swift_release();
  swift_release();
  uint64_t v73 = v67;
  uint64_t v74 = v68;
  uint64_t v75 = v69;
  uint64_t v76 = v70;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A0);
  MEMORY[0x2533A7E70](&v77);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v52 = v77;
  OUTLINED_FUNCTION_10_3(v78);
  sub_2519C9A80();
  swift_getKeyPath();
  sub_2519C9AA0();
  swift_release();
  swift_release();
  uint64_t v73 = v67;
  uint64_t v74 = v68;
  uint64_t v75 = v69;
  uint64_t v76 = v70;
  MEMORY[0x2533A7E70](&v77, v21);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v50 = v77;
  OUTLINED_FUNCTION_10_3(v78);
  sub_2519C9A70();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v53 = v20;
  sub_2519C9A10();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v48 = v1;
  OUTLINED_FUNCTION_7_5();
  int v22 = sub_2519B1EC0();
  swift_release();
  OUTLINED_FUNCTION_7_5();
  int v23 = sub_2519B1EAC();
  swift_release();
  OUTLINED_FUNCTION_7_5();
  int v46 = sub_2519B1ED4();
  swift_release();
  int v45 = v22 & v23;
  sub_251990C38();
  char v47 = type metadata accessor for CompletionSnippetViewTVOS;
  sub_251990C38();
  uint64_t v24 = ((*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80)) + v55;
  unint64_t v25 = ((v24 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = *(unsigned __int8 *)(v58 + 80);
  uint64_t v56 = v26 + 16;
  uint64_t v27 = ((v26 + 16 + v25) & ~v26) + v66;
  uint64_t v58 = v26 | 7;
  uint64_t v28 = swift_allocObject();
  unint64_t v29 = (v24 & 0xFFFFFFFFFFFFFFF8) + v28;
  sub_251992280();
  *(unsigned char *)(v28 + v24) = (v45 & 1) == 0;
  uint64_t v30 = v51;
  *(void *)(v29 + 8) = v52;
  *(void *)(v29 + 16) = v30;
  unint64_t v31 = (void *)(v28 + v25);
  uint64_t v32 = v49;
  *unint64_t v31 = v50;
  v31[1] = v32;
  sub_251992280();
  *(unsigned char *)(v28 + v27) = v46 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B941D8);
  uint64_t v33 = sub_2519CA130();
  uint64_t v34 = sub_2519922D8(&qword_269B940B0, MEMORY[0x263F778A0]);
  uint64_t v67 = v33;
  uint64_t v68 = v34;
  swift_getOpaqueTypeConformance2();
  sub_2519CA030();
  uint64_t v35 = type metadata accessor for CompletionSnippetModel();
  sub_251990C38();
  swift_allocObject();
  sub_251992280();
  uint64_t v36 = sub_2519827F8(&qword_269B941E0, &qword_269B941C8);
  uint64_t v37 = sub_2519922D8(&qword_269B940E8, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
  uint64_t v38 = sub_2519922D8(&qword_269B940F0, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
  uint64_t v44 = sub_2519922D8(&qword_269B940F8, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
  uint64_t v39 = v61;
  sub_2519C9D90();
  swift_release();
  OUTLINED_FUNCTION_5_1();
  v40();
  uint64_t v67 = v39;
  uint64_t v68 = v35;
  uint64_t v69 = v36;
  uint64_t v70 = v37;
  uint64_t v71 = v38;
  uint64_t v72 = v44;
  swift_getOpaqueTypeConformance2();
  uint64_t v41 = sub_2519C9D30();
  OUTLINED_FUNCTION_5_1();
  v42();
  uint64_t result = sub_251992320((uint64_t)v53, (void (*)(void))type metadata accessor for IconConfiguration);
  *uint64_t v65 = v41;
  return result;
}

uint64_t type metadata accessor for CompletionSnippetViewTVOS()
{
  uint64_t result = qword_269B941E8;
  if (!qword_269B941E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25198F55C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  int v88 = a8;
  uint64_t v83 = a7;
  uint64_t v79 = a6;
  uint64_t v78 = a5;
  uint64_t v95 = a4;
  uint64_t v94 = a3;
  LODWORD(v93) = a2;
  uint64_t v91 = a9;
  uint64_t v10 = type metadata accessor for IconConfiguration();
  uint64_t v84 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v85 = v11;
  uint64_t v86 = (char *)v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CompletionSnippetViewTVOS();
  uint64_t v80 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v81 = v13;
  uint64_t v82 = (char *)v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_2519CA130();
  uint64_t v89 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  uint64_t v87 = (char *)v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93E38);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v72 = (uint64_t)v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_2519C9860();
  uint64_t v17 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v19 = (char *)v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B941F8);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  int v23 = (char *)v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94200);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  unint64_t v25 = (char *)v70 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94208);
  MEMORY[0x270FA5388](v74);
  uint64_t v73 = (char *)v70 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  v70[5] = v108;
  v70[4] = v109;
  v70[3] = v10;
  uint64_t v27 = *(int *)(v10 + 20);
  uint64_t v92 = a1;
  uint64_t v28 = a1 + v27;
  v70[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  v70[2] = v28;
  sub_2519C9920();
  swift_bridgeObjectRelease();
  uint64_t v108 = sub_2519C9EC0();
  LOWORD(v109) = 256;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94210);
  uint64_t v30 = sub_2519827F8(&qword_269B94218, &qword_269B94210);
  sub_2519C9D50();
  swift_release();
  uint64_t v31 = v71;
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x263F76568], v71);
  uint64_t v108 = v29;
  uint64_t v109 = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v75 = v25;
  sub_2519C9D40();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v31);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  uint64_t v71 = sub_2519C9F70();
  uint64_t v32 = sub_2519C9CB0();
  uint64_t v33 = v72;
  __swift_storeEnumTagSinglePayload(v72, 1, 1, v32);
  uint64_t v34 = sub_2519C9CC0();
  sub_251992234(v33, &qword_269B93E38);
  uint64_t KeyPath = swift_getKeyPath();
  if (v93)
  {
    uint64_t v108 = sub_2519C9EA0();
    uint64_t v109 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94240);
    sub_2519827F8((unint64_t *)&qword_269B94248, &qword_269B94240);
  }
  else
  {
    sub_2519C9920();
    uint64_t v36 = v108;
    uint64_t v37 = v109;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    sub_2519C9920();
    uint64_t v38 = static ColorUtils.getColor(colorString:colorDict:)(v36, v37, v108);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v108 = v38;
  }
  uint64_t v39 = sub_2519C9A90();
  uint64_t v40 = sub_2519C9FF0();
  uint64_t v42 = v41;
  uint64_t v43 = v76;
  uint64_t v44 = (uint64_t)v73;
  int v45 = v75;
  uint64_t v46 = v77;
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v73, v75, v77);
  char v47 = (uint64_t *)(v44 + *(int *)(v74 + 36));
  *char v47 = v71;
  v47[1] = KeyPath;
  v47[2] = v34;
  v47[3] = v39;
  v47[4] = v40;
  v47[5] = v42;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v46);
  sub_251991C08();
  uint64_t v93 = sub_2519C9D30();
  sub_251992234(v44, &qword_269B94208);
  uint64_t v108 = v94;
  uint64_t v109 = v95;
  sub_251991D3C();
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_2519C9D20();
  uint64_t v95 = v49;
  uint64_t v51 = v50;
  LODWORD(v94) = v52 & 1;
  uint64_t v108 = v78;
  uint64_t v109 = v79;
  swift_bridgeObjectRetain();
  uint64_t v53 = sub_2519C9D20();
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v58 = MEMORY[0x263F77348];
  int v60 = v59 & 1;
  uint64_t v110 = MEMORY[0x263F1A830];
  uint64_t v111 = MEMORY[0x263F77348];
  uint64_t v61 = swift_allocObject();
  uint64_t v108 = v61;
  uint64_t v76 = v48;
  uint64_t v62 = v95;
  *(void *)(v61 + 16) = v48;
  *(void *)(v61 + 24) = v62;
  char v63 = v94;
  *(unsigned char *)(v61 + 32) = v94;
  *(void *)(v61 + 40) = v51;
  uint64_t v77 = v51;
  uint64_t v106 = MEMORY[0x263F1A830];
  uint64_t v107 = v58;
  uint64_t v64 = swift_allocObject();
  uint64_t v104 = 0;
  uint64_t v105 = v64;
  *(void *)(v64 + 16) = v53;
  *(void *)(v64 + 24) = v55;
  LODWORD(v79) = v60;
  *(unsigned char *)(v64 + 32) = v60;
  *(void *)(v64 + 40) = v57;
  long long v102 = 0u;
  long long v103 = 0u;
  uint64_t v101 = 0;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v98 = MEMORY[0x263F774B0];
  uint64_t v97 = MEMORY[0x263F1B720];
  uint64_t v96 = v93;
  sub_251991DDC(v48, v62, v63);
  swift_bridgeObjectRetain();
  sub_251991DDC(v53, v55, v60);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v65 = v87;
  sub_2519CA120();
  sub_251990C38();
  sub_251990C38();
  uint64_t v66 = ((*(unsigned __int8 *)(v80 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80)) + v81;
  uint64_t v67 = swift_allocObject();
  sub_251992280();
  *(unsigned char *)(v67 + v66) = v88 & 1;
  sub_251992280();
  sub_2519922D8(&qword_269B940B0, MEMORY[0x263F778A0]);
  uint64_t v68 = v90;
  sub_2519C9D60();
  swift_release();
  swift_release();
  sub_251991DCC(v53, v55, v79);
  swift_bridgeObjectRelease();
  sub_251991DCC(v76, v95, v94);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v65, v68);
}

uint64_t sub_2519900E8(uint64_t a1, char a2, char *a3)
{
  uint64_t v34 = a3;
  uint64_t v5 = sub_2519C99D0();
  uint64_t v32 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v35 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DirectInvocationConfig();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v5, (uint64_t)qword_269B99480);
  v14._char countAndFlagsBits = 0xD000000000000035;
  v14._object = (void *)0x80000002519CE3A0;
  v15._object = (void *)0x80000002519CE420;
  v15._char countAndFlagsBits = 0xD000000000000079;
  Logger.debug(output:test:caller:)(v14, 0, v15);
  uint64_t v16 = *(int *)(type metadata accessor for CompletionSnippetViewTVOS() + 28);
  uint64_t v33 = a1;
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void **)(v17 + 8);
  LOBYTE(v36._countAndFlagsBits) = *(unsigned char *)v17;
  v36._object = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94150);
  uint64_t result = sub_2519C9FA0();
  if ((v37 & 1) == 0 && (a2 & 1) == 0)
  {
    uint64_t v20 = type metadata accessor for IconConfiguration();
    sub_2519921CC((uint64_t)&v34[*(int *)(v20 + 56)], (uint64_t)v9);
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
    {
      return sub_251992234((uint64_t)v9, &qword_269B94030);
    }
    else
    {
      sub_251992280();
      uint64_t v21 = v32;
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v35, v13, v5);
      v36._char countAndFlagsBits = 0;
      v36._object = (void *)0xE000000000000000;
      sub_2519CA3B0();
      swift_bridgeObjectRelease();
      v36._char countAndFlagsBits = 0xD000000000000029;
      v36._object = (void *)0x80000002519CE4A0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      uint64_t v34 = v12;
      uint64_t v22 = (void *)sub_2519C9890();
      id v23 = objc_msgSend(v22, sel_debugDescription);

      sub_2519CA1A0();
      sub_2519CA210();
      swift_bridgeObjectRelease();
      v24._object = (void *)0x80000002519CE420;
      v24._char countAndFlagsBits = 0xD000000000000079;
      unint64_t v25 = v35;
      Logger.debug(output:test:caller:)(v36, 0, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v5);
      uint64_t v26 = *(void **)(v17 + 8);
      LOBYTE(v36._countAndFlagsBits) = *(unsigned char *)v17;
      v36._object = v26;
      char v37 = 1;
      sub_2519C9FB0();
      uint64_t v27 = *(void **)(v33 + 24);
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = (uint64_t)v34;
        uint64_t v30 = (void *)sub_2519C9890();
        sub_2519CA160();

        return sub_251992320(v29, (void (*)(void))type metadata accessor for DirectInvocationConfig);
      }
      else
      {
        sub_2519CA170();
        sub_2519922D8(&qword_269B93CB0, MEMORY[0x263F77980]);
        uint64_t result = sub_2519C9AB0();
        __break(1u);
      }
    }
  }
  return result;
}

void sub_251990560(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v34 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for IconConfiguration();
  uint64_t v6 = MEMORY[0x270FA5388](v33);
  uint64_t v29 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)v27 - v8;
  uint64_t v9 = sub_2519C99D0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v9, (uint64_t)qword_269B99480);
  Swift::String v14 = *(void (**)(char *))(v10 + 16);
  uint64_t v35 = v13;
  v14(v12);
  v38._char countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_2519CA3B0();
  sub_2519CA210();
  CompletionSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  unint64_t v32 = (unint64_t)"on for the toggle. ";
  v15._object = (void *)0x80000002519CE420;
  v15._char countAndFlagsBits = 0xD000000000000079;
  Logger.debug(output:test:caller:)(v38, 0, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v16 = *a2;
  Swift::String v36 = a2;
  int v17 = *((unsigned __int8 *)a2 + 16);
  type metadata accessor for SnippetDetailsModel();
  sub_2519922D8(&qword_269B94070, (void (*)(uint64_t))type metadata accessor for SnippetDetailsModel);
  sub_2519C9A70();
  uint64_t v18 = type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  sub_2519B1CB0();
  swift_release();
  sub_2519C9A70();
  sub_2519C9920();
  sub_2519B1CC4();
  swift_release();
  sub_2519C9A70();
  uint64_t v31 = a1 + *(int *)(v18 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  sub_2519B1C9C();
  swift_release();
  sub_2519C9A70();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  sub_2519B1C10();
  swift_release();
  v27[1] = v16;
  int v28 = v17;
  sub_2519C9A70();
  sub_2519C9920();
  sub_2519B1C9C();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  uint64_t v19 = (uint64_t)v34;
  sub_2519C9920();
  if (__swift_getEnumTagSinglePayload(v19, 1, v33) == 1)
  {
    sub_251992234(v19, &qword_269B93FC8);
  }
  else
  {
    uint64_t v20 = (uint64_t)v30;
    sub_251992280();
    sub_2519C9A70();
    uint64_t v21 = (uint64_t)v29;
    sub_251990C38();
    sub_2519B1B54(v21);
    swift_release();
    sub_251992320(v20, (void (*)(void))type metadata accessor for IconConfiguration);
  }
  uint64_t v22 = (char *)v36 + *(int *)(type metadata accessor for CompletionSnippetViewTVOS() + 28);
  char v23 = *v22;
  Swift::String v24 = (void *)*((void *)v22 + 1);
  LOBYTE(v38._countAndFlagsBits) = v23;
  v38._object = v24;
  char v37 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94150);
  sub_2519C9FB0();
  v25._char countAndFlagsBits = 0xD000000000000015;
  v25._object = (void *)0x80000002519CE380;
  v26._object = (void *)(v32 | 0x8000000000000000);
  v26._char countAndFlagsBits = 0xD000000000000079;
  Logger.debug(output:test:caller:)(v25, 0, v26);
}

uint64_t sub_251990B54()
{
  return sub_2519B1E04();
}

uint64_t sub_251990B78()
{
  return sub_2519B1E04();
}

uint64_t sub_251990B9C()
{
  OUTLINED_FUNCTION_11_2();
  uint64_t v0 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251990C38();
  return sub_2519B1B54((uint64_t)v2);
}

uint64_t sub_251990C38()
{
  uint64_t v2 = OUTLINED_FUNCTION_11_2();
  v3(v2);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v0, v1);
  return v0;
}

uint64_t sub_251990C90()
{
  uint64_t v1 = (int *)(type metadata accessor for IconConfiguration() - 8);
  uint64_t v29 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v2 = (v29 + 16) & ~v29;
  unint64_t v3 = (((v2 + *(void *)(*(void *)v1 + 64)) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_3_2();
  uint64_t v28 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v30 = (v3 + v28 + 16) & ~v28;
  uint64_t v27 = *(void *)(v5 + 64);
  uint64_t v6 = v0 + v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v7();
  uint64_t v8 = v6 + v1[7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v11(v8, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v12();
  uint64_t v13 = v6 + v1[9];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  OUTLINED_FUNCTION_0();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v16(v13, v14);
  v16(v6 + v1[10], v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v17();
  uint64_t v18 = OUTLINED_FUNCTION_9_3(v1[12]);
  ((void (*)(uint64_t))v11)(v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v19();
  uint64_t v20 = OUTLINED_FUNCTION_9_3(v1[14]);
  ((void (*)(uint64_t))v11)(v20);
  uint64_t v21 = OUTLINED_FUNCTION_9_3(v1[15]);
  ((void (*)(uint64_t))v11)(v21);
  uint64_t v22 = v6 + v1[16];
  uint64_t v23 = type metadata accessor for DirectInvocationConfig();
  if (!__swift_getEnumTagSinglePayload(v22, 1, v23))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(uint64_t))(v24 + 8))(v22);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25198BCC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2519C9A50();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v25();
  }
  else
  {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, v27 + v30 + 1, v29 | v28 | 7);
}

uint64_t sub_251991048@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_2_0(v3);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v7 = v5 + *(void *)(v6 + 64);
  uint64_t v8 = (v7 & 0xFFFFFFFFFFFFFFF8) + v1;
  unint64_t v9 = ((v7 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_2_0(v10);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  unint64_t v15 = (v9 + *(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  int v16 = *(unsigned __int8 *)(v1 + v7);
  uint64_t v17 = *(void *)(v8 + 8);
  uint64_t v18 = *(void *)(v8 + 16);
  uint64_t v19 = *(void *)(v1 + v9);
  uint64_t v20 = *(void *)(v1 + v9 + 8);
  int v21 = *(unsigned __int8 *)(v1 + v15 + *(void *)(v14 + 64));

  return sub_25198F55C(v1 + v5, v16, v17, v18, v19, v20, v1 + v15, v21, a1);
}

uint64_t sub_251991124()
{
  type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_3_2();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v5 = *(void *)(v4 + 64);
  sub_25198BCC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2519C9A50();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v6();
  }
  else
  {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v5, v2 | 7);
}

void sub_251991234(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_4_1(v3);
  uint64_t v5 = (uint64_t *)(v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));

  sub_251990560(a1, v5);
}

uint64_t sub_251991284()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for CompletionSnippetViewTVOS(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    sub_25198DDA4();
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = v9;
    uint64_t v10 = (void *)a2[3];
    uint64_t v11 = a2[4];
    *(void *)(a1 + 24) = v10;
    *(void *)(a1 + 32) = v11;
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    id v15 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_2519C9A50();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = *(int *)(a3 + 28);
    uint64_t v19 = a1 + v18;
    uint64_t v20 = (uint64_t)a2 + v18;
    *(unsigned char *)uint64_t v19 = *(unsigned char *)v20;
    *(void *)(v19 + 8) = *(void *)(v20 + 8);
  }
  swift_retain();
  return a1;
}

uint64_t destroy for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2)
{
  sub_25198BCC8();

  uint64_t v4 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_2519C9A50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t initializeWithCopy for CompletionSnippetViewTVOS(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_25198DDA4();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  char v9 = (void *)a2[3];
  uint64_t v10 = a2[4];
  *(void *)(a1 + 24) = v9;
  *(void *)(a1 + 32) = v10;
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)((char *)a2 + v11);
  id v14 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_2519C9A50();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = *(int *)(a3 + 28);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t)a2 + v16;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CompletionSnippetViewTVOS(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_25198DDA4();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_25198BCC8();
  char v9 = *(void **)(a1 + 24);
  uint64_t v10 = (void *)a2[3];
  *(void *)(a1 + 24) = v10;
  id v11 = v10;

  *(void *)(a1 + 32) = a2[4];
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (void *)(a1 + v12);
    id v14 = (uint64_t *)((char *)a2 + v12);
    sub_251992234(a1 + v12, &qword_269B940A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_2519C9A50();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v16 = *(int *)(a3 + 28);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t)a2 + v16;
  *(unsigned char *)uint64_t v17 = *(unsigned char *)v18;
  *(void *)(v17 + 8) = *(void *)(v18 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_2519C9A50();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 28)) = *(_OWORD *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t assignWithTake for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_25198BCC8();
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_251992234(a1 + v8, &qword_269B940A8);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_2519C9A50();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  *(unsigned char *)uint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519919A4);
}

uint64_t sub_2519919A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94110);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for CompletionSnippetViewTVOS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_251991A50);
}

uint64_t sub_251991A50(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94110);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_251991AD4()
{
  sub_25198E5D8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_251991B74()
{
  return MEMORY[0x263F1B718];
}

uint64_t sub_251991B80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519C9B50();
  *a1 = result;
  return result;
}

uint64_t sub_251991BAC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519C9B50();
  *a1 = result;
  return result;
}

uint64_t sub_251991BD8()
{
  return sub_2519C9B60();
}

unint64_t sub_251991C08()
{
  unint64_t result = qword_269B94220;
  if (!qword_269B94220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94208);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B941F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94210);
    sub_2519827F8(&qword_269B94218, &qword_269B94210);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_2519827F8(&qword_269B94228, &qword_269B94230);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94220);
  }
  return result;
}

unint64_t sub_251991D3C()
{
  unint64_t result = qword_269B94238;
  if (!qword_269B94238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94238);
  }
  return result;
}

uint64_t sub_251991D88()
{
  sub_251991DCC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_251991DCC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_251991DDC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_251991DEC()
{
  type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_3_2();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v5 = *(void *)(v4 + 64);
  char v6 = (int *)type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_3_2();
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + v3 + 1) & ~v8;
  uint64_t v11 = *(void *)(v10 + 64);
  sub_25198BCC8();

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  uint64_t v33 = v2;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2519C9A50();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v12();
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v13 = v0 + v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v14();
  uint64_t v15 = v0 + v9 + v6[5];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v18(v15, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v19();
  uint64_t v20 = v0 + v9 + v6[7];
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v32 = v0;
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8);
  v22(v20, v21);
  v22(v13 + v6[8], v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v23();
  uint64_t v24 = OUTLINED_FUNCTION_8_5(v6[10]);
  ((void (*)(uint64_t))v18)(v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v25();
  uint64_t v26 = OUTLINED_FUNCTION_8_5(v6[12]);
  ((void (*)(uint64_t))v18)(v26);
  uint64_t v27 = OUTLINED_FUNCTION_8_5(v6[13]);
  ((void (*)(uint64_t))v18)(v27);
  uint64_t v28 = v13 + v6[14];
  uint64_t v29 = type metadata accessor for DirectInvocationConfig();
  if (!__swift_getEnumTagSinglePayload(v28, 1, v29))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    OUTLINED_FUNCTION_4_2();
    (*(void (**)(uint64_t))(v30 + 8))(v28);
  }

  return MEMORY[0x270FA0238](v32, v9 + v11, v33 | v8 | 7);
}

uint64_t sub_25199213C()
{
  uint64_t v1 = type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_2_0(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v5 = v3 + *(void *)(v4 + 64);
  uint64_t v6 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_4_1(v6);
  char v8 = *(unsigned char *)(v0 + v5);
  uint64_t v9 = (char *)(v0 + ((v5 + *(unsigned __int8 *)(v7 + 80) + 1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)));

  return sub_2519900E8(v0 + v3, v8, v9);
}

uint64_t sub_2519921CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_251992234(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

uint64_t sub_251992280()
{
  uint64_t v2 = OUTLINED_FUNCTION_11_2();
  v3(v2);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_2519922D8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_251992320(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return sub_2519C9A70();
}

uint64_t OUTLINED_FUNCTION_8_5@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_9_3@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_10_3@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return *(void *)v2;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return 0;
}

uint64_t ConfirmationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = sub_2519C99B0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v14 = v13 - v12;
  uint64_t v22 = type metadata accessor for ConfirmationView();
  uint64_t v15 = (uint64_t *)(a2 + *(int *)(v22 + 20));
  sub_2519CA170();
  sub_2519934DC(&qword_269B93CB0, MEMORY[0x263F77980]);
  *uint64_t v15 = sub_2519C9AC0();
  v15[1] = v16;
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v9, (uint64_t)qword_269B99480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v14, v17, v9);
  sub_2519CA3B0();
  sub_2519CA210();
  ConfirmationSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v18._char countAndFlagsBits = 0;
  v19._char countAndFlagsBits = 0xD000000000000069;
  v19._object = (void *)0x80000002519CE510;
  v18._object = (void *)0xE000000000000000;
  Logger.debug(output:test:caller:)(v18, 0, v19);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v9);
  sub_251993318(a1, a2, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  id v20 = (id)qword_269B99498;
  sub_2519C99A0();
  sub_2519CA300();
  sub_2519C9990();
  sub_251994CD4(a1, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a2 + *(int *)(v22 + 24), v8, v23);
}

uint64_t type metadata accessor for ConfirmationView()
{
  uint64_t result = qword_269B94278;
  if (!qword_269B94278) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ConfirmationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for ConfirmationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94250);
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5();
  uint64_t v13 = v12 - v11;
  sub_251993318(v2, (uint64_t)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ConfirmationView);
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = swift_allocObject();
  sub_25199337C((uint64_t)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94258);
  sub_251993430();
  sub_2519CA030();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a1, v13, v7);
  uint64_t v17 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94270) + 36));
  *uint64_t v17 = KeyPath;
  v17[1] = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
}

uint64_t sub_25199295C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = sub_2519CA070();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_251992B7C();
  uint64_t v12 = MEMORY[0x263F1B720];
  uint64_t v13 = MEMORY[0x263F774B0];
  v19[8] = MEMORY[0x263F1B720];
  v19[9] = MEMORY[0x263F774B0];
  v19[5] = v11;
  uint64_t v14 = sub_251992DB8();
  v19[3] = v12;
  v19[4] = v13;
  v19[0] = v14;
  sub_2519CA060();
  sub_251993318(a1, (uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ConfirmationView);
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = swift_allocObject();
  sub_25199337C((uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2, v10, v7);
  uint64_t v17 = (uint64_t (**)())(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94258) + 36));
  *uint64_t v17 = sub_251995E00;
  v17[1] = (uint64_t (*)())v16;
  v17[2] = 0;
  v17[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_251992B7C()
{
  uint64_t v1 = type metadata accessor for ConfirmationView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B942A8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_251993318(v0, (uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ConfirmationView);
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v9 = swift_allocObject();
  sub_25199337C((uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  sub_251991D3C();
  sub_2519C9FC0();
  sub_2519827F8(&qword_269B942B0, &qword_269B942A8);
  uint64_t v10 = sub_2519C9D30();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_251992DB8()
{
  uint64_t v1 = type metadata accessor for ConfirmationView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B942A8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_251993318(v0, (uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ConfirmationView);
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v9 = swift_allocObject();
  sub_25199337C((uint64_t)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8);
  sub_251991D3C();
  sub_2519C9FC0();
  sub_2519827F8(&qword_269B942B0, &qword_269B942A8);
  uint64_t v10 = sub_2519C9D30();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

void sub_251992FF4()
{
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  type metadata accessor for ConfirmationView();
  sub_2519CA2F0();
  sub_2519C9980();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2519C99D0();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
  v1._char countAndFlagsBits = 0xD000000000000069;
  v2._object = (void *)0x80000002519CE5A0;
  v1._object = (void *)0x80000002519CE510;
  v2._char countAndFlagsBits = 0xD000000000000029;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

void sub_251993134(uint64_t a1)
{
  Swift::String v1 = *(void **)(a1 + *(int *)(type metadata accessor for ConfirmationView() + 20));
  if (v1)
  {
    type metadata accessor for ConfirmationSnippetModel();
    id v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    id v3 = (id)sub_2519C9890();
    sub_2519CA160();
  }
  else
  {
    sub_2519CA170();
    sub_2519934DC(&qword_269B93CB0, MEMORY[0x263F77980]);
    sub_2519C9AB0();
    __break(1u);
  }
}

void sub_251993224(uint64_t a1)
{
  Swift::String v1 = *(void **)(a1 + *(int *)(type metadata accessor for ConfirmationView() + 20));
  if (v1)
  {
    type metadata accessor for ConfirmationSnippetModel();
    id v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    id v3 = (id)sub_2519C9890();
    sub_2519CA160();
  }
  else
  {
    sub_2519CA170();
    sub_2519934DC(&qword_269B93CB0, MEMORY[0x263F77980]);
    sub_2519C9AB0();
    __break(1u);
  }
}

uint64_t sub_251993318(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_25199337C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2519933E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_4_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_25199295C(v5, a1);
}

unint64_t sub_251993430()
{
  unint64_t result = qword_269B94260;
  if (!qword_269B94260)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94258);
    sub_2519934DC(&qword_269B94268, MEMORY[0x263F77660]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94260);
  }
  return result;
}

uint64_t sub_2519934DC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_251993524@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519C9AD0();
  *a1 = result;
  return result;
}

uint64_t sub_251993550()
{
  return sub_2519C9AE0();
}

uint64_t sub_251993578()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v6;
    uint64_t v7 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = v7;
    uint64_t v8 = *((void *)a2 + 5);
    *((void *)a1 + 4) = *((void *)a2 + 4);
    *((void *)a1 + 5) = v8;
    uint64_t v9 = (int *)type metadata accessor for ConfirmationSnippetModel();
    uint64_t v10 = v9[7];
    uint64_t v11 = &v4[v10];
    uint64_t v12 = &a2[v10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    uint64_t v68 = v14;
    v14(&v4[v9[8]], &a2[v9[8]], v13);
    uint64_t v15 = v9[9];
    uint64_t v16 = &v4[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16);
    v19(v16, v17, v18);
    v19(&v4[v9[10]], &a2[v9[10]], v18);
    uint64_t v69 = v9;
    uint64_t v20 = v9[11];
    uint64_t v21 = &v4[v20];
    uint64_t v22 = &a2[v20];
    uint64_t v23 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, (uint64_t)v23))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      uint64_t v64 = (void (*)(void *, char *, uint64_t))v19;
      uint64_t v65 = v18;
      v68(v21, v22, v13);
      uint64_t v26 = v23[5];
      uint64_t v27 = &v21[v26];
      uint64_t v28 = &v22[v26];
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v67 = *(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16);
      v67(v27, v28, v29);
      uint64_t v30 = v23[6];
      uint64_t v31 = &v21[v30];
      uint64_t v32 = &v22[v30];
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
      uint64_t v34 = v23[7];
      uint64_t v66 = &v21[v34];
      uint64_t v35 = &v22[v34];
      uint64_t v36 = (uint64_t)v21;
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      Swift::String v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
      v38(v66, v35, v37);
      v38((char *)(v36 + v23[8]), &v22[v23[8]], v37);
      uint64_t v39 = v23[9];
      uint64_t v40 = v36 + v39;
      uint64_t v41 = &v22[v39];
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
      v67((char *)(v36 + v23[10]), &v22[v23[10]], v29);
      uint64_t v43 = v23[11];
      uint64_t v44 = v36 + v43;
      int v45 = &v22[v43];
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
      v67((char *)(v36 + v23[12]), &v22[v23[12]], v29);
      v67((char *)(v36 + v23[13]), &v22[v23[13]], v29);
      uint64_t v47 = v23[14];
      uint64_t v48 = (void *)(v36 + v47);
      uint64_t v49 = &v22[v47];
      uint64_t v50 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50))
      {
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v48, v49, *(void *)(*(void *)(v51 - 8) + 64));
      }
      else
      {
        v64(v48, v49, v65);
        __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
      }
      __swift_storeEnumTagSinglePayload(v36, 0, 1, (uint64_t)v23);
    }
    v4[v69[12]] = a2[v69[12]];
    uint64_t v52 = *(int *)(a3 + 20);
    uint64_t v53 = *(int *)(a3 + 24);
    uint64_t v54 = &v4[v52];
    uint64_t v55 = &a2[v52];
    uint64_t v57 = *(void **)v55;
    uint64_t v56 = *((void *)v55 + 1);
    *(void *)uint64_t v54 = v57;
    *((void *)v54 + 1) = v56;
    uint64_t v58 = &v4[v53];
    char v59 = &a2[v53];
    uint64_t v60 = sub_2519C99B0();
    uint64_t v61 = *(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16);
    id v62 = v57;
    v61(v58, v59, v60);
  }
  return v4;
}

uint64_t destroy for ConfirmationView(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for ConfirmationSnippetModel();
  uint64_t v5 = a1 + v4[7];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + v4[8], v6);
  uint64_t v8 = a1 + v4[9];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(a1 + v4[10], v9);
  uint64_t v11 = a1 + v4[11];
  uint64_t v12 = (int *)type metadata accessor for IconConfiguration();
  if (!__swift_getEnumTagSinglePayload(v11, 1, (uint64_t)v12))
  {
    v7(v11, v6);
    uint64_t v13 = v11 + v12[5];
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v32 = *(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8);
    v32(v13, v31);
    uint64_t v14 = v11 + v12[6];
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
    uint64_t v16 = v11 + v12[7];
    uint64_t v17 = a2;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8);
    v19(v16, v18);
    uint64_t v20 = v18;
    a2 = v17;
    v19(v11 + v12[8], v20);
    uint64_t v21 = v11 + v12[9];
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
    v32(v11 + v12[10], v31);
    uint64_t v23 = v11 + v12[11];
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
    v32(v11 + v12[12], v31);
    v32(v11 + v12[13], v31);
    uint64_t v25 = v11 + v12[14];
    uint64_t v26 = type metadata accessor for DirectInvocationConfig();
    if (!__swift_getEnumTagSinglePayload(v25, 1, v26)) {
      v10(v25, v9);
    }
  }

  uint64_t v27 = a1 + *(int *)(a2 + 24);
  uint64_t v28 = sub_2519C99B0();
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8);

  return v29(v27, v28);
}

char *initializeWithCopy for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  uint64_t v6 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v6;
  uint64_t v7 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v7;
  uint64_t v8 = (int *)type metadata accessor for ConfirmationSnippetModel();
  uint64_t v9 = v8[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  uint64_t v66 = v13;
  v13(&a1[v8[8]], &a2[v8[8]], v12);
  uint64_t v14 = v8[9];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
  v18(v15, v16, v17);
  v18(&a1[v8[10]], &a2[v8[10]], v17);
  uint64_t v67 = v8;
  uint64_t v19 = v8[11];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, (uint64_t)v22))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    id v62 = (void (*)(void *, char *, uint64_t))v18;
    uint64_t v63 = v17;
    v66(v20, v21, v12);
    uint64_t v24 = v22[5];
    uint64_t v25 = &v20[v24];
    uint64_t v26 = (uint64_t)v20;
    uint64_t v27 = &v21[v24];
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v65 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
    v65(v25, v27, v28);
    uint64_t v29 = v22[6];
    uint64_t v30 = v26 + v29;
    uint64_t v31 = &v21[v29];
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    uint64_t v33 = v22[7];
    uint64_t v64 = v26 + v33;
    uint64_t v34 = &v21[v33];
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v36 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v35 - 8) + 16);
    v36(v64, v34, v35);
    v36(v26 + v22[8], &v21[v22[8]], v35);
    uint64_t v37 = v22[9];
    uint64_t v38 = v26 + v37;
    uint64_t v39 = &v21[v37];
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
    v65((char *)(v26 + v22[10]), &v21[v22[10]], v28);
    uint64_t v41 = v22[11];
    uint64_t v42 = v26 + v41;
    uint64_t v43 = &v21[v41];
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
    v65((char *)(v26 + v22[12]), &v21[v22[12]], v28);
    v65((char *)(v26 + v22[13]), &v21[v22[13]], v28);
    uint64_t v45 = v22[14];
    uint64_t v46 = (void *)(v26 + v45);
    uint64_t v47 = &v21[v45];
    uint64_t v48 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v48))
    {
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v46, v47, *(void *)(*(void *)(v49 - 8) + 64));
    }
    else
    {
      v62(v46, v47, v63);
      __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v48);
    }
    __swift_storeEnumTagSinglePayload(v26, 0, 1, (uint64_t)v22);
  }
  a1[v67[12]] = a2[v67[12]];
  uint64_t v50 = *(int *)(a3 + 20);
  uint64_t v51 = *(int *)(a3 + 24);
  uint64_t v52 = &a1[v50];
  uint64_t v53 = &a2[v50];
  uint64_t v55 = *(void **)v53;
  uint64_t v54 = *((void *)v53 + 1);
  *(void *)uint64_t v52 = v55;
  *((void *)v52 + 1) = v54;
  uint64_t v56 = &a1[v51];
  uint64_t v57 = &a2[v51];
  uint64_t v58 = sub_2519C99B0();
  char v59 = *(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 16);
  id v60 = v55;
  v59(v56, v57, v58);
  return a1;
}

void *assignWithCopy for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = (int *)type metadata accessor for ConfirmationSnippetModel();
  uint64_t v6 = v5[7];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v97 = *(void *)(v9 - 8);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v97 + 24);
  v10(v7, v8, v9);
  long long v99 = v10;
  v10(&a1[v5[8]], &a2[v5[8]], v9);
  uint64_t v11 = v5[9];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v95 = *(void *)(v14 - 8);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v95 + 24);
  v15(v12, v13, v14);
  uint64_t v96 = v14;
  v15(&a1[v5[10]], &a2[v5[10]], v14);
  uint64_t v101 = v5;
  long long v102 = a2;
  uint64_t v16 = v5[11];
  long long v103 = a1;
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(v5) = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v19);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19);
  if (v5)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v17, v18, v9);
      uint64_t v21 = v19[5];
      uint64_t v22 = &v17[v21];
      uint64_t v23 = &v18[v21];
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
      v25(v22, v23, v24);
      uint64_t v26 = v19[6];
      uint64_t v27 = &v17[v26];
      uint64_t v28 = &v18[v26];
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      uint64_t v30 = v19[7];
      uint64_t v31 = &v17[v30];
      uint64_t v32 = &v18[v30];
      uint64_t v33 = v17;
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
      v35(v31, v32, v34);
      v35(&v33[v19[8]], &v18[v19[8]], v34);
      uint64_t v36 = v19[9];
      uint64_t v37 = &v33[v36];
      uint64_t v38 = &v18[v36];
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
      v25(&v33[v19[10]], &v18[v19[10]], v24);
      uint64_t v40 = v19[11];
      uint64_t v41 = &v33[v40];
      uint64_t v42 = &v18[v40];
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
      v25(&v33[v19[12]], &v18[v19[12]], v24);
      v25(&v33[v19[13]], &v18[v19[13]], v24);
      uint64_t v44 = v19[14];
      uint64_t v45 = &v33[v44];
      uint64_t v46 = &v18[v44];
      uint64_t v47 = type metadata accessor for DirectInvocationConfig();
      uint64_t v49 = v102;
      uint64_t v48 = v103;
      if (__swift_getEnumTagSinglePayload((uint64_t)v46, 1, v47))
      {
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v45, v46, *(void *)(*(void *)(v50 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v45, v46, v96);
        __swift_storeEnumTagSinglePayload((uint64_t)v45, 0, 1, v47);
      }
      uint64_t v52 = a3;
      uint64_t v81 = (uint64_t)v33;
      uint64_t v82 = (uint64_t)v19;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  uint64_t v98 = v15;
  if (EnumTagSinglePayload)
  {
    sub_251994CD4((uint64_t)v17, (void (*)(void))type metadata accessor for IconConfiguration);
LABEL_7:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v17, v18, *(void *)(*(void *)(v51 - 8) + 64));
    uint64_t v48 = a1;
    uint64_t v52 = a3;
    goto LABEL_8;
  }
  v99(v17, v18, v9);
  uint64_t v54 = v19[5];
  uint64_t v55 = &v17[v54];
  uint64_t v56 = &v18[v54];
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v58 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 24);
  v58(v55, v56, v57);
  uint64_t v59 = v19[6];
  id v60 = &v17[v59];
  uint64_t v61 = &v18[v59];
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 24))(v60, v61, v62);
  uint64_t v63 = v19[7];
  long long v100 = &v17[v63];
  uint64_t v64 = &v18[v63];
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v66 = *(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 24);
  v66(v100, v64, v65);
  v66(&v17[v19[8]], &v18[v19[8]], v65);
  uint64_t v67 = v19[9];
  uint64_t v68 = &v17[v67];
  uint64_t v69 = &v18[v67];
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 24))(v68, v69, v70);
  v58(&v17[v19[10]], &v18[v19[10]], v57);
  uint64_t v71 = v19[11];
  uint64_t v72 = &v17[v71];
  uint64_t v73 = &v18[v71];
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 24))(v72, v73, v74);
  v58(&v17[v19[12]], &v18[v19[12]], v57);
  v58(&v17[v19[13]], &v18[v19[13]], v57);
  uint64_t v75 = v19[14];
  uint64_t v76 = &v17[v75];
  uint64_t v77 = &v18[v75];
  uint64_t v78 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v73) = __swift_getEnumTagSinglePayload((uint64_t)v76, 1, v78);
  int v79 = __swift_getEnumTagSinglePayload((uint64_t)v77, 1, v78);
  if (v73)
  {
    uint64_t v48 = v103;
    uint64_t v52 = a3;
    uint64_t v49 = v102;
    if (v79)
    {
      uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v76, v77, *(void *)(*(void *)(v80 - 8) + 64));
LABEL_15:
      uint64_t v53 = v101;
      goto LABEL_16;
    }
    (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v76, v77, v96);
    uint64_t v81 = (uint64_t)v76;
    uint64_t v82 = v78;
LABEL_14:
    __swift_storeEnumTagSinglePayload(v81, 0, 1, v82);
    goto LABEL_15;
  }
  uint64_t v48 = v103;
  uint64_t v52 = a3;
  if (v79)
  {
    sub_251994CD4((uint64_t)v76, (void (*)(void))type metadata accessor for DirectInvocationConfig);
    uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
    memcpy(v76, v77, *(void *)(*(void *)(v94 - 8) + 64));
  }
  else
  {
    v98(v76, v77, v96);
  }
LABEL_8:
  uint64_t v53 = v101;
  uint64_t v49 = v102;
LABEL_16:
  *((unsigned char *)v48 + v53[12]) = *((unsigned char *)v49 + v53[12]);
  uint64_t v83 = *(int *)(v52 + 20);
  uint64_t v84 = (void *)((char *)v48 + v83);
  uint64_t v85 = (uint64_t)v49 + v83;
  uint64_t v86 = *(void **)((char *)v48 + v83);
  uint64_t v87 = *(void **)((char *)v49 + v83);
  void *v84 = v87;
  id v88 = v87;

  v84[1] = *(void *)(v85 + 8);
  uint64_t v89 = *(int *)(v52 + 24);
  uint64_t v90 = (char *)v48 + v89;
  uint64_t v91 = (uint64_t)v49 + v89;
  uint64_t v92 = sub_2519C99B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v92 - 8) + 24))(v90, v91, v92);
  return v48;
}

uint64_t sub_251994CD4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

char *initializeWithTake for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  long long v5 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v5;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v6 = (int *)type metadata accessor for ConfirmationSnippetModel();
  uint64_t v7 = v6[7];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[v6[8]], &a2[v6[8]], v10);
  uint64_t v12 = v6[9];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32);
  v16(v13, v14, v15);
  v16(&a1[v6[10]], &a2[v6[10]], v15);
  uint64_t v56 = a2;
  uint64_t v57 = v6;
  uint64_t v17 = v6[11];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, (uint64_t)v20))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    uint64_t v53 = v16;
    uint64_t v54 = v15;
    v11(v18, v19, v10);
    uint64_t v22 = v20[5];
    uint64_t v23 = &v18[v22];
    uint64_t v24 = &v19[v22];
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32);
    v26(v23, v24, v25);
    uint64_t v27 = v20[6];
    uint64_t v28 = &v18[v27];
    uint64_t v29 = &v19[v27];
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
    uint64_t v31 = v20[7];
    uint64_t v55 = &v18[v31];
    uint64_t v32 = &v19[v31];
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v34 = *(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32);
    v34(v55, v32, v33);
    v34(&v18[v20[8]], &v19[v20[8]], v33);
    uint64_t v35 = v20[9];
    uint64_t v36 = &v18[v35];
    uint64_t v37 = &v19[v35];
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
    v26(&v18[v20[10]], &v19[v20[10]], v25);
    uint64_t v39 = v20[11];
    uint64_t v40 = &v18[v39];
    uint64_t v41 = &v19[v39];
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
    v26(&v18[v20[12]], &v19[v20[12]], v25);
    v26(&v18[v20[13]], &v19[v20[13]], v25);
    uint64_t v43 = v20[14];
    uint64_t v44 = &v18[v43];
    uint64_t v45 = &v19[v43];
    uint64_t v46 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46))
    {
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      v53(v44, v45, v54);
      __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v46);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, (uint64_t)v20);
  }
  a1[v57[12]] = *((unsigned char *)v56 + v57[12]);
  uint64_t v48 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)((char *)v56 + *(int *)(a3 + 20));
  uint64_t v49 = &a1[v48];
  uint64_t v50 = (char *)v56 + v48;
  uint64_t v51 = sub_2519C99B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v49, v50, v51);
  return a1;
}

void *assignWithTake for ConfirmationView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for ConfirmationSnippetModel();
  uint64_t v9 = v8[7];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v98 = *(void *)(v12 - 8);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v98 + 40);
  v13(v10, v11, v12);
  long long v100 = v13;
  v13(&a1[v8[8]], &a2[v8[8]], v12);
  uint64_t v14 = v8[9];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v96 = *(void *)(v17 - 8);
  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v96 + 40);
  v18(v15, v16, v17);
  uint64_t v97 = v17;
  v18(&a1[v8[10]], &a2[v8[10]], v17);
  long long v102 = v8;
  long long v103 = a2;
  uint64_t v19 = v8[11];
  uint64_t v105 = a1;
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = (int *)type metadata accessor for IconConfiguration();
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, (uint64_t)v22);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, (uint64_t)v22);
  if (v8)
  {
    if (!EnumTagSinglePayload)
    {
      (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v20, v21, v12);
      uint64_t v24 = v22[5];
      uint64_t v25 = &v20[v24];
      uint64_t v26 = &v21[v24];
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32);
      v28(v25, v26, v27);
      uint64_t v29 = v22[6];
      uint64_t v30 = &v20[v29];
      uint64_t v31 = &v21[v29];
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
      uint64_t v33 = v22[7];
      uint64_t v34 = &v20[v33];
      uint64_t v35 = &v21[v33];
      uint64_t v36 = v20;
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32);
      v38(v34, v35, v37);
      v38(&v36[v22[8]], &v21[v22[8]], v37);
      uint64_t v39 = v22[9];
      uint64_t v40 = &v36[v39];
      uint64_t v41 = &v21[v39];
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
      v28(&v36[v22[10]], &v21[v22[10]], v27);
      uint64_t v43 = v22[11];
      uint64_t v44 = &v36[v43];
      uint64_t v45 = &v21[v43];
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 32))(v44, v45, v46);
      v28(&v36[v22[12]], &v21[v22[12]], v27);
      v28(&v36[v22[13]], &v21[v22[13]], v27);
      uint64_t v47 = v22[14];
      uint64_t v48 = &v36[v47];
      uint64_t v49 = &v21[v47];
      uint64_t v50 = type metadata accessor for DirectInvocationConfig();
      uint64_t v51 = v103;
      uint64_t v52 = v105;
      if (__swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50))
      {
        uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v48, v49, *(void *)(*(void *)(v53 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v48, v49, v97);
        __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
      }
      uint64_t v55 = a3;
      uint64_t v84 = (uint64_t)v36;
      uint64_t v85 = (uint64_t)v22;
      goto LABEL_13;
    }
  }
  else
  {
    long long v99 = v18;
    if (!EnumTagSinglePayload)
    {
      v100(v20, v21, v12);
      uint64_t v57 = v22[5];
      uint64_t v58 = &v20[v57];
      uint64_t v59 = &v21[v57];
      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v61 = *(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 40);
      v61(v58, v59, v60);
      uint64_t v62 = v22[6];
      uint64_t v63 = &v20[v62];
      uint64_t v64 = &v21[v62];
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 40))(v63, v64, v65);
      uint64_t v66 = v22[7];
      uint64_t v101 = &v20[v66];
      uint64_t v67 = &v21[v66];
      uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v69 = *(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 40);
      v69(v101, v67, v68);
      v69(&v20[v22[8]], &v21[v22[8]], v68);
      uint64_t v70 = v22[9];
      uint64_t v71 = &v20[v70];
      uint64_t v72 = &v21[v70];
      uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 40))(v71, v72, v73);
      v61(&v20[v22[10]], &v21[v22[10]], v60);
      uint64_t v74 = v22[11];
      uint64_t v75 = &v20[v74];
      uint64_t v76 = &v21[v74];
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 40))(v75, v76, v77);
      v61(&v20[v22[12]], &v21[v22[12]], v60);
      v61(&v20[v22[13]], &v21[v22[13]], v60);
      uint64_t v78 = v22[14];
      int v79 = &v20[v78];
      uint64_t v80 = &v21[v78];
      uint64_t v81 = type metadata accessor for DirectInvocationConfig();
      LODWORD(v76) = __swift_getEnumTagSinglePayload((uint64_t)v79, 1, v81);
      int v82 = __swift_getEnumTagSinglePayload((uint64_t)v80, 1, v81);
      if (!v76)
      {
        uint64_t v52 = v105;
        if (v82)
        {
          sub_251994CD4((uint64_t)v79, (void (*)(void))type metadata accessor for DirectInvocationConfig);
          uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
          memcpy(v79, v80, *(void *)(*(void *)(v95 - 8) + 64));
        }
        else
        {
          v99(v79, v80, v97);
        }
        uint64_t v51 = v103;
        uint64_t v55 = a3;
        goto LABEL_14;
      }
      uint64_t v51 = v103;
      uint64_t v55 = a3;
      uint64_t v52 = v105;
      if (v82)
      {
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v79, v80, *(void *)(*(void *)(v83 - 8) + 64));
LABEL_14:
        uint64_t v56 = v102;
        goto LABEL_15;
      }
      (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v79, v80, v97);
      uint64_t v84 = (uint64_t)v79;
      uint64_t v85 = v81;
LABEL_13:
      __swift_storeEnumTagSinglePayload(v84, 0, 1, v85);
      goto LABEL_14;
    }
    sub_251994CD4((uint64_t)v20, (void (*)(void))type metadata accessor for IconConfiguration);
  }
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  memcpy(v20, v21, *(void *)(*(void *)(v54 - 8) + 64));
  uint64_t v51 = a2;
  uint64_t v55 = a3;
  uint64_t v56 = v102;
  uint64_t v52 = a1;
LABEL_15:
  *((unsigned char *)v52 + v56[12]) = *((unsigned char *)v51 + v56[12]);
  uint64_t v86 = *(int *)(v55 + 20);
  uint64_t v87 = (void *)((char *)v52 + v86);
  id v88 = (void *)((char *)v51 + v86);
  uint64_t v89 = *(void **)((char *)v52 + v86);
  *uint64_t v87 = *v88;

  v87[1] = v88[1];
  uint64_t v90 = *(int *)(v55 + 24);
  uint64_t v91 = (char *)v52 + v90;
  uint64_t v92 = (char *)v51 + v90;
  uint64_t v93 = sub_2519C99B0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v93 - 8) + 40))(v91, v92, v93);
  return v52;
}

uint64_t getEnumTagSinglePayload for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_251995AE8);
}

uint64_t sub_251995AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ConfirmationSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_2519C99B0();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for ConfirmationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_251995BB8);
}

void sub_251995BB8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for ConfirmationSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_2519C99B0();
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_251995C64()
{
  uint64_t result = type metadata accessor for ConfirmationSnippetModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2519C99B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_251995D38()
{
  unint64_t result = qword_269B94288;
  if (!qword_269B94288)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94270);
    sub_2519827F8(&qword_269B94290, &qword_269B94250);
    sub_2519827F8(&qword_269B94298, &qword_269B942A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94288);
  }
  return result;
}

uint64_t sub_251995E00()
{
  return sub_25199622C((uint64_t (*)(uint64_t))sub_251992FF4);
}

uint64_t sub_251995E1C()
{
  return sub_25199622C((uint64_t (*)(uint64_t))sub_251993224);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v30 = type metadata accessor for ConfirmationView();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(v30 - 8) + 80);
  uint64_t v32 = *(void *)(*(void *)(v30 - 8) + 64);
  uint64_t v33 = (v1 + 16) & ~v1;
  uint64_t v31 = v0;
  uint64_t v2 = v0 + v33;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (int *)type metadata accessor for ConfirmationSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0();
  uint64_t v5 = *(void (**)(void))(v4 + 8);
  OUTLINED_FUNCTION_4_4();
  v5();
  OUTLINED_FUNCTION_4_4();
  v5();
  uint64_t v6 = v0 + v33 + v3[9];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  v9(v2 + v3[10], v7);
  uint64_t v10 = v2 + v3[11];
  uint64_t v11 = type metadata accessor for IconConfiguration();
  if (!__swift_getEnumTagSinglePayload(v10, 1, v11))
  {
    OUTLINED_FUNCTION_4_4();
    v5();
    uint64_t v12 = v10 + *(int *)(v11 + 20);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0();
    uint64_t v15 = *(void (**)(void))(v14 + 8);
    ((void (*)(uint64_t, uint64_t))v15)(v12, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    OUTLINED_FUNCTION_0();
    uint64_t v16 = OUTLINED_FUNCTION_5_3();
    v17(v16);
    uint64_t v29 = v7;
    uint64_t v18 = v1;
    uint64_t v19 = *(void (**)(void))(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94018) - 8) + 8);
    OUTLINED_FUNCTION_6_3();
    v19();
    OUTLINED_FUNCTION_6_3();
    v19();
    uint64_t v1 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    OUTLINED_FUNCTION_0();
    uint64_t v20 = OUTLINED_FUNCTION_5_3();
    v21(v20);
    OUTLINED_FUNCTION_6_3();
    v15();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    OUTLINED_FUNCTION_0();
    uint64_t v22 = OUTLINED_FUNCTION_5_3();
    v23(v22);
    OUTLINED_FUNCTION_6_3();
    v15();
    OUTLINED_FUNCTION_6_3();
    v15();
    uint64_t v24 = v10 + *(int *)(v11 + 56);
    uint64_t v25 = type metadata accessor for DirectInvocationConfig();
    if (!__swift_getEnumTagSinglePayload(v24, 1, v25)) {
      v9(v24, v29);
    }
  }

  uint64_t v26 = v2 + *(int *)(v30 + 24);
  sub_2519C99B0();
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v27 + 8))(v26);

  return MEMORY[0x270FA0238](v31, v33 + v32, v1 | 7);
}

uint64_t sub_251996214()
{
  return sub_25199622C((uint64_t (*)(uint64_t))sub_251993134);
}

uint64_t sub_25199622C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for ConfirmationView();
  OUTLINED_FUNCTION_4_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return v0;
}

void TemperatureView.init(model:)()
{
  OUTLINED_FUNCTION_10_4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v17 = sub_2519C99B0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_9_4();
  uint64_t v7 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for TemperatureView();
  uint64_t v12 = (uint64_t *)(v4 + *(int *)(v16 + 20));
  sub_2519CA170();
  sub_251998D3C(&qword_269B93CB0, MEMORY[0x263F77980]);
  *uint64_t v12 = sub_2519C9AC0();
  v12[1] = v13;
  sub_251997828(v2, v4, (void (*)(void))type metadata accessor for TemperatureSnippetModel);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v14 = __swift_project_value_buffer(v7, (uint64_t)qword_269B99480);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v7);
  v18._char countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  v18._char countAndFlagsBits = 0xD000000000000030;
  v18._object = (void *)0x80000002519CE5D0;
  TemperatureSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v15._char countAndFlagsBits = 0xD000000000000068;
  v15._object = (void *)0x80000002519CE610;
  Logger.debug(output:test:caller:)(v18, 0, v15);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  (id)qword_269B99498;
  sub_2519C99A0();
  sub_2519CA300();
  sub_2519C9990();
  sub_251983CB8(v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v4 + *(int *)(v16 + 24), v0, v17);
  OUTLINED_FUNCTION_8_6();
}

uint64_t type metadata accessor for TemperatureView()
{
  uint64_t result = qword_269B942D0;
  if (!qword_269B942D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void TemperatureView.body.getter()
{
  OUTLINED_FUNCTION_10_4();
  uint64_t v56 = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94080);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for TemperatureView();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94088);
  OUTLINED_FUNCTION_4_0();
  uint64_t v47 = v10;
  uint64_t v48 = v9;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_9_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94090);
  OUTLINED_FUNCTION_4_0();
  uint64_t v50 = v12;
  uint64_t v51 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v49 = v13;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B942B8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v52 = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B942C0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v55 = v17;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1();
  uint64_t v53 = v19;
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  unint64_t v20 = v58;
  if (v58)
  {
    uint64_t v46 = v16;
    uint64_t v21 = v57;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    sub_2519C9920();
    if (v57 != 2)
    {
      char v23 = v57 & 1;
      uint64_t v44 = type metadata accessor for TemperatureView;
      sub_251997828(v0, (uint64_t)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for TemperatureView);
      uint64_t v24 = *(unsigned __int8 *)(v6 + 80);
      uint64_t v45 = v0;
      uint64_t v43 = v24 | 7;
      uint64_t v25 = swift_allocObject();
      *(unsigned char *)(v25 + 16) = v23;
      *(void *)(v25 + 24) = v21;
      *(void *)(v25 + 32) = v20;
      sub_251997A48((uint64_t)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + ((v24 + 40) & ~v24));
      sub_2519CA130();
      sub_251998D3C(&qword_269B940B0, MEMORY[0x263F778A0]);
      sub_2519CA030();
      *uint64_t v4 = sub_2519C9EE0();
      uint64_t v26 = *MEMORY[0x263F775F0];
      uint64_t v27 = sub_2519CA050();
      OUTLINED_FUNCTION_0();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v28 + 104))(v4, v26, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v27);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B940C0);
      sub_2519827F8(&qword_269B940C8, &qword_269B94088);
      sub_25198DA64();
      uint64_t v29 = v49;
      sub_2519C9D80();
      sub_251982980((uint64_t)v4, &qword_269B94080);
      OUTLINED_FUNCTION_5_1();
      v30();
      uint64_t v31 = v44;
      sub_251997828(v45, (uint64_t)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))v44);
      uint64_t v32 = (v24 + 16) & ~v24;
      uint64_t v48 = v32 + v7;
      uint64_t v33 = swift_allocObject();
      sub_251997A48((uint64_t)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v33 + v32);
      uint64_t v35 = v50;
      uint64_t v34 = v51;
      uint64_t v36 = v52;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v52, v29, v51);
      uint64_t v37 = v54;
      uint64_t v38 = (uint64_t (**)())(v36 + *(int *)(v54 + 36));
      *uint64_t v38 = sub_251997B08;
      v38[1] = (uint64_t (*)())v33;
      v38[2] = 0;
      v38[3] = 0;
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v29, v34);
      sub_251997828(v45, (uint64_t)v8, (void (*)(void))v31);
      uint64_t v39 = swift_allocObject();
      sub_251997A48((uint64_t)v8, v39 + v32);
      unint64_t v40 = sub_251997D48();
      uint64_t v41 = v53;
      sub_2519C9D60();
      swift_release();
      sub_251982980(v36, &qword_269B942B8);
      uint64_t v57 = v37;
      unint64_t v58 = v40;
      swift_getOpaqueTypeConformance2();
      uint64_t v42 = v46;
      uint64_t v22 = sub_2519C9D30();
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v41, v42);
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v22 = 0;
LABEL_6:
  *uint64_t v56 = v22;
  OUTLINED_FUNCTION_8_6();
}

uint64_t sub_251996BD8(char a1)
{
  uint64_t v2 = sub_2519C9BB0();
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  MEMORY[0x270FA5388](v3);
  if (a1) {
    sub_2519C9F00();
  }
  else {
    sub_2519C9E50();
  }
  sub_251991D3C();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2519C9D20();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_2519C9CD0();
  uint64_t v9 = sub_2519C9D00();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_251991DCC(v4, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_2519C9CE0();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_251991DCC(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_2519C9CF0();
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_251991DCC(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_2519C9D30();
  sub_251991DCC(v19, v21, v23);
  swift_bridgeObjectRelease();
  sub_2519C9BA0();
  sub_2519C9B90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519C9B80();
  swift_bridgeObjectRelease();
  sub_2519C9B90();
  sub_2519C9BC0();
  uint64_t v24 = sub_2519C9D10();
  uint64_t v26 = v25;
  char v28 = v27;
  uint64_t v38 = v29;
  sub_2519C9BA0();
  sub_2519C9B90();
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t result = sub_2519C9920();
  if (v21)
  {
    sub_2519C9B80();
    swift_bridgeObjectRelease();
    sub_2519C9B90();
    sub_2519C9BC0();
    uint64_t v31 = sub_2519C9D10();
    uint64_t v33 = v32;
    char v35 = v34;
    uint64_t v37 = v36;
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = v24;
    *(void *)(v40 + 24) = v26;
    *(unsigned char *)(v40 + 32) = v28 & 1;
    *(void *)(v40 + 40) = v38;
    uint64_t v39 = swift_allocObject();
    *(void *)(v39 + 16) = v31;
    *(void *)(v39 + 24) = v33;
    *(unsigned char *)(v39 + 32) = v35 & 1;
    *(void *)(v39 + 40) = v37;
    sub_2519CA120();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_251997078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2519C9A50();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F18508], v4);
  uint64_t v9 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B940C0) + 36));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940E0);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v9 + *(int *)(v10 + 28), v7, v4);
  *uint64_t v9 = KeyPath;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(a2, a1, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_251997208()
{
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2519C99D0();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
  v1._char countAndFlagsBits = 0xD000000000000068;
  v2._object = (void *)0x80000002519CE6A0;
  v1._object = (void *)0x80000002519CE610;
  v2._char countAndFlagsBits = 0xD000000000000028;
  Logger.debug(output:test:caller:)(v2, 0, v1);
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  type metadata accessor for TemperatureView();
  sub_2519CA2F0();
  return sub_2519C9980();
}

uint64_t sub_251997348(uint64_t a1)
{
  uint64_t v2 = sub_2519C99D0();
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2519C9820();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v2, (uint64_t)qword_269B99480);
  v13._char countAndFlagsBits = 0xD00000000000001CLL;
  v13._object = (void *)0x80000002519CE270;
  unint64_t v25 = (unint64_t)"rature snippet. ";
  v14._object = (void *)0x80000002519CE610;
  v14._char countAndFlagsBits = 0xD000000000000068;
  Logger.debug(output:test:caller:)(v13, 0, v14);
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  sub_2519C9920();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1) {
    return sub_251982980((uint64_t)v7, &qword_269B93F18);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  id v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  char v17 = *(void **)(a1 + *(int *)(type metadata accessor for TemperatureView() + 20));
  if (v17)
  {
    id v18 = v17;
    sub_2519CA140();

    sub_2519CA350();
    uint64_t v19 = (void *)sub_2519CA190();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setBundleId_, v19);

    uint64_t v20 = (void *)sub_2519C9800();
    objc_msgSend(v16, sel_setPunchOutUri_, v20);

    id v21 = v18;
    id v22 = v16;
    sub_2519CA150();

    uint64_t v23 = v26;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v4, v12, v2);
    strcpy((char *)&v27, "Punchout to ");
    BYTE5(v27._object) = 0;
    HIWORD(v27._object) = -5120;
    sub_251998D3C(&qword_269B94140, MEMORY[0x263F06EA8]);
    sub_2519CA4F0();
    sub_2519CA210();
    swift_bridgeObjectRelease();
    sub_2519CA210();
    v24._object = (void *)(v25 | 0x8000000000000000);
    v24._char countAndFlagsBits = 0xD000000000000068;
    Logger.debug(output:test:caller:)(v27, 0, v24);

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    sub_2519CA170();
    sub_251998D3C(&qword_269B93CB0, MEMORY[0x263F77980]);
    uint64_t result = sub_2519C9AB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_251997828(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_251997888()
{
  OUTLINED_FUNCTION_10_4();
  type metadata accessor for TemperatureView();
  OUTLINED_FUNCTION_2_1();
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v4();
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = *(void (**)(void))(v5 + 8);
  OUTLINED_FUNCTION_6_4();
  v6();
  OUTLINED_FUNCTION_6_4();
  v6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v8();

  sub_2519C99B0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v9();
  OUTLINED_FUNCTION_8_6();
  return MEMORY[0x270FA0238](v10, v11, v12);
}

uint64_t sub_251997A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TemperatureView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_251997AAC()
{
  uint64_t v1 = type metadata accessor for TemperatureView();
  OUTLINED_FUNCTION_4_1(v1);
  char v2 = *(unsigned char *)(v0 + 16);

  return sub_251996BD8(v2);
}

uint64_t sub_251997B08()
{
  return sub_251997CF4((uint64_t (*)(uint64_t))sub_251997208);
}

uint64_t objectdestroy_2Tm()
{
  OUTLINED_FUNCTION_10_4();
  type metadata accessor for TemperatureView();
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v4();
  type metadata accessor for TemperatureSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = *(void (**)(void))(v5 + 8);
  OUTLINED_FUNCTION_6_4();
  v6();
  OUTLINED_FUNCTION_6_4();
  v6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v8();

  sub_2519C99B0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v9();
  OUTLINED_FUNCTION_8_6();
  return MEMORY[0x270FA0238](v10, v11, v12);
}

uint64_t sub_251997CDC()
{
  return sub_251997CF4(sub_251997348);
}

uint64_t sub_251997CF4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for TemperatureView();
  OUTLINED_FUNCTION_4_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

unint64_t sub_251997D48()
{
  unint64_t result = qword_269B942C8;
  if (!qword_269B942C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B942B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94088);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B940C0);
    sub_2519827F8(&qword_269B940C8, &qword_269B94088);
    sub_25198DA64();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B942C8);
  }
  return result;
}

uint64_t sub_251997E44()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for TemperatureView(char *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v33 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v33 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for TemperatureSnippetModel();
    uint64_t v9 = v8[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    v13(v10, v11, v12);
    v13(&a1[v8[6]], (char *)a2 + v8[6], v12);
    uint64_t v14 = v8[7];
    uint64_t v15 = &a1[v14];
    id v16 = (char *)a2 + v14;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = v8[8];
    uint64_t v19 = &a1[v18];
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = *(int *)(a3 + 20);
    uint64_t v23 = *(int *)(a3 + 24);
    Swift::String v24 = &a1[v22];
    unint64_t v25 = (char *)a2 + v22;
    Swift::String v27 = *(void **)v25;
    uint64_t v26 = *((void *)v25 + 1);
    *(void *)Swift::String v24 = v27;
    *((void *)v24 + 1) = v26;
    char v28 = &a1[v23];
    uint64_t v29 = (char *)a2 + v23;
    uint64_t v30 = sub_2519C99B0();
    uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
    id v32 = v27;
    v31(v28, v29, v30);
  }
  return a1;
}

uint64_t destroy for TemperatureView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (int *)type metadata accessor for TemperatureSnippetModel();
  uint64_t v6 = a1 + v5[5];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + v5[6], v7);
  uint64_t v9 = a1 + v5[7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + v5[8];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  uint64_t v13 = a1 + *(int *)(a2 + 24);
  uint64_t v14 = sub_2519C99B0();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);

  return v15(v13, v14);
}

uint64_t initializeWithCopy for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  uint64_t v13 = v7[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  uint64_t v17 = v7[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = *(int *)(a3 + 24);
  uint64_t v23 = (void *)(a1 + v21);
  uint64_t v24 = a2 + v21;
  uint64_t v26 = *(void **)v24;
  uint64_t v25 = *(void *)(v24 + 8);
  *uint64_t v23 = v26;
  v23[1] = v25;
  uint64_t v27 = a1 + v22;
  uint64_t v28 = a2 + v22;
  uint64_t v29 = sub_2519C99B0();
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16);
  id v31 = v26;
  v30(v27, v28, v29);
  return a1;
}

uint64_t assignWithCopy for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  uint64_t v13 = v7[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = v7[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void **)(a1 + v21);
  uint64_t v25 = *(void **)(a2 + v21);
  *uint64_t v22 = v25;
  id v26 = v25;

  v22[1] = *(void *)(v23 + 8);
  uint64_t v27 = *(int *)(a3 + 24);
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  uint64_t v30 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
  return a1;
}

uint64_t initializeWithTake for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  uint64_t v13 = v7[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = v7[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  return a1;
}

uint64_t assignWithTake for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for TemperatureSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v12(a1 + v7[6], a2 + v7[6], v11);
  uint64_t v13 = v7[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = v7[8];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = *(void **)(a1 + v21);
  *uint64_t v22 = *v23;

  v22[1] = v23[1];
  uint64_t v25 = *(int *)(a3 + 24);
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 40))(v26, v27, v28);
  return a1;
}

uint64_t getEnumTagSinglePayload for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_251998A80);
}

uint64_t sub_251998A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for TemperatureSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_2519C99B0();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for TemperatureView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_251998B50);
}

void sub_251998B50(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for TemperatureSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_2519C99B0();
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_251998BFC()
{
  uint64_t result = type metadata accessor for TemperatureSnippetModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2519C99B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_251998CD0()
{
  unint64_t result = qword_269B942E0;
  if (!qword_269B942E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B942E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B942E0);
  }
  return result;
}

uint64_t sub_251998D3C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_251998D8C()
{
  sub_251991DCC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

Swift::Void __swiftcall Logger.debug(output:test:caller:)(Swift::String output, Swift::Bool test, Swift::String caller)
{
  object = caller._object;
  uint64_t countAndFlagsBits = caller._countAndFlagsBits;
  int v5 = output._object;
  uint64_t v29 = output._countAndFlagsBits;
  uint64_t v33 = 46;
  unint64_t v34 = 0xE100000000000000;
  id v31 = &v33;
  unint64_t v6 = sub_25199A2D0(sub_25199A404, (uint64_t)v30, caller._countAndFlagsBits, (unint64_t)caller._object);
  if (v7)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t v6 = OUTLINED_FUNCTION_15_0(v8);
  }
  unint64_t v9 = v6;
  uint64_t v33 = 47;
  unint64_t v34 = 0xE100000000000000;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_12_1();
  unint64_t v11 = sub_25199A2D0(sub_25199A528, v10, countAndFlagsBits, (unint64_t)object);
  char v13 = v12;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_2519C99C0();
  os_log_type_t v15 = sub_2519CA2D0();
  BOOL v16 = os_log_type_enabled(v14, v15);
  if (v13)
  {
    if (v16)
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136446466;
      uint64_t v24 = OUTLINED_FUNCTION_8_7(15, v9);
      uint64_t v25 = MEMORY[0x2533A8070](v24);
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v28 = sub_251999AD4(v25, v27, &v33);
      OUTLINED_FUNCTION_9_5(v28);
      sub_2519CA380();
      OUTLINED_FUNCTION_3_3();
      goto LABEL_9;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_3_3();
    goto LABEL_11;
  }
  if (!v16) {
    goto LABEL_10;
  }
  uint64_t v17 = swift_slowAlloc();
  uint64_t v33 = swift_slowAlloc();
  *(_DWORD *)uint64_t v17 = 136446466;
  unint64_t v18 = OUTLINED_FUNCTION_11_3(v11);
  if (v9 >> 14 >= v18 >> 14)
  {
    uint64_t v19 = OUTLINED_FUNCTION_8_7(v18, v9);
    uint64_t v20 = MEMORY[0x2533A8070](v19);
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_251999AD4(v20, v22, &v33);
    OUTLINED_FUNCTION_9_5(v23);
    sub_2519CA380();
    OUTLINED_FUNCTION_3_3();
LABEL_9:
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_251999AD4(v29, (unint64_t)v5, &v33);
    sub_2519CA380();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_251976000, v14, v15, "%{public}s: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_5_4();
LABEL_11:

    return;
  }
  __break(1u);
}

uint64_t sub_25199914C()
{
  uint64_t v0 = sub_2519C99D0();
  __swift_allocate_value_buffer(v0, qword_269B99480);
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  id v1 = (id)qword_269B99498;
  return sub_2519C99E0();
}

uint64_t sub_2519991D8()
{
  sub_25199A484();
  if (qword_269B93B80 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2519CA360();
  qword_269B99498 = result;
  return result;
}

void sub_251999278()
{
  qword_269B994A0 = 26997;
  *(void *)algn_269B994A8 = 0xE200000000000000;
}

Swift::Void __swiftcall Logger.info(output:addToSummary:test:caller:)(Swift::String output, Swift::Bool addToSummary, Swift::Bool test, Swift::String caller)
{
  object = caller._object;
  uint64_t countAndFlagsBits = caller._countAndFlagsBits;
  unint64_t v6 = output._object;
  uint64_t v7 = 0x65725F7261646172;
  uint64_t v33 = 46;
  unint64_t v34 = 0xE100000000000000;
  if (addToSummary) {
    unint64_t v8 = 0xEF202D2074726F70;
  }
  else {
    unint64_t v8 = 0xE000000000000000;
  }
  id v31 = &v33;
  if (!addToSummary) {
    uint64_t v7 = 0;
  }
  uint64_t v28 = output._countAndFlagsBits;
  uint64_t v29 = v7;
  unint64_t v9 = sub_25199A2D0(sub_25199A528, (uint64_t)v30, caller._countAndFlagsBits, (unint64_t)caller._object);
  if (v10)
  {
    OUTLINED_FUNCTION_1_1();
    unint64_t v9 = OUTLINED_FUNCTION_15_0(v11);
  }
  unint64_t v12 = v9;
  uint64_t v33 = 47;
  unint64_t v34 = 0xE100000000000000;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_12_1();
  unint64_t v14 = sub_25199A2D0(sub_25199A528, v13, countAndFlagsBits, (unint64_t)object);
  char v16 = v15;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_2519C99C0();
  os_log_type_t v18 = sub_2519CA2C0();
  BOOL v19 = os_log_type_enabled(v17, v18);
  if (v16)
  {
    if (v19)
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_251999AD4(v29, v8, &v33);
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_16_0();
      *(_WORD *)(v23 + 12) = 2082;
      uint64_t v24 = OUTLINED_FUNCTION_8_7(15, v12);
      uint64_t v25 = MEMORY[0x2533A8070](v24);
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v32 = sub_251999AD4(v25, v27, &v33);
      OUTLINED_FUNCTION_0_1();
      OUTLINED_FUNCTION_3_3();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_251999AD4(v28, (unint64_t)v6, &v33);
      OUTLINED_FUNCTION_0_1();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_251976000, v17, v18, "%s%{public}s: %s", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_5_4();
      goto LABEL_14;
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_3_3();
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  if (!v19) {
    goto LABEL_15;
  }
  uint64_t v20 = swift_slowAlloc();
  uint64_t v33 = swift_slowAlloc();
  *(_DWORD *)uint64_t v20 = 136315650;
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_251999AD4(v29, v8, &v33);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_16_0();
  *(_WORD *)(v20 + 12) = 2082;
  unint64_t v21 = OUTLINED_FUNCTION_11_3(v14);
  if (v12 >> 14 >= v21 >> 14)
  {
    uint64_t v22 = OUTLINED_FUNCTION_8_7(v21, v12);
    MEMORY[0x2533A8070](v22);
    OUTLINED_FUNCTION_10_5();
    uint64_t v32 = sub_251999AD4(countAndFlagsBits, v8, &v33);
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_3_3();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_251999AD4(v28, (unint64_t)v6, &v33);
    OUTLINED_FUNCTION_0_1();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_251976000, v17, v18, "%s%{public}s: %s", (uint8_t *)v20, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_5_4();
LABEL_14:
    OUTLINED_FUNCTION_5_4();
LABEL_16:

    return;
  }
  __break(1u);
}

Swift::Void __swiftcall Logger.error(output:test:file:function:line:)(Swift::String output, Swift::Bool test, Swift::String file, Swift::String function, Swift::Int line)
{
  object = function._object;
  uint64_t countAndFlagsBits = function._countAndFlagsBits;
  unint64_t v7 = (unint64_t)file._object;
  uint64_t v8 = file._countAndFlagsBits;
  unint64_t v9 = output._object;
  uint64_t v48 = output._countAndFlagsBits;
  v52[0] = 47;
  v52[1] = 0xE100000000000000;
  uint64_t v50 = v52;
  unint64_t v10 = sub_25199A2D0(sub_25199A528, (uint64_t)v49, file._countAndFlagsBits, (unint64_t)file._object);
  char v12 = v11;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_2519C99C0();
  int v14 = sub_2519CA2E0();
  BOOL v15 = os_log_type_enabled(v13, (os_log_type_t)v14);
  if (v12)
  {
    if (v15)
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      v52[0] = v30;
      *(_DWORD *)uint64_t v29 = 136316162;
      HIDWORD(v45) = v14;
      uint64_t v51 = OUTLINED_FUNCTION_2_2(v30, v31, v32, v33, v34, v35, v36, v37, v44, v45);
      OUTLINED_FUNCTION_7_6();
      OUTLINED_FUNCTION_14();
      uint64_t v51 = sub_251999AD4(countAndFlagsBits, (unint64_t)object, v52);
      OUTLINED_FUNCTION_7_6();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_13_1();
      uint64_t v51 = sub_251999AD4(v48, (unint64_t)v9, v52);
      OUTLINED_FUNCTION_7_6();
      OUTLINED_FUNCTION_16_0();
      *(_WORD *)(v29 + 32) = 2082;
      OUTLINED_FUNCTION_1_1();
      BOOL v41 = (v39 & v40) == 0;
      uint64_t v42 = 7;
      if (!v41) {
        uint64_t v42 = 11;
      }
      uint64_t v43 = OUTLINED_FUNCTION_8_7(15, v42 | (v38 << 16));
      MEMORY[0x2533A8070](v43);
      OUTLINED_FUNCTION_10_5();
      uint64_t v51 = sub_251999AD4(v8, (unint64_t)v9, v52);
      OUTLINED_FUNCTION_7_6();
      OUTLINED_FUNCTION_3_3();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_5();
      sub_2519CA380();
      _os_log_impl(&dword_251976000, v13, v47, "%s\n%{public}s: %s\n    at %{public}s:%{public}ld", (uint8_t *)v29, 0x34u);
      swift_arrayDestroy();
      goto LABEL_13;
    }
LABEL_14:
    OUTLINED_FUNCTION_3_3();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  if (!v15) {
    goto LABEL_14;
  }
  HIDWORD(v45) = v14;
  uint64_t v16 = swift_slowAlloc();
  uint64_t v17 = swift_slowAlloc();
  v52[0] = v17;
  *(_DWORD *)uint64_t v16 = 136316162;
  uint64_t v51 = OUTLINED_FUNCTION_2_2(v17, v18, v19, v20, v21, v22, v23, v24, v17, v45);
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_14();
  uint64_t v51 = sub_251999AD4(countAndFlagsBits, (unint64_t)object, v52);
  OUTLINED_FUNCTION_6_5();
  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_13_1();
  uint64_t v51 = sub_251999AD4(v48, (unint64_t)v9, v52);
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_16_0();
  *(_WORD *)(v16 + 32) = 2082;
  unint64_t v25 = OUTLINED_FUNCTION_11_3(v10);
  uint64_t v26 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0) {
    uint64_t v26 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v26 >= v25 >> 14)
  {
    uint64_t v27 = 7;
    if (((v7 >> 60) & ((v8 & 0x800000000000000) == 0)) != 0) {
      uint64_t v27 = 11;
    }
    uint64_t v28 = OUTLINED_FUNCTION_8_7(v25, v27 | (v26 << 16));
    MEMORY[0x2533A8070](v28);
    OUTLINED_FUNCTION_10_5();
    uint64_t v51 = sub_251999AD4(v8, (unint64_t)v9, v52);
    OUTLINED_FUNCTION_6_5();
    OUTLINED_FUNCTION_3_3();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_5();
    sub_2519CA380();
    _os_log_impl(&dword_251976000, v13, v46, "%s\n%{public}s: %s\n    at %{public}s:%{public}ld", (uint8_t *)v16, 0x34u);
    swift_arrayDestroy();
LABEL_13:
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_5_4();
LABEL_15:

    return;
  }
  __break(1u);
}

uint64_t sub_251999AD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_251999BA8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25199A424((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25199A424((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_251999BA8(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_251999D00((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2519CA390();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_251999DD8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_2519CA3F0();
    if (!v8)
    {
      uint64_t result = sub_2519CA410();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_251999D00(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2519CA420();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_251999DD8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_251999E70(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_25199A04C(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_25199A04C((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_251999E70(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_2519CA230();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_251999FE4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_2519CA3C0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_2519CA420();
  __break(1u);
LABEL_14:
  uint64_t result = sub_2519CA410();
  __break(1u);
  return result;
}

void *sub_251999FE4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B942F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_25199A04C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B942F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_25199A1FC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25199A124(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25199A124(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2519CA420();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_25199A1FC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2519CA420();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_25199A28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_2519CA500() & 1;
  }
}

unint64_t sub_25199A2D0(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v5 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  while (1)
  {
    unint64_t v7 = sub_2519CA1F0();
    v12[0] = sub_2519CA260();
    v12[1] = v8;
    char v9 = a1(v12);
    if (v4) {
      break;
    }
    char v10 = v9;
    swift_bridgeObjectRelease();
    if (v10) {
      return v7;
    }
    if (v7 < 0x4000) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_25199A3D8(uint64_t *a1, uint64_t *a2)
{
  return sub_25199A28C(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_25199A404(uint64_t *a1)
{
  return sub_25199A3D8(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_25199A424(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_25199A484()
{
  unint64_t result = qword_269B942F8;
  if (!qword_269B942F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B942F8);
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_25199A528(uint64_t *a1)
{
  return sub_25199A404(a1) & 1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_2519CA380();
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return sub_251999AD4(0x65725F7261646172, 0xEF202D2074726F70, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_4_5()
{
  *(_WORD *)(v0 + 42) = 2050;
}

void OUTLINED_FUNCTION_5_4()
{
  JUMPOUT(0x2533A8840);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_2519CA380();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return sub_2519CA380();
}

uint64_t OUTLINED_FUNCTION_8_7(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9D8F0](a1, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_9_5(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_3(uint64_t a1)
{
  return MEMORY[0x270F9D760](a1, 1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  *(_WORD *)(v0 + 22) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14()
{
  *(_WORD *)(v0 + 12) = 2082;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_15_0@<X0>(uint64_t a1@<X8>)
{
  return MEMORY[0x270F9D760](v1 | (a1 << 16), -1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t IconConfiguration.description.getter()
{
  return 0;
}

uint64_t IconConfiguration.iconName.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t IconConfiguration.iconColor.getter()
{
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  return v1;
}

uint64_t IconConfiguration.init(iconName:iconColor:circleColor:onStateIconName:offStateIconName:action:rgbIconColor:deviceType:onStateMode:offStateMode:)@<X0>(uint64_t a1@<X5>, uint64_t a2@<X7>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  sub_2519C9900();
  sub_2519C9900();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94300);
  sub_2519C9900();
  OUTLINED_FUNCTION_16_1();
  sub_2519C9900();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94308);
  sub_2519C9900();
  OUTLINED_FUNCTION_16_1();
  sub_2519C9900();
  OUTLINED_FUNCTION_16_1();
  sub_2519C9900();
  uint64_t v9 = a3 + *(int *)(v8 + 56);
  uint64_t v10 = type metadata accessor for DirectInvocationConfig();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  char v12 = *(void (**)(void))(v11 + 8);
  OUTLINED_FUNCTION_10_6();
  v12();
  sub_2519C9900();
  if (a1) {
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v13();
  sub_2519C9900();
  sub_25199B6D0(a6, v9);
  sub_2519C9900();
  OUTLINED_FUNCTION_10_6();
  v12();
  sub_2519C9900();
  OUTLINED_FUNCTION_10_6();
  v12();
  OUTLINED_FUNCTION_29(a2);
  OUTLINED_FUNCTION_10_6();
  v12();
  OUTLINED_FUNCTION_29(a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v14();
  sub_2519C9900();
  sub_2519C9900();
  sub_2519C9900();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  sub_2519C9930();
  return sub_25199B738(a6);
}

uint64_t IconConfiguration.rgbIconColor.getter()
{
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  sub_2519C9920();
  return v1;
}

uint64_t static IconConfiguration.== infix(_:_:)()
{
  uint64_t v0 = IconConfiguration.description.getter();
  uint64_t v2 = v1;
  if (v0 == IconConfiguration.description.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2519CA500();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t IconConfiguration.circleColor.setter()
{
  return OUTLINED_FUNCTION_18_0();
}

uint64_t IconConfiguration.shouldRenderCircle.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t IconConfiguration.iconName.setter()
{
  return OUTLINED_FUNCTION_18_0();
}

uint64_t IconConfiguration.iconColor.setter()
{
  return OUTLINED_FUNCTION_18_0();
}

uint64_t IconConfiguration.onStateIconName.setter()
{
  return OUTLINED_FUNCTION_18_0();
}

uint64_t IconConfiguration.offStateIconName.setter()
{
  return OUTLINED_FUNCTION_18_0();
}

uint64_t IconConfiguration.rgbIconColor.setter()
{
  return sub_2519C9930();
}

uint64_t IconConfiguration.onStateMode.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t IconConfiguration.offStateMode.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t IconConfiguration.deviceType.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t IconConfiguration.id.getter()
{
  sub_2519C9850();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_5();
  sub_2519C9840();
  uint64_t v1 = sub_2519C9830();
  OUTLINED_FUNCTION_23();
  v2();
  return v1;
}

uint64_t sub_25199B164()
{
  return IconConfiguration.iconName.setter();
}

uint64_t (*IconConfiguration.iconName.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  v1[4] = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t (*IconConfiguration.iconColor.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.shouldRenderCircle.getter()
{
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  return v1;
}

uint64_t type metadata accessor for IconConfiguration()
{
  uint64_t result = qword_269B94388;
  if (!qword_269B94388) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t (*IconConfiguration.shouldRenderCircle.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.onStateMode.getter()
{
  return sub_2519C9920();
}

uint64_t sub_25199B390@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = IconConfiguration.onStateMode.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_25199B3CC()
{
  return IconConfiguration.onStateMode.setter();
}

uint64_t (*IconConfiguration.onStateMode.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.offStateMode.getter()
{
  return sub_2519C9920();
}

uint64_t sub_25199B4A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = IconConfiguration.offStateMode.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_25199B4DC()
{
  return IconConfiguration.offStateMode.setter();
}

uint64_t (*IconConfiguration.offStateMode.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.deviceType.getter()
{
  return sub_2519C9920();
}

uint64_t sub_25199B5B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = IconConfiguration.deviceType.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_25199B5EC()
{
  return IconConfiguration.deviceType.setter();
}

uint64_t (*IconConfiguration.deviceType.modify())()
{
  unsigned __int8 v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.circleColor.getter()
{
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  return v1;
}

uint64_t sub_25199B6D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_25199B738(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t (*IconConfiguration.circleColor.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t sub_25199B7F8()
{
  return IconConfiguration.rgbIconColor.setter();
}

uint64_t (*IconConfiguration.rgbIconColor.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.onStateIconName.getter()
{
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  return v1;
}

uint64_t (*IconConfiguration.onStateIconName.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.offStateIconName.getter()
{
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  return v1;
}

uint64_t sub_25199B97C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v6, v7);
}

uint64_t (*IconConfiguration.offStateIconName.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_6((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t IconConfiguration.action.getter()
{
  uint64_t v2 = v1 + *(int *)(OUTLINED_FUNCTION_31() + 56);

  return sub_2519921CC(v2, v0);
}

uint64_t IconConfiguration.action.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for IconConfiguration() + 56);

  return sub_25199BAA4(a1, v3);
}

uint64_t sub_25199BAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*IconConfiguration.action.modify())()
{
  return nullsub_1;
}

uint64_t sub_25199BB54()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB) {
    return 11;
  }
  else {
    return v0;
  }
}

uint64_t sub_25199BBA4()
{
  return 11;
}

unint64_t sub_25199BBAC(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x4D65746174536E6FLL;
      break;
    case 3:
      unint64_t result = 0x657461745366666FLL;
      break;
    case 4:
      unint64_t result = 0x7954656369766564;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x6F43656C63726963;
      break;
    case 7:
      unint64_t result = 0x6E6F69746361;
      break;
    case 8:
      unint64_t result = 0x656D614E6E6F6369;
      break;
    case 9:
      unint64_t result = 0x6F6C6F436E6F6369;
      break;
    case 10:
      unint64_t result = 0x436E6F6349626772;
      break;
    default:
      unint64_t result = 0x4965746174536E6FLL;
      break;
  }
  return result;
}

unint64_t sub_25199BD38(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x4D65746174536E6FLL;
      break;
    case 3:
      unint64_t result = 0x657461745366666FLL;
      break;
    case 4:
      unint64_t result = 0x7954656369766564;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x6F43656C63726963;
      break;
    case 7:
      unint64_t result = 0x6E6F69746361;
      break;
    case 8:
      unint64_t result = 0x656D614E6E6F6369;
      break;
    case 9:
      unint64_t result = 0x6F6C6F436E6F6369;
      break;
    case 10:
      unint64_t result = 0x436E6F6349626772;
      break;
    default:
      unint64_t result = 0x4965746174536E6FLL;
      break;
  }
  return result;
}

uint64_t sub_25199BEC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2519BE780(*a1, *a2);
}

uint64_t sub_25199BED0()
{
  return sub_2519BE978();
}

uint64_t sub_25199BED8(uint64_t a1)
{
  return sub_2519BECAC(a1, *v1);
}

uint64_t sub_25199BEE0(uint64_t a1)
{
  return sub_2519BEE88(a1, *v1);
}

uint64_t sub_25199BEE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25199BB54();
  *a1 = result;
  return result;
}

unint64_t sub_25199BF18@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_25199BBAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_25199BF44()
{
  return sub_25199BD38(*v0);
}

uint64_t sub_25199BF4C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25199BBA0();
  *a1 = result;
  return result;
}

uint64_t sub_25199BF74@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25199BBA4();
  *a1 = result;
  return result;
}

uint64_t sub_25199BF9C(uint64_t a1)
{
  unint64_t v2 = sub_25199C980();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25199BFD8(uint64_t a1)
{
  unint64_t v2 = sub_25199C980();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t IconConfiguration.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_5();
  uint64_t v31 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94310);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v7 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5();
  uint64_t v11 = v10 - v9;
  uint64_t v13 = v10 - v9 + *(int *)(v12 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  uint64_t v33 = v13;
  sub_2519C9900();
  sub_2519C9900();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94300);
  sub_2519C9900();
  OUTLINED_FUNCTION_16_1();
  sub_2519C9900();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94308);
  sub_2519C9900();
  OUTLINED_FUNCTION_16_1();
  sub_2519C9900();
  OUTLINED_FUNCTION_16_1();
  sub_2519C9900();
  uint64_t v14 = v11 + *(int *)(v7 + 56);
  uint64_t v15 = type metadata accessor for DirectInvocationConfig();
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25199C980();
  sub_2519CA550();
  if (v32)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0();
    uint64_t v17 = *(void (**)(void))(v16 + 8);
    OUTLINED_FUNCTION_12_2();
    v17();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v18();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v19();
    OUTLINED_FUNCTION_12_2();
    v17();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v20();
    OUTLINED_FUNCTION_12_2();
    v17();
    OUTLINED_FUNCTION_12_2();
    v17();
    return sub_25199B738(v14);
  }
  else
  {
    sub_2519CA460();
    sub_2519C9900();
    sub_2519CA460();
    OUTLINED_FUNCTION_22();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0();
    uint64_t v23 = *(void (**)(void))(v22 + 8);
    ((void (*)(uint64_t, uint64_t))v23)(v33, v21);
    OUTLINED_FUNCTION_8_8();
    OUTLINED_FUNCTION_26(5);
    sub_2519CA470();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v24();
    sub_2519C9900();
    OUTLINED_FUNCTION_26(6);
    sub_2519CA460();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_23();
    v23();
    OUTLINED_FUNCTION_8_8();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_23();
    v23();
    OUTLINED_FUNCTION_8_8();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_23();
    v23();
    OUTLINED_FUNCTION_8_8();
    sub_25199D028(&qword_269B94320);
    sub_2519CA480();
    __swift_storeEnumTagSinglePayload(v31, 0, 1, 0);
    sub_25199BAA4(v31, v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94328);
    sub_25199D10C(&qword_269B94330);
    sub_2519CA480();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v25();
    sub_2519C9900();
    sub_25199C9CC();
    OUTLINED_FUNCTION_21();
    sub_2519CA480();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v26();
    sub_2519C9900();
    sub_25199CA18();
    OUTLINED_FUNCTION_21();
    sub_2519CA480();
    sub_2519C9900();
    sub_2519CA480();
    sub_2519C9900();
    uint64_t v27 = OUTLINED_FUNCTION_19();
    v28(v27);
    sub_25199CA64(v11, a2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_251992320(v11, (void (*)(void))type metadata accessor for IconConfiguration);
  }
}

unint64_t sub_25199C980()
{
  unint64_t result = qword_269B94318;
  if (!qword_269B94318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94318);
  }
  return result;
}

unint64_t sub_25199C9CC()
{
  unint64_t result = qword_269B94338;
  if (!qword_269B94338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94338);
  }
  return result;
}

unint64_t sub_25199CA18()
{
  unint64_t result = qword_269B94340;
  if (!qword_269B94340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94340);
  }
  return result;
}

uint64_t sub_25199CA64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IconConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t IconConfiguration.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94348);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25199C980();
  sub_2519CA560();
  type metadata accessor for IconConfiguration();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  sub_251987684();
  OUTLINED_FUNCTION_24();
  sub_2519CA4D0();
  if (v6) {

  }
  swift_bridgeObjectRelease();
  sub_2519C9920();
  OUTLINED_FUNCTION_11_4(1);
  OUTLINED_FUNCTION_17();
  uint64_t v3 = v6;
  if (v6)
  {

    uint64_t v3 = 0;
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  sub_2519CA4C0();
  if (v3) {

  }
  sub_2519C9920();
  OUTLINED_FUNCTION_11_4(6);
  OUTLINED_FUNCTION_17();
  if (v3) {

  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA4B0();
  swift_bridgeObjectRelease();
  sub_2519C9920();
  OUTLINED_FUNCTION_11_4(9);
  sub_2519CA4D0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
  sub_25199CF98();
  OUTLINED_FUNCTION_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94308);
  sub_25199D06C();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_17();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94300);
  sub_25199D174();
  OUTLINED_FUNCTION_17();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  sub_2519C9920();
  sub_25199D234();
  OUTLINED_FUNCTION_15_1();
  sub_2519C9920();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_1();
  return v4();
}

unint64_t sub_25199CF98()
{
  unint64_t result = qword_269B94350;
  if (!qword_269B94350)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94030);
    sub_25199D028(&qword_269B94358);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94350);
  }
  return result;
}

uint64_t sub_25199D028(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DirectInvocationConfig();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25199D06C()
{
  unint64_t result = qword_269B94360;
  if (!qword_269B94360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94308);
    sub_25199D10C(&qword_269B94368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94360);
  }
  return result;
}

uint64_t sub_25199D10C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94328);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25199D174()
{
  unint64_t result = qword_269B94370;
  if (!qword_269B94370)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94300);
    sub_25199D1E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94370);
  }
  return result;
}

unint64_t sub_25199D1E8()
{
  unint64_t result = qword_269B94378;
  if (!qword_269B94378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94378);
  }
  return result;
}

unint64_t sub_25199D234()
{
  unint64_t result = qword_269B94380;
  if (!qword_269B94380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94380);
  }
  return result;
}

uint64_t sub_25199D280(void *a1)
{
  return IconConfiguration.encode(to:)(a1);
}

uint64_t sub_25199D298@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return IconConfiguration.init(from:)(a1, a2);
}

uint64_t sub_25199D2B0()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_25199D2BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = IconConfiguration.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25199D2E8()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = IconConfiguration.iconName.getter();
  *unint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25199D314()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = IconConfiguration.iconColor.getter();
  *unint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25199D33C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25199B97C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.iconColor.setter);
}

uint64_t sub_25199D368()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = IconConfiguration.shouldRenderCircle.getter();
  *unint64_t v0 = result & 1;
  return result;
}

uint64_t sub_25199D394()
{
  return IconConfiguration.shouldRenderCircle.setter();
}

uint64_t sub_25199D3D4()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = IconConfiguration.circleColor.getter();
  *unint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25199D3FC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25199B97C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.circleColor.setter);
}

uint64_t sub_25199D428()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = IconConfiguration.rgbIconColor.getter();
  *unint64_t v0 = result;
  return result;
}

uint64_t sub_25199D454()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = IconConfiguration.onStateIconName.getter();
  *unint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25199D47C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25199B97C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.onStateIconName.setter);
}

uint64_t sub_25199D4A8()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = IconConfiguration.offStateIconName.getter();
  *unint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_25199D4D0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25199B97C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))IconConfiguration.offStateIconName.setter);
}

char *initializeBufferWithCopyOfBuffer for IconConfiguration(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v34 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v37(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = &a1[v12];
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    v20(v17, v18, v19);
    v20(&a1[a3[8]], (char *)a2 + a3[8], v19);
    uint64_t v21 = a3[9];
    uint64_t v22 = &a1[v21];
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    v37(&a1[a3[10]], (char *)a2 + a3[10], v11);
    uint64_t v25 = a3[11];
    uint64_t v26 = &a1[v25];
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    v37(&a1[a3[12]], (char *)a2 + a3[12], v11);
    v37(&a1[a3[13]], (char *)a2 + a3[13], v11);
    uint64_t v29 = a3[14];
    uint64_t v30 = &a1[v29];
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v30, v31, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v30, v31, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
    }
  }
  return a1;
}

uint64_t destroy for IconConfiguration(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  uint64_t v8 = a1 + a2[6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(a1 + a2[8], v11);
  uint64_t v13 = a1 + a2[9];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v7(a1 + a2[10], v6);
  uint64_t v15 = a1 + a2[11];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v7(a1 + a2[12], v6);
  v7(a1 + a2[13], v6);
  uint64_t v17 = a1 + a2[14];
  uint64_t v18 = type metadata accessor for DirectInvocationConfig();
  uint64_t result = __swift_getEnumTagSinglePayload(v17, 1, v18);
  if (!result)
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);
    return v21(v17, v20);
  }
  return result;
}

uint64_t initializeWithCopy for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v35(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  v35(a1 + a3[10], a2 + a3[10], v10);
  uint64_t v24 = a3[11];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  v35(a1 + a3[12], a2 + a3[12], v10);
  v35(a1 + a3[13], a2 + a3[13], v10);
  uint64_t v28 = a3[14];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  uint64_t v31 = type metadata accessor for DirectInvocationConfig();
  if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31))
  {
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v33 - 8) + 16))(v29, v30, v33);
    __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
  }
  return a1;
}

uint64_t assignWithCopy for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v37(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  v37(a1 + a3[10], a2 + a3[10], v10);
  uint64_t v24 = a3[11];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  v37(a1 + a3[12], a2 + a3[12], v10);
  v37(a1 + a3[13], a2 + a3[13], v10);
  uint64_t v28 = a3[14];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  uint64_t v31 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v25) = __swift_getEnumTagSinglePayload((uint64_t)v29, 1, v31);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31);
  if (!v25)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v36 - 8) + 24))(v29, v30, v36);
      return a1;
    }
    sub_251992320((uint64_t)v29, (void (*)(void))type metadata accessor for DirectInvocationConfig);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
    memcpy(v29, v30, *(void *)(*(void *)(v34 - 8) + 64));
    return a1;
  }
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v33 - 8) + 16))(v29, v30, v33);
  __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
  return a1;
}

uint64_t initializeWithTake for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v35(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  v35(a1 + a3[10], a2 + a3[10], v10);
  uint64_t v24 = a3[11];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
  v35(a1 + a3[12], a2 + a3[12], v10);
  v35(a1 + a3[13], a2 + a3[13], v10);
  uint64_t v28 = a3[14];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  uint64_t v31 = type metadata accessor for DirectInvocationConfig();
  if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31))
  {
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v33 - 8) + 32))(v29, v30, v33);
    __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
  }
  return a1;
}

uint64_t assignWithTake for IconConfiguration(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v37(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  v37(a1 + a3[10], a2 + a3[10], v10);
  uint64_t v24 = a3[11];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
  v37(a1 + a3[12], a2 + a3[12], v10);
  v37(a1 + a3[13], a2 + a3[13], v10);
  uint64_t v28 = a3[14];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  uint64_t v31 = type metadata accessor for DirectInvocationConfig();
  LODWORD(v25) = __swift_getEnumTagSinglePayload((uint64_t)v29, 1, v31);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31);
  if (!v25)
  {
    if (!EnumTagSinglePayload)
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v36 - 8) + 40))(v29, v30, v36);
      return a1;
    }
    sub_251992320((uint64_t)v29, (void (*)(void))type metadata accessor for DirectInvocationConfig);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
    memcpy(v29, v30, *(void *)(*(void *)(v34 - 8) + 64));
    return a1;
  }
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v33 - 8) + 32))(v29, v30, v33);
  __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
  return a1;
}

uint64_t getEnumTagSinglePayload for IconConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25199E95C);
}

uint64_t sub_25199E95C(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        OUTLINED_FUNCTION_0_0();
        if (*(_DWORD *)(v16 + 84) == a2)
        {
          uint64_t v8 = v15;
          uint64_t v12 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          OUTLINED_FUNCTION_0_0();
          if (*(_DWORD *)(v18 + 84) == a2)
          {
            uint64_t v8 = v17;
            uint64_t v12 = a3[9];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
            OUTLINED_FUNCTION_0_0();
            if (*(_DWORD *)(v20 + 84) == a2)
            {
              uint64_t v8 = v19;
              uint64_t v12 = a3[11];
            }
            else
            {
              uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
              uint64_t v12 = a3[14];
            }
          }
        }
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for IconConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25199EABC);
}

uint64_t sub_25199EABC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        OUTLINED_FUNCTION_0_0();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          OUTLINED_FUNCTION_0_0();
          if (*(_DWORD *)(v20 + 84) == a3)
          {
            uint64_t v10 = v19;
            uint64_t v14 = a4[9];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
            OUTLINED_FUNCTION_0_0();
            if (*(_DWORD *)(v22 + 84) == a3)
            {
              uint64_t v10 = v21;
              uint64_t v14 = a4[11];
            }
            else
            {
              uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
              uint64_t v14 = a4[14];
            }
          }
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_25199EC10()
{
  sub_25197C958(319, (unint64_t *)&qword_269B93C78);
  if (v0 <= 0x3F)
  {
    sub_2519857E4(319, &qword_269B93F90, &qword_269B93F20);
    if (v1 <= 0x3F)
    {
      sub_25197C958(319, &qword_269B93C90);
      if (v2 <= 0x3F)
      {
        sub_25197C958(319, &qword_269B94398);
        if (v3 <= 0x3F)
        {
          sub_2519857E4(319, &qword_269B943A0, &qword_269B94300);
          if (v4 <= 0x3F)
          {
            sub_2519857E4(319, &qword_269B943A8, &qword_269B94308);
            if (v5 <= 0x3F)
            {
              sub_25199EE68();
              if (v6 <= 0x3F) {
                swift_initStructMetadata();
              }
            }
          }
        }
      }
    }
  }
}

void sub_25199EE68()
{
  if (!qword_269B943B0)
  {
    type metadata accessor for DirectInvocationConfig();
    unint64_t v0 = sub_2519CA370();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B943B0);
    }
  }
}

uint64_t getEnumTagSinglePayload for IconConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF6)
  {
    if (a2 + 10 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 10) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 11;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v5 = v6 - 11;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for IconConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *uint64_t result = a2 + 10;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25199F014);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IconConfiguration.CodingKeys()
{
  return &type metadata for IconConfiguration.CodingKeys;
}

unint64_t sub_25199F050()
{
  unint64_t result = qword_269B943B8;
  if (!qword_269B943B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B943B8);
  }
  return result;
}

unint64_t sub_25199F0A0()
{
  unint64_t result = qword_269B943C0;
  if (!qword_269B943C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B943C0);
  }
  return result;
}

unint64_t sub_25199F0F0()
{
  unint64_t result = qword_269B943C8;
  if (!qword_269B943C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B943C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t a1)
{
  *uint64_t v1 = a1;
  return type metadata accessor for IconConfiguration();
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  *(void *)(v2 - 104) = v0;
  *(void *)(v2 - 96) = v1;
  return sub_2519C9900();
}

uint64_t OUTLINED_FUNCTION_11_4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_2519CA4D0();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  *(void *)(v0 - 104) = 0;
  *(void *)(v0 - 96) = 0;
  return v0 - 104;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_2519CA4D0();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return sub_2519C9930();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return type metadata accessor for IconConfiguration();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_2519C9930();
}

uint64_t OUTLINED_FUNCTION_26@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return 0x6E6F6369202CLL;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_2519CA460();
}

uint64_t OUTLINED_FUNCTION_29@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 104) = v1;
  *(void *)(v2 - 96) = a1;
  return sub_2519C9900();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return type metadata accessor for IconConfiguration();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return type metadata accessor for IconConfiguration();
}

uint64_t DisambiguationOption.action.setter()
{
  return sub_2519C98A0();
}

uint64_t type metadata accessor for DisambiguationOption(uint64_t a1)
{
  return sub_2519A0280(a1, (uint64_t *)&unk_269B94448);
}

uint64_t DisambiguationOption.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DisambiguationOption.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DisambiguationOption.label.modify())()
{
  return nullsub_1;
}

uint64_t DisambiguationOption.speechLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DisambiguationOption.speechLabel.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*DisambiguationOption.speechLabel.modify())()
{
  return nullsub_1;
}

uint64_t DisambiguationOption.iconConfig.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2519A035C(type metadata accessor for DisambiguationOption, &qword_269B93FC8, a1);
}

uint64_t DisambiguationOption.iconConfig.setter(uint64_t a1)
{
  return sub_2519A03CC(a1, type metadata accessor for DisambiguationOption, &qword_269B93FC8);
}

uint64_t (*DisambiguationOption.iconConfig.modify())()
{
  return nullsub_1;
}

uint64_t DisambiguationOption.action.getter()
{
  return sub_2519C9890();
}

uint64_t sub_25199F568(id *a1)
{
  id v1 = *a1;
  return DisambiguationOption.action.setter();
}

uint64_t (*DisambiguationOption.action.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  v2[4] = sub_2519C9880();
  return sub_2519796F0;
}

uint64_t sub_25199F604()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_25199F654()
{
  return 4;
}

uint64_t sub_25199F65C(char a1)
{
  return *(void *)&aLabel_1[8 * a1];
}

uint64_t sub_25199F67C()
{
  return sub_2519BE714();
}

uint64_t sub_25199F688()
{
  return sub_2519BE990();
}

uint64_t sub_25199F690()
{
  return sub_2519BEC60();
}

uint64_t sub_25199F698(uint64_t a1)
{
  return sub_2519BEEA0(a1, *v1);
}

uint64_t sub_25199F6A0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25199F604();
  *a1 = result;
  return result;
}

uint64_t sub_25199F6D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25199F65C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_25199F6FC()
{
  return sub_25199F65C(*v0);
}

uint64_t sub_25199F704@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25199F650();
  *a1 = result;
  return result;
}

uint64_t sub_25199F72C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_25199F654();
  *a1 = result;
  return result;
}

uint64_t sub_25199F754(uint64_t a1)
{
  unint64_t v2 = sub_25199FBE8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25199F790(uint64_t a1)
{
  unint64_t v2 = sub_25199FBE8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DisambiguationOption.init(from:)()
{
  OUTLINED_FUNCTION_7_7();
  uint64_t v3 = v2;
  uint64_t v19 = v4;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v20 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v21 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  uint64_t v9 = OUTLINED_FUNCTION_4(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1();
  uint64_t v23 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B943D0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2_3();
  type metadata accessor for DisambiguationOption(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_6_6();
  uint64_t v14 = (uint64_t)v1 + *(int *)(v13 + 24);
  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_15_2(v14, 1);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_25199FBE8();
  sub_2519CA550();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_251982980(v14, &qword_269B93FC8);
  }
  else
  {
    *id v1 = sub_2519CA460();
    v1[1] = v15;
    void v1[2] = sub_2519CA460();
    v1[3] = v16;
    sub_25199FEA0(&qword_269B93C28, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    sub_2519CA480();
    OUTLINED_FUNCTION_15_2(v23, 0);
    sub_2519A0418(v23, v14, &qword_269B93FC8);
    sub_251987794(&qword_269B93FE8);
    sub_2519CA480();
    sub_2519C9890();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v22);
    sub_2519869B8();
    sub_2519C9870();
    uint64_t v17 = OUTLINED_FUNCTION_14_0();
    v18(v17);
    sub_2519A0AD4((uint64_t)v1, v19, (void (*)(void))type metadata accessor for DisambiguationOption);
    __swift_destroy_boxed_opaque_existential_1(0);
    sub_2519A0B28((uint64_t)v1, (void (*)(void))type metadata accessor for DisambiguationOption);
  }
  OUTLINED_FUNCTION_8_9();
}

unint64_t sub_25199FBE8()
{
  unint64_t result = qword_269B943D8;
  if (!qword_269B943D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B943D8);
  }
  return result;
}

void DisambiguationOption.encode(to:)()
{
  OUTLINED_FUNCTION_7_7();
  unint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_2_3();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_25199FBE8();
  sub_2519CA560();
  sub_2519CA4B0();
  if (v0) {

  }
  sub_2519CA4B0();
  type metadata accessor for DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  sub_2519876F0();
  sub_2519CA4D0();
  sub_2519C9890();
  sub_2519869B8();
  sub_2519C9870();
  sub_251987794(&qword_269B94000);
  sub_2519CA4D0();
  OUTLINED_FUNCTION_5_1();
  v5();
  OUTLINED_FUNCTION_5_1();
  v6();
  OUTLINED_FUNCTION_8_9();
}

uint64_t sub_25199FEA0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25199FEE8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  uint64_t v2 = OUTLINED_FUNCTION_4(v1);
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5();
  uint64_t v5 = v4 - v3;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRetain();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  uint64_t v6 = type metadata accessor for DisambiguationOption(0);
  sub_251982930(v0 + *(int *)(v6 + 24), v5, &qword_269B93FC8);
  uint64_t v7 = type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload(v5, 1, v7) == 1)
  {
    sub_251982980(v5, &qword_269B93FC8);
  }
  else
  {
    IconConfiguration.description.getter();
    sub_2519A0B28(v5, (void (*)(void))type metadata accessor for IconConfiguration);
  }
  sub_2519CA210();
  swift_bridgeObjectRelease();
  return 0x203A6C6562616CLL;
}

void sub_2519A00BC()
{
}

void sub_2519A00D4()
{
}

uint64_t sub_2519A00EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DisambiguationOption.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t DisambiguationSnippetModel.displayText.setter()
{
  return sub_2519C9930();
}

uint64_t DisambiguationSnippetModel.displayText.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t sub_2519A0180()
{
  return DisambiguationSnippetModel.displayText.setter();
}

uint64_t (*DisambiguationSnippetModel.displayText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  v2[4] = sub_2519C9910();
  return sub_2519796F0;
}

uint64_t DisambiguationSnippetModel.options.getter()
{
  type metadata accessor for DisambiguationSnippetModel(0);

  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for DisambiguationSnippetModel(uint64_t a1)
{
  return sub_2519A0280(a1, (uint64_t *)&unk_269B94458);
}

uint64_t sub_2519A0280(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t DisambiguationSnippetModel.options.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for DisambiguationSnippetModel(0) + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DisambiguationSnippetModel.options.modify())()
{
  return nullsub_1;
}

uint64_t DisambiguationSnippetModel.defaultOption.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2519A035C(type metadata accessor for DisambiguationSnippetModel, &qword_269B943E8, a1);
}

uint64_t sub_2519A035C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1(0);
  return sub_251982930(v3 + *(int *)(v6 + 24), a3, a2);
}

uint64_t DisambiguationSnippetModel.defaultOption.setter(uint64_t a1)
{
  return sub_2519A03CC(a1, type metadata accessor for DisambiguationSnippetModel, &qword_269B943E8);
}

uint64_t sub_2519A03CC(uint64_t a1, uint64_t (*a2)(void), uint64_t *a3)
{
  uint64_t v6 = a2(0);
  return sub_2519A0418(a1, v3 + *(int *)(v6 + 24), a3);
}

uint64_t sub_2519A0418(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t (*DisambiguationSnippetModel.defaultOption.modify())()
{
  return nullsub_1;
}

uint64_t sub_2519A04BC()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_2519A050C()
{
  return 3;
}

uint64_t sub_2519A0514(char a1)
{
  return *(void *)&aDisplaytoption[8 * a1];
}

uint64_t sub_2519A0534()
{
  return sub_2519BE4E4();
}

uint64_t sub_2519A0540()
{
  return sub_2519BE9A8();
}

uint64_t sub_2519A0548()
{
  return sub_2519BEACC();
}

uint64_t sub_2519A0550()
{
  return sub_2519BF0A4();
}

uint64_t sub_2519A0558@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519A04BC();
  *a1 = result;
  return result;
}

uint64_t sub_2519A0588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519A0514(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2519A05B4()
{
  return sub_2519A0514(*v0);
}

uint64_t sub_2519A05BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519A0508();
  *a1 = result;
  return result;
}

uint64_t sub_2519A05E4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519A050C();
  *a1 = result;
  return result;
}

uint64_t sub_2519A060C(uint64_t a1)
{
  unint64_t v2 = sub_2519A09E4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519A0648(uint64_t a1)
{
  unint64_t v2 = sub_2519A09E4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DisambiguationSnippetModel.init(from:)()
{
  OUTLINED_FUNCTION_7_7();
  uint64_t v3 = v2;
  uint64_t v17 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
  uint64_t v6 = OUTLINED_FUNCTION_4(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B943F0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5();
  uint64_t v11 = type metadata accessor for DisambiguationSnippetModel(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_2_3();
  uint64_t v14 = v1 + *(int *)(v13 + 24);
  type metadata accessor for DisambiguationOption(0);
  OUTLINED_FUNCTION_15_2(v14, 1);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2519A09E4();
  sub_2519CA550();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_251982980(v14, &qword_269B943E8);
  }
  else
  {
    uint64_t v18 = sub_2519CA460();
    sub_2519C9900();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94400);
    sub_2519A0A30();
    sub_2519CA480();
    *(void *)(v1 + *(int *)(v11 + 20)) = v18;
    sub_25199FEA0(&qword_269B94410, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    sub_2519CA480();
    uint64_t v15 = OUTLINED_FUNCTION_4_7();
    v16(v15);
    OUTLINED_FUNCTION_15_2(v9, 0);
    sub_2519A0418(v9, v14, &qword_269B943E8);
    sub_2519A0AD4(v1, v17, (void (*)(void))type metadata accessor for DisambiguationSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    sub_2519A0B28(v1, (void (*)(void))type metadata accessor for DisambiguationSnippetModel);
  }
  OUTLINED_FUNCTION_8_9();
}

unint64_t sub_2519A09E4()
{
  unint64_t result = qword_269B943F8;
  if (!qword_269B943F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B943F8);
  }
  return result;
}

unint64_t sub_2519A0A30()
{
  unint64_t result = qword_269B94408;
  if (!qword_269B94408)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94400);
    sub_25199FEA0(&qword_269B94410, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94408);
  }
  return result;
}

uint64_t sub_2519A0AD4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_9_0();
  v5(v4);
  return a2;
}

uint64_t sub_2519A0B28(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

uint64_t DisambiguationSnippetModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94418);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519A09E4();
  sub_2519CA560();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA4B0();
  if (v1)
  {
    uint64_t v4 = OUTLINED_FUNCTION_21_0();
    v5(v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DisambiguationSnippetModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94400);
    sub_2519A0D64();
    sub_2519CA4D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    sub_2519A0E08();
    sub_2519CA4D0();
    uint64_t v7 = OUTLINED_FUNCTION_21_0();
    return v8(v7);
  }
}

unint64_t sub_2519A0D64()
{
  unint64_t result = qword_269B94420;
  if (!qword_269B94420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94400);
    sub_25199FEA0(&qword_269B94428, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94420);
  }
  return result;
}

unint64_t sub_2519A0E08()
{
  unint64_t result = qword_269B94430;
  if (!qword_269B94430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B943E8);
    sub_25199FEA0(&qword_269B94428, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94430);
  }
  return result;
}

uint64_t sub_2519A0EAC()
{
  uint64_t v2 = type metadata accessor for DisambiguationOption(0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2_3();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
  uint64_t v7 = OUTLINED_FUNCTION_4(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5();
  uint64_t v10 = v9 - v8;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  uint64_t v22 = 0x5379616C70736964;
  unint64_t v23 = 0xEF203A676E697274;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  OUTLINED_FUNCTION_9_6();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  uint64_t v11 = type metadata accessor for DisambiguationSnippetModel(0);
  v21[0] = *(void *)(v0 + *(int *)(v11 + 20));
  swift_bridgeObjectRetain_n();
  sub_2519A1AC8(v21);
  swift_bridgeObjectRelease();
  size_t v12 = v21[0];
  int64_t v13 = *(void *)(v21[0] + 16);
  if (v13)
  {
    uint64_t v20 = v11;
    v21[0] = MEMORY[0x263F8EE78];
    sub_2519A2DDC(0, v13, 0);
    uint64_t v14 = v12 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    size_t v15 = v21[0];
    do
    {
      sub_2519A0AD4(v14, v1, (void (*)(void))type metadata accessor for DisambiguationOption);
      sub_25199FEE8();
      sub_2519A0B28(v1, (void (*)(void))type metadata accessor for DisambiguationOption);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2519A2DDC(0, *(void *)(v15 + 16) + 1, 1);
        size_t v15 = v21[0];
      }
      unint64_t v17 = *(void *)(v15 + 16);
      unint64_t v16 = *(void *)(v15 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_2519A2DDC((char *)(v16 > 1), v17 + 1, 1);
        size_t v15 = v21[0];
      }
      OUTLINED_FUNCTION_13_3();
    }
    while (!v18);
    swift_release();
    uint64_t v11 = v20;
  }
  else
  {
    swift_release();
    size_t v15 = MEMORY[0x263F8EE78];
  }
  MEMORY[0x2533A8140](v15, MEMORY[0x263F8D310]);
  sub_2519CA210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  sub_251982930(v0 + *(int *)(v11 + 24), v10, &qword_269B943E8);
  if (__swift_getEnumTagSinglePayload(v10, 1, v2) == 1)
  {
    sub_251982980(v10, &qword_269B943E8);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2519A0B28(v10, (void (*)(void))type metadata accessor for DisambiguationOption);
  }
  sub_2519CA210();
  swift_bridgeObjectRelease();
  return v22;
}

unint64_t DisambiguationSnippetModel.stringId.getter()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for DisambiguationOption(0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2_3();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
  uint64_t v8 = OUTLINED_FUNCTION_4(v7);
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5();
  uint64_t v11 = v10 - v9;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  unint64_t v25 = 0xD000000000000010;
  unint64_t v26 = 0x80000002519CEA40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  OUTLINED_FUNCTION_9_6();
  swift_bridgeObjectRelease();
  unint64_t v23 = 0x736E6F6974706F23;
  unint64_t v24 = 0xEA0000000000203ALL;
  uint64_t v12 = type metadata accessor for DisambiguationSnippetModel(0);
  size_t v22 = *(void *)(v2 + *(int *)(v12 + 20));
  swift_bridgeObjectRetain_n();
  sub_2519A1AC8(&v22);
  swift_bridgeObjectRelease();
  size_t v13 = v22;
  int64_t v14 = *(void *)(v22 + 16);
  if (v14)
  {
    uint64_t v21 = v11;
    size_t v22 = MEMORY[0x263F8EE78];
    sub_2519A2DDC(0, v14, 0);
    uint64_t v15 = v13 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    size_t v16 = v22;
    do
    {
      sub_2519A0AD4(v15, v1, (void (*)(void))type metadata accessor for DisambiguationOption);
      sub_25199FEE8();
      sub_2519A0B28(v1, (void (*)(void))type metadata accessor for DisambiguationOption);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2519A2DDC(0, *(void *)(v16 + 16) + 1, 1);
        size_t v16 = v22;
      }
      unint64_t v18 = *(void *)(v16 + 16);
      unint64_t v17 = *(void *)(v16 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_2519A2DDC((char *)(v17 > 1), v18 + 1, 1);
        size_t v16 = v22;
      }
      OUTLINED_FUNCTION_13_3();
    }
    while (!v19);
    swift_release();
    uint64_t v11 = v21;
  }
  else
  {
    swift_release();
    size_t v16 = MEMORY[0x263F8EE78];
  }
  MEMORY[0x2533A8140](v16, MEMORY[0x263F8D310]);
  sub_2519CA210();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_6();
  swift_bridgeObjectRelease();
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD000000000000010;
  unint64_t v24 = 0x80000002519CEA60;
  sub_251982930(v2 + *(int *)(v12 + 24), v11, &qword_269B943E8);
  if (__swift_getEnumTagSinglePayload(v11, 1, v3) == 1)
  {
    sub_251982980(v11, &qword_269B943E8);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2519A0B28(v11, (void (*)(void))type metadata accessor for DisambiguationOption);
  }
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_6();
  swift_bridgeObjectRelease();
  return v25;
}

void sub_2519A15FC()
{
}

uint64_t sub_2519A1614(void *a1)
{
  return DisambiguationSnippetModel.encode(to:)(a1);
}

uint64_t sub_2519A162C(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_2519CA410();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      type metadata accessor for DisambiguationOption(0);
      uint64_t v2 = sub_2519CA2B0();
      *(void *)(v2 + 16) = a1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
    }
    type metadata accessor for DisambiguationOption(0);
    return v2;
  }
  return result;
}

char *sub_2519A170C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2519CA420();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_2519A17A0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = sub_2519CA420();
    __break(1u);
  }
  else if (a3 < a1 {
         || (uint64_t result = type metadata accessor for DisambiguationOption(0),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for DisambiguationOption(0);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_2519A18D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a2;
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 16 * v4 > a1) ? (v6 = a1 + 16 * v4 > a3) : (v6 = 0), v6))
  {
    uint64_t v8 = sub_2519CA420();
    __break(1u);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8D310];
    uint64_t v8 = a3;
  }
  return MEMORY[0x270FA01C8](v8, v5, v4, v7);
}

uint64_t sub_2519A19B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0
    || ((uint64_t v6 = type metadata accessor for DisambiguationOption(0),
         uint64_t v7 = *(void *)(*(void *)(v6 - 8) + 72) * a2,
         unint64_t v8 = a3 + v7,
         unint64_t v9 = a1 + v7,
         v8 > a1)
      ? (BOOL v10 = v9 > a3)
      : (BOOL v10 = 0),
        v10))
  {
    uint64_t v12 = sub_2519CA420();
    __break(1u);
  }
  else
  {
    uint64_t v11 = v6;
    uint64_t v12 = a3;
    unint64_t v13 = a1;
    uint64_t v14 = a2;
  }
  return MEMORY[0x270FA01C8](v12, v13, v14, v11);
}

void sub_2519A1AC8(size_t *a1)
{
  type metadata accessor for DisambiguationOption(0);
  size_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    size_t v2 = sub_2519A8774(v2);
  }
  sub_2519A1B70();
  *a1 = v2;
}

void sub_2519A1B70()
{
  OUTLINED_FUNCTION_7_7();
  size_t v2 = v1;
  uint64_t v142 = type metadata accessor for DisambiguationOption(0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v140 = v3;
  MEMORY[0x270FA5388](v4);
  uint64_t v136 = (uint64_t)&v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_19_0();
  uint64_t v146 = v7;
  OUTLINED_FUNCTION_7();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v127 - v10;
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v127 - v13;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_19_0();
  uint64_t v132 = v15;
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_19_0();
  uint64_t v138 = (void *)v17;
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_19_0();
  uint64_t v134 = (void *)v19;
  OUTLINED_FUNCTION_7();
  MEMORY[0x270FA5388](v20);
  v133 = (uint64_t *)((char *)&v127 - v21);
  uint64_t v148 = v2;
  uint64_t v22 = v2[1];
  uint64_t v23 = sub_2519CA4E0();
  if (v23 >= v22)
  {
    if (v22 < 0) {
      goto LABEL_156;
    }
    if (v22) {
      sub_2519A25B0();
    }
LABEL_134:
    OUTLINED_FUNCTION_8_9();
  }
  else
  {
    uint64_t v24 = v23;
    uint64_t v141 = v0;
    uint64_t v130 = sub_2519A162C(v22 / 2);
    uint64_t v139 = v25;
    if (v22 > 0)
    {
      uint64_t v129 = v24;
      uint64_t v143 = v14;
      uint64_t v144 = v11;
      uint64_t v26 = 0;
      uint64_t v27 = (char *)MEMORY[0x263F8EE78];
      uint64_t v28 = v22;
      uint64_t v131 = v22;
      while (1)
      {
        uint64_t v29 = v26;
        uint64_t v30 = v26 + 1;
        uint64_t v137 = v26;
        if (v26 + 1 >= v28)
        {
          ++v26;
        }
        else
        {
          uint64_t v31 = *v148;
          uint64_t v32 = *(void *)(v140 + 72);
          uint64_t v33 = v133;
          sub_2519A0AD4(*v148 + v32 * v30, (uint64_t)v133, (void (*)(void))type metadata accessor for DisambiguationOption);
          uint64_t v147 = v32;
          uint64_t v34 = v134;
          sub_2519A0AD4(v31 + v32 * v26, (uint64_t)v134, (void (*)(void))type metadata accessor for DisambiguationOption);
          BOOL v35 = *v33 == *v34 && v33[1] == v34[1];
          uint64_t v36 = v132;
          if (v35) {
            LODWORD(v145) = 0;
          }
          else {
            LODWORD(v145) = sub_2519CA500();
          }
          sub_2519A0B28((uint64_t)v134, (void (*)(void))type metadata accessor for DisambiguationOption);
          sub_2519A0B28((uint64_t)v133, (void (*)(void))type metadata accessor for DisambiguationOption);
          uint64_t v29 = v137;
          uint64_t v26 = v137 + 2;
          uint64_t v135 = v31;
          if (v137 + 2 < v28)
          {
            uint64_t v37 = v27;
            uint64_t v38 = v147 * v30;
            uint64_t v39 = v31;
            uint64_t v40 = v147 * v26;
            while (1)
            {
              uint64_t v41 = v28;
              uint64_t v42 = v138;
              sub_2519A0AD4(v39 + v40, (uint64_t)v138, (void (*)(void))type metadata accessor for DisambiguationOption);
              sub_2519A0AD4(v39 + v38, (uint64_t)v36, (void (*)(void))type metadata accessor for DisambiguationOption);
              BOOL v43 = *v42 == *v36 && v42[1] == v36[1];
              int v44 = v43 ? 0 : sub_2519CA500();
              sub_2519A0B28((uint64_t)v36, (void (*)(void))type metadata accessor for DisambiguationOption);
              sub_2519A0B28((uint64_t)v138, (void (*)(void))type metadata accessor for DisambiguationOption);
              if ((v145 ^ v44)) {
                break;
              }
              ++v26;
              v39 += v147;
              uint64_t v28 = v41;
              if (v26 >= v41)
              {
                uint64_t v26 = v41;
                uint64_t v27 = v37;
                uint64_t v29 = v137;
                goto LABEL_24;
              }
            }
            uint64_t v27 = v37;
            uint64_t v29 = v137;
            uint64_t v28 = v41;
LABEL_24:
            uint64_t v31 = v135;
          }
          if (v145)
          {
            if (v26 < v29) {
              goto LABEL_158;
            }
            if (v29 < v26)
            {
              uint64_t v145 = v28;
              v128 = v27;
              uint64_t v45 = 0;
              uint64_t v46 = v147 * (v26 - 1);
              uint64_t v47 = v26 * v147;
              uint64_t v48 = v29;
              uint64_t v49 = v29 * v147;
              do
              {
                if (v48 != v26 + v45 - 1)
                {
                  if (!v31) {
                    goto LABEL_164;
                  }
                  sub_2519A8788(v31 + v49, v136);
                  if (v49 < v46 || v31 + v49 >= (unint64_t)(v31 + v47))
                  {
                    OUTLINED_FUNCTION_18_1();
                    swift_arrayInitWithTakeFrontToBack();
                  }
                  else if (v49 != v46)
                  {
                    OUTLINED_FUNCTION_18_1();
                    swift_arrayInitWithTakeBackToFront();
                  }
                  sub_2519A8788(v136, v31 + v46);
                  uint64_t v31 = v135;
                }
                ++v48;
                --v45;
                v46 -= v147;
                v47 -= v147;
                v49 += v147;
              }
              while (v48 < v26 + v45);
              uint64_t v27 = v128;
              uint64_t v29 = v137;
              uint64_t v28 = v145;
            }
          }
        }
        if (v26 < v28)
        {
          if (__OFSUB__(v26, v29)) {
            goto LABEL_155;
          }
          if (v26 - v29 < v129)
          {
            if (__OFADD__(v29, v129)) {
              goto LABEL_159;
            }
            if (v29 + v129 >= v28) {
              uint64_t v51 = v28;
            }
            else {
              uint64_t v51 = v29 + v129;
            }
            if (v51 < v29)
            {
LABEL_160:
              __break(1u);
              goto LABEL_161;
            }
            if (v26 != v51)
            {
              v128 = v27;
              uint64_t v52 = *(void *)(v140 + 72);
              uint64_t v147 = v52 * (v26 - 1);
              uint64_t v145 = v52;
              uint64_t v53 = v26 * v52;
              uint64_t v135 = v51;
              do
              {
                uint64_t v54 = 0;
                uint64_t v55 = v29;
                while (1)
                {
                  uint64_t v56 = *v148;
                  uint64_t v57 = v143;
                  sub_2519A0AD4(v53 + v54 + *v148, (uint64_t)v143, (void (*)(void))type metadata accessor for DisambiguationOption);
                  uint64_t v58 = v147 + v54 + v56;
                  uint64_t v59 = v144;
                  sub_2519A0AD4(v58, (uint64_t)v144, (void (*)(void))type metadata accessor for DisambiguationOption);
                  if (*v57 == *v59 && v57[1] == v59[1]) {
                    break;
                  }
                  char v61 = sub_2519CA500();
                  sub_2519A0B28((uint64_t)v59, (void (*)(void))type metadata accessor for DisambiguationOption);
                  sub_2519A0B28((uint64_t)v57, (void (*)(void))type metadata accessor for DisambiguationOption);
                  if ((v61 & 1) == 0) {
                    goto LABEL_62;
                  }
                  uint64_t v62 = *v148;
                  if (!*v148) {
                    goto LABEL_162;
                  }
                  uint64_t v63 = v62 + v147 + v54;
                  sub_2519A8788(v62 + v53 + v54, v146);
                  swift_arrayInitWithTakeFrontToBack();
                  sub_2519A8788(v146, v63);
                  v54 -= v145;
                  if (v26 == ++v55) {
                    goto LABEL_62;
                  }
                }
                sub_2519A0B28((uint64_t)v59, (void (*)(void))type metadata accessor for DisambiguationOption);
                sub_2519A0B28((uint64_t)v57, (void (*)(void))type metadata accessor for DisambiguationOption);
LABEL_62:
                ++v26;
                v147 += v145;
                v53 += v145;
                uint64_t v29 = v137;
              }
              while (v26 != v135);
              uint64_t v26 = v135;
              uint64_t v27 = v128;
            }
          }
        }
        if (v26 < v29) {
          goto LABEL_154;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v27 = sub_2519A2CD0(0, *((void *)v27 + 2) + 1, 1, v27);
        }
        unint64_t v65 = *((void *)v27 + 2);
        unint64_t v64 = *((void *)v27 + 3);
        unint64_t v66 = v65 + 1;
        if (v65 >= v64 >> 1) {
          uint64_t v27 = sub_2519A2CD0((char *)(v64 > 1), v65 + 1, 1, v27);
        }
        *((void *)v27 + 2) = v66;
        uint64_t v67 = v27 + 32;
        uint64_t v68 = &v27[16 * v65 + 32];
        *(void *)uint64_t v68 = v29;
        *((void *)v68 + 1) = v26;
        if (v65)
        {
          while (1)
          {
            unint64_t v69 = v66 - 1;
            if (v66 >= 4)
            {
              uint64_t v74 = &v67[16 * v66];
              uint64_t v75 = *((void *)v74 - 8);
              uint64_t v76 = *((void *)v74 - 7);
              BOOL v80 = __OFSUB__(v76, v75);
              uint64_t v77 = v76 - v75;
              if (v80) {
                goto LABEL_139;
              }
              uint64_t v79 = *((void *)v74 - 6);
              uint64_t v78 = *((void *)v74 - 5);
              BOOL v80 = __OFSUB__(v78, v79);
              uint64_t v72 = v78 - v79;
              char v73 = v80;
              if (v80) {
                goto LABEL_140;
              }
              unint64_t v81 = v66 - 2;
              int v82 = &v67[16 * v66 - 32];
              uint64_t v84 = *(void *)v82;
              uint64_t v83 = *((void *)v82 + 1);
              BOOL v80 = __OFSUB__(v83, v84);
              uint64_t v85 = v83 - v84;
              if (v80) {
                goto LABEL_141;
              }
              BOOL v80 = __OFADD__(v72, v85);
              uint64_t v86 = v72 + v85;
              if (v80) {
                goto LABEL_143;
              }
              if (v86 >= v77)
              {
                uint64_t v104 = &v67[16 * v69];
                uint64_t v106 = *(void *)v104;
                uint64_t v105 = *((void *)v104 + 1);
                BOOL v80 = __OFSUB__(v105, v106);
                uint64_t v107 = v105 - v106;
                if (v80) {
                  goto LABEL_149;
                }
                BOOL v97 = v72 < v107;
                goto LABEL_101;
              }
            }
            else
            {
              if (v66 != 3)
              {
                uint64_t v98 = *((void *)v27 + 4);
                uint64_t v99 = *((void *)v27 + 5);
                BOOL v80 = __OFSUB__(v99, v98);
                uint64_t v91 = v99 - v98;
                char v92 = v80;
                goto LABEL_95;
              }
              uint64_t v71 = *((void *)v27 + 4);
              uint64_t v70 = *((void *)v27 + 5);
              BOOL v80 = __OFSUB__(v70, v71);
              uint64_t v72 = v70 - v71;
              char v73 = v80;
            }
            if (v73) {
              goto LABEL_142;
            }
            unint64_t v81 = v66 - 2;
            uint64_t v87 = &v67[16 * v66 - 32];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v90 = __OFSUB__(v88, v89);
            uint64_t v91 = v88 - v89;
            char v92 = v90;
            if (v90) {
              goto LABEL_144;
            }
            uint64_t v93 = &v67[16 * v69];
            uint64_t v95 = *(void *)v93;
            uint64_t v94 = *((void *)v93 + 1);
            BOOL v80 = __OFSUB__(v94, v95);
            uint64_t v96 = v94 - v95;
            if (v80) {
              goto LABEL_146;
            }
            if (__OFADD__(v91, v96)) {
              goto LABEL_148;
            }
            if (v91 + v96 >= v72)
            {
              BOOL v97 = v72 < v96;
LABEL_101:
              if (v97) {
                unint64_t v69 = v81;
              }
              goto LABEL_103;
            }
LABEL_95:
            if (v92) {
              goto LABEL_145;
            }
            long long v100 = &v67[16 * v69];
            uint64_t v102 = *(void *)v100;
            uint64_t v101 = *((void *)v100 + 1);
            BOOL v80 = __OFSUB__(v101, v102);
            uint64_t v103 = v101 - v102;
            if (v80) {
              goto LABEL_147;
            }
            if (v103 < v91) {
              goto LABEL_112;
            }
LABEL_103:
            unint64_t v108 = v69 - 1;
            if (v69 - 1 >= v66)
            {
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
LABEL_147:
              __break(1u);
LABEL_148:
              __break(1u);
LABEL_149:
              __break(1u);
              goto LABEL_150;
            }
            if (!*v148) {
              goto LABEL_163;
            }
            uint64_t v109 = v26;
            uint64_t v110 = v27;
            uint64_t v111 = &v67[16 * v108];
            uint64_t v112 = v67;
            uint64_t v113 = *(void *)v111;
            uint64_t v114 = v112;
            uint64_t v115 = &v112[16 * v69];
            uint64_t v116 = *((void *)v115 + 1);
            uint64_t v117 = v141;
            sub_2519A2850();
            uint64_t v141 = v117;
            if (v117)
            {
              uint64_t v22 = v131;
LABEL_118:
              swift_bridgeObjectRelease();
              if (v22 >= -1)
              {
LABEL_133:
                *(void *)(v130 + 16) = 0;
                swift_bridgeObjectRelease();
                goto LABEL_134;
              }
LABEL_157:
              __break(1u);
LABEL_158:
              __break(1u);
LABEL_159:
              __break(1u);
              goto LABEL_160;
            }
            if (v116 < v113) {
              goto LABEL_136;
            }
            if (v69 > *((void *)v110 + 2)) {
              goto LABEL_137;
            }
            *(void *)uint64_t v111 = v113;
            *(void *)&v114[16 * v108 + 8] = v116;
            unint64_t v118 = *((void *)v110 + 2);
            if (v69 >= v118) {
              goto LABEL_138;
            }
            uint64_t v67 = v114;
            uint64_t v27 = v110;
            unint64_t v66 = v118 - 1;
            memmove(v115, v115 + 16, 16 * (v118 - 1 - v69));
            *((void *)v110 + 2) = v118 - 1;
            uint64_t v26 = v109;
            if (v118 <= 2) {
              goto LABEL_112;
            }
          }
        }
        unint64_t v66 = 1;
LABEL_112:
        uint64_t v28 = v148[1];
        uint64_t v22 = v131;
        if (v26 >= v28) {
          goto LABEL_121;
        }
      }
    }
    uint64_t v27 = (char *)MEMORY[0x263F8EE78];
    unint64_t v66 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_121:
    if (v66 >= 2)
    {
      uint64_t v119 = *v148;
      while (1)
      {
        unint64_t v120 = v66 - 2;
        if (v66 < 2) {
          break;
        }
        if (!v119) {
          goto LABEL_165;
        }
        uint64_t v121 = v27;
        uint64_t v122 = *(void *)&v27[16 * v120 + 32];
        uint64_t v123 = *(void *)&v27[16 * v66 + 24];
        uint64_t v124 = v141;
        sub_2519A2850();
        uint64_t v141 = v124;
        if (v124) {
          goto LABEL_118;
        }
        if (v123 < v122) {
          goto LABEL_151;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v121 = sub_2519A2DC8((uint64_t)v121);
        }
        if (v120 >= *((void *)v121 + 2)) {
          goto LABEL_152;
        }
        char v125 = &v121[16 * v120 + 32];
        *(void *)char v125 = v122;
        *((void *)v125 + 1) = v123;
        unint64_t v126 = *((void *)v121 + 2);
        if (v66 > v126) {
          goto LABEL_153;
        }
        uint64_t v27 = v121;
        memmove(&v121[16 * v66 + 16], &v121[16 * v66 + 32], 16 * (v126 - v66));
        *((void *)v121 + 2) = v126 - 1;
        unint64_t v66 = v126 - 1;
        if (v126 <= 2) {
          goto LABEL_132;
        }
      }
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
      goto LABEL_157;
    }
LABEL_132:
    swift_bridgeObjectRelease();
    if (v22 >= -1) {
      goto LABEL_133;
    }
LABEL_161:
    __break(1u);
LABEL_162:
    __break(1u);
LABEL_163:
    __break(1u);
LABEL_164:
    __break(1u);
LABEL_165:
    __break(1u);
  }
}

void sub_2519A25B0()
{
  OUTLINED_FUNCTION_7_7();
  uint64_t v30 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v25 = v5;
  uint64_t v26 = type metadata accessor for DisambiguationOption(0);
  uint64_t v6 = MEMORY[0x270FA5388](v26);
  uint64_t v29 = (uint64_t)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (uint64_t *)((char *)&v23 - v9);
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (uint64_t *)((char *)&v23 - v12);
  uint64_t v28 = v2;
  uint64_t v24 = v4;
  if (v2 != v4)
  {
    uint64_t v14 = *(void *)(v11 + 72);
    uint64_t v31 = v14 * (v28 - 1);
    uint64_t v27 = v14;
    uint64_t v15 = v14 * v28;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v17 = v25;
      while (1)
      {
        uint64_t v18 = *v30;
        sub_2519A0AD4(v15 + v16 + *v30, (uint64_t)v13, (void (*)(void))type metadata accessor for DisambiguationOption);
        sub_2519A0AD4(v31 + v16 + v18, (uint64_t)v10, (void (*)(void))type metadata accessor for DisambiguationOption);
        if (*v13 == *v10 && v13[1] == v10[1]) {
          break;
        }
        char v20 = sub_2519CA500();
        sub_2519A0B28((uint64_t)v10, (void (*)(void))type metadata accessor for DisambiguationOption);
        sub_2519A0B28((uint64_t)v13, (void (*)(void))type metadata accessor for DisambiguationOption);
        if (v20)
        {
          uint64_t v21 = *v30;
          if (!*v30)
          {
            __break(1u);
            return;
          }
          uint64_t v22 = v21 + v31 + v16;
          sub_2519A8788(v21 + v15 + v16, v29);
          swift_arrayInitWithTakeFrontToBack();
          sub_2519A8788(v29, v22);
          v16 -= v27;
          if (v28 != ++v17) {
            continue;
          }
        }
        goto LABEL_13;
      }
      sub_2519A0B28((uint64_t)v10, (void (*)(void))type metadata accessor for DisambiguationOption);
      sub_2519A0B28((uint64_t)v13, (void (*)(void))type metadata accessor for DisambiguationOption);
LABEL_13:
      v31 += v27;
      v15 += v27;
      if (++v28 != v24) {
        continue;
      }
      break;
    }
  }
  OUTLINED_FUNCTION_8_9();
}

void sub_2519A2850()
{
  OUTLINED_FUNCTION_7_7();
  unint64_t v1 = v0;
  unint64_t v3 = v2;
  unint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v52 = type metadata accessor for DisambiguationOption(0);
  uint64_t v8 = MEMORY[0x270FA5388](v52);
  uint64_t v55 = (void *)((char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (void *)((char *)v50 - v11);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (void *)((char *)v50 - v14);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (void *)((char *)v50 - v16);
  uint64_t v19 = *(void *)(v18 + 72);
  if (!v19)
  {
    __break(1u);
LABEL_89:
    __break(1u);
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  int64_t v20 = v5 - v7;
  if (v5 - v7 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_89;
  }
  int64_t v22 = v3 - v5;
  if (v3 - v5 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_90;
  }
  unint64_t v53 = v3;
  uint64_t v24 = v20 / v19;
  uint64_t v25 = v22 / v19;
  if (v20 / v19 >= v22 / v19)
  {
    sub_2519A17A0(v5, v22 / v19, v1);
    unint64_t v27 = v1 + v25 * v19;
    if (v25 * v19 < 1 || v7 >= v5)
    {
      uint64_t v29 = v19;
    }
    else
    {
      v50[0] = v19;
      uint64_t v54 = -v19;
      unint64_t v51 = v1;
      unint64_t v38 = v53;
      do
      {
        unint64_t v39 = v38;
        unint64_t v53 = v27;
        uint64_t v40 = v54;
        unint64_t v41 = v27 + v54;
        sub_2519A0AD4(v27 + v54, (uint64_t)v12, (void (*)(void))type metadata accessor for DisambiguationOption);
        unint64_t v42 = v5 + v40;
        sub_2519A0AD4(v5 + v40, (uint64_t)v55, (void (*)(void))type metadata accessor for DisambiguationOption);
        if (*v12 == *v55 && v12[1] == v55[1]) {
          char v44 = 0;
        }
        else {
          char v44 = sub_2519CA500();
        }
        v38 += v54;
        sub_2519A0B28((uint64_t)v55, (void (*)(void))type metadata accessor for DisambiguationOption);
        sub_2519A0B28((uint64_t)v12, (void (*)(void))type metadata accessor for DisambiguationOption);
        if (v44)
        {
          BOOL v45 = v39 < v5 || v38 >= v5;
          unint64_t v1 = v51;
          if (v45)
          {
            OUTLINED_FUNCTION_17_0();
          }
          else if (v39 != v5)
          {
            OUTLINED_FUNCTION_16_2();
          }
          unint64_t v5 = v42;
          unint64_t v27 = v53;
        }
        else
        {
          BOOL v46 = v39 < v53 || v38 >= v53;
          unint64_t v1 = v51;
          if (v46)
          {
            OUTLINED_FUNCTION_17_0();
          }
          else if (v39 != v53)
          {
            OUTLINED_FUNCTION_16_2();
          }
          unint64_t v27 = v41;
        }
      }
      while (v27 > v1 && v5 > v7);
      uint64_t v29 = v50[0];
    }
  }
  else
  {
    sub_2519A17A0(v7, v20 / v19, v1);
    uint64_t v26 = v24 * v19;
    unint64_t v27 = v1 + v24 * v19;
    BOOL v28 = v26 < 1 || v5 >= v53;
    uint64_t v29 = v19;
    if (!v28)
    {
      while (1)
      {
        sub_2519A0AD4(v5, (uint64_t)v17, (void (*)(void))type metadata accessor for DisambiguationOption);
        sub_2519A0AD4(v1, (uint64_t)v15, (void (*)(void))type metadata accessor for DisambiguationOption);
        if (*v17 == *v15 && v17[1] == v15[1]) {
          break;
        }
        char v31 = sub_2519CA500();
        sub_2519A0B28((uint64_t)v15, (void (*)(void))type metadata accessor for DisambiguationOption);
        sub_2519A0B28((uint64_t)v17, (void (*)(void))type metadata accessor for DisambiguationOption);
        if ((v31 & 1) == 0) {
          goto LABEL_29;
        }
        unint64_t v32 = v5 + v29;
        if (v7 >= v5 && v7 < v32)
        {
          unint64_t v35 = v53;
          if (v7 != v5) {
            OUTLINED_FUNCTION_16_2();
          }
          goto LABEL_39;
        }
        OUTLINED_FUNCTION_17_0();
LABEL_38:
        unint64_t v35 = v53;
LABEL_39:
        v7 += v29;
        BOOL v36 = v1 >= v27 || v32 >= v35;
        unint64_t v5 = v32;
        if (v36) {
          goto LABEL_16;
        }
      }
      sub_2519A0B28((uint64_t)v15, (void (*)(void))type metadata accessor for DisambiguationOption);
      sub_2519A0B28((uint64_t)v17, (void (*)(void))type metadata accessor for DisambiguationOption);
LABEL_29:
      if (v7 < v1 || v7 >= v1 + v29)
      {
        OUTLINED_FUNCTION_17_0();
      }
      else if (v7 != v1)
      {
        OUTLINED_FUNCTION_16_2();
      }
      unint64_t v32 = v5;
      v1 += v29;
      goto LABEL_38;
    }
LABEL_16:
    unint64_t v5 = v7;
  }
  int64_t v48 = v27 - v1;
  if (v29 != -1 || v48 != 0x8000000000000000)
  {
    sub_2519A17A0(v1, v48 / v29, v5);
    OUTLINED_FUNCTION_8_9();
    return;
  }
LABEL_91:
  __break(1u);
}

char *sub_2519A2CD0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B944A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2519A2DC8(uint64_t a1)
{
  return sub_2519A2CD0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_2519A2DDC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2519A84F4(a1, a2, a3, *v3);
  *unint64_t v3 = (uint64_t)result;
  return result;
}

uint64_t sub_2519A2DFC()
{
  return sub_25199FEA0(&qword_269B94438, (void (*)(uint64_t))type metadata accessor for DisambiguationSnippetModel);
}

uint64_t sub_2519A2E44()
{
  return sub_25199FEA0(&qword_269B94440, (void (*)(uint64_t))type metadata accessor for DisambiguationSnippetModel);
}

uint64_t sub_2519A2E8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DisambiguationOption.action.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2519A2EBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DisambiguationSnippetModel.displayText.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationOption(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    size_t v11 = (char *)a2 + v9;
    uint64_t v12 = (int *)type metadata accessor for IconConfiguration();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, (uint64_t)v12))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v10, v11, v15);
      uint64_t v16 = v12[5];
      uint64_t v17 = &v10[v16];
      uint64_t v18 = &v11[v16];
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      int64_t v48 = *(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 16);
      v48(v17, v18, v47);
      uint64_t v19 = v12[6];
      int64_t v20 = &v10[v19];
      uint64_t v21 = &v11[v19];
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
      uint64_t v23 = v12[7];
      uint64_t v24 = &v10[v23];
      uint64_t v25 = &v11[v23];
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      unint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16);
      v27(v24, v25, v26);
      v27(&v10[v12[8]], &v11[v12[8]], v26);
      uint64_t v28 = v12[9];
      uint64_t v29 = &v10[v28];
      uint64_t v30 = &v11[v28];
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
      v48(&v10[v12[10]], &v11[v12[10]], v47);
      uint64_t v32 = v12[11];
      uint64_t v33 = &v10[v32];
      uint64_t v34 = &v11[v32];
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      v48(&v10[v12[12]], &v11[v12[12]], v47);
      v48(&v10[v12[13]], &v11[v12[13]], v47);
      uint64_t v36 = v12[14];
      uint64_t v37 = &v10[v36];
      unint64_t v38 = &v11[v36];
      uint64_t v39 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v38, 1, v39))
      {
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v37, v38, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16))(v37, v38, v41);
        __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v39);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, (uint64_t)v12);
    }
    uint64_t v42 = *(int *)(a3 + 28);
    BOOL v43 = (char *)v4 + v42;
    char v44 = (char *)a2 + v42;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
  }
  return v4;
}

uint64_t destroy for DisambiguationOption(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  int v5 = (int *)type metadata accessor for IconConfiguration();
  if (!__swift_getEnumTagSinglePayload(v4, 1, (uint64_t)v5))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    uint64_t v7 = v4 + v5[5];
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    v25(v7, v8);
    uint64_t v9 = v4 + v5[6];
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
    uint64_t v11 = v4 + v5[7];
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
    v13(v11, v12);
    v13(v4 + v5[8], v12);
    uint64_t v14 = v4 + v5[9];
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
    v25(v4 + v5[10], v8);
    uint64_t v16 = v4 + v5[11];
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    v25(v4 + v5[12], v8);
    v25(v4 + v5[13], v8);
    uint64_t v18 = v4 + v5[14];
    uint64_t v19 = type metadata accessor for DirectInvocationConfig();
    if (!__swift_getEnumTagSinglePayload(v18, 1, v19))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v18, v20);
    }
  }
  uint64_t v21 = a1 + *(int *)(a2 + 28);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8);

  return v23(v21, v22);
}

void *initializeWithCopy for DisambiguationOption(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = (int *)type metadata accessor for IconConfiguration();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, (uint64_t)v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v47 = v3;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v9, v10, v13);
    uint64_t v14 = v11[5];
    uint64_t v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    BOOL v46 = *(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16);
    v46(v15, v16, v45);
    uint64_t v17 = v11[6];
    uint64_t v18 = &v9[v17];
    uint64_t v19 = &v10[v17];
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = v11[7];
    uint64_t v22 = &v9[v21];
    uint64_t v23 = &v10[v21];
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
    v25(v22, v23, v24);
    v25(&v9[v11[8]], &v10[v11[8]], v24);
    uint64_t v26 = v11[9];
    unint64_t v27 = &v9[v26];
    uint64_t v28 = &v10[v26];
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    v46(&v9[v11[10]], &v10[v11[10]], v45);
    uint64_t v30 = v11[11];
    uint64_t v31 = &v9[v30];
    uint64_t v32 = &v10[v30];
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
    v46(&v9[v11[12]], &v10[v11[12]], v45);
    v46(&v9[v11[13]], &v10[v11[13]], v45);
    uint64_t v34 = v11[14];
    uint64_t v35 = &v9[v34];
    uint64_t v36 = &v10[v34];
    uint64_t v37 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16))(v35, v36, v39);
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, (uint64_t)v11);
    uint64_t v3 = v47;
  }
  uint64_t v40 = *(int *)(v3 + 28);
  uint64_t v41 = (char *)a1 + v40;
  uint64_t v42 = (char *)a2 + v40;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
  return a1;
}

void *assignWithCopy for DisambiguationOption(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (uint64_t)a1 + v6;
  uint64_t v8 = (uint64_t)a2 + v6;
  uint64_t v9 = (int *)type metadata accessor for IconConfiguration();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v7, 1, (uint64_t)v9);
  int v11 = __swift_getEnumTagSinglePayload(v8, 1, (uint64_t)v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      uint64_t v82 = a3;
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v7, v8, v12);
      uint64_t v13 = v9[5];
      uint64_t v14 = v7 + v13;
      uint64_t v15 = v8 + v13;
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      BOOL v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 16);
      v80(v14, v15, v78);
      uint64_t v16 = v9[6];
      uint64_t v17 = v7 + v16;
      uint64_t v18 = v8 + v16;
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      uint64_t v20 = v9[7];
      uint64_t v21 = v7 + v20;
      uint64_t v22 = v8 + v20;
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
      v24(v21, v22, v23);
      v24(v7 + v9[8], v8 + v9[8], v23);
      uint64_t v25 = v9[9];
      uint64_t v26 = v7 + v25;
      uint64_t v27 = v8 + v25;
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
      v80(v7 + v9[10], v8 + v9[10], v78);
      uint64_t v29 = v9[11];
      uint64_t v30 = v7 + v29;
      uint64_t v31 = v8 + v29;
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
      v80(v7 + v9[12], v8 + v9[12], v78);
      v80(v7 + v9[13], v8 + v9[13], v78);
      uint64_t v33 = v9[14];
      uint64_t v34 = (void *)(v7 + v33);
      uint64_t v35 = (const void *)(v8 + v33);
      uint64_t v36 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36))
      {
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v71 - 8) + 16))(v34, v35, v71);
        __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
      }
      a3 = v82;
      uint64_t v69 = v7;
      uint64_t v70 = (uint64_t)v9;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v11)
  {
    sub_2519A0B28(v7, (void (*)(void))type metadata accessor for IconConfiguration);
LABEL_7:
    size_t v38 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
    uint64_t v39 = (void *)v7;
    uint64_t v40 = (const void *)v8;
    goto LABEL_8;
  }
  uint64_t v83 = a3;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 24))(v7, v8, v41);
  uint64_t v42 = v9[5];
  uint64_t v43 = v7 + v42;
  uint64_t v44 = v8 + v42;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  unint64_t v81 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 24);
  v81(v43, v44, v79);
  uint64_t v45 = v9[6];
  uint64_t v46 = v7 + v45;
  uint64_t v47 = v8 + v45;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 24))(v46, v47, v48);
  uint64_t v49 = v9[7];
  uint64_t v50 = v7 + v49;
  uint64_t v51 = v8 + v49;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  unint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 24);
  v53(v50, v51, v52);
  v53(v7 + v9[8], v8 + v9[8], v52);
  uint64_t v54 = v9[9];
  uint64_t v55 = v7 + v54;
  uint64_t v56 = v8 + v54;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 24))(v55, v56, v57);
  v81(v7 + v9[10], v8 + v9[10], v79);
  uint64_t v58 = v9[11];
  uint64_t v59 = v7 + v58;
  uint64_t v60 = v8 + v58;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 24))(v59, v60, v61);
  v81(v7 + v9[12], v8 + v9[12], v79);
  v81(v7 + v9[13], v8 + v9[13], v79);
  uint64_t v62 = v9[14];
  uint64_t v63 = v7 + v62;
  uint64_t v64 = v8 + v62;
  uint64_t v65 = type metadata accessor for DirectInvocationConfig();
  int v66 = __swift_getEnumTagSinglePayload(v63, 1, v65);
  int v67 = __swift_getEnumTagSinglePayload(v64, 1, v65);
  if (v66)
  {
    a3 = v83;
    if (!v67)
    {
      uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 16))(v63, v64, v68);
      uint64_t v69 = v63;
      uint64_t v70 = v65;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v69, 0, 1, v70);
      goto LABEL_15;
    }
  }
  else
  {
    a3 = v83;
    if (!v67)
    {
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 24))(v63, v64, v77);
      goto LABEL_15;
    }
    sub_2519A0B28(v63, (void (*)(void))type metadata accessor for DirectInvocationConfig);
  }
  size_t v38 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94030) - 8) + 64);
  uint64_t v39 = (void *)v63;
  uint64_t v40 = (const void *)v64;
LABEL_8:
  memcpy(v39, v40, v38);
LABEL_15:
  uint64_t v72 = *(int *)(a3 + 28);
  char v73 = (char *)a1 + v72;
  uint64_t v74 = (char *)a2 + v72;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 24))(v73, v74, v75);
  return a1;
}

_OWORD *initializeWithTake for DisambiguationOption(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, (uint64_t)v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v46 = v3;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v8, v9, v12);
    uint64_t v13 = v10[5];
    uint64_t v14 = &v8[v13];
    uint64_t v15 = &v9[v13];
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32);
    v45(v14, v15, v44);
    uint64_t v16 = v10[6];
    uint64_t v17 = &v8[v16];
    uint64_t v18 = &v9[v16];
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
    uint64_t v20 = v10[7];
    uint64_t v21 = &v8[v20];
    uint64_t v22 = &v9[v20];
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32);
    v24(v21, v22, v23);
    v24(&v8[v10[8]], &v9[v10[8]], v23);
    uint64_t v25 = v10[9];
    uint64_t v26 = &v8[v25];
    uint64_t v27 = &v9[v25];
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
    v45(&v8[v10[10]], &v9[v10[10]], v44);
    uint64_t v29 = v10[11];
    uint64_t v30 = &v8[v29];
    uint64_t v31 = &v9[v29];
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
    v45(&v8[v10[12]], &v9[v10[12]], v44);
    v45(&v8[v10[13]], &v9[v10[13]], v44);
    uint64_t v33 = v10[14];
    uint64_t v34 = &v8[v33];
    uint64_t v35 = &v9[v33];
    uint64_t v36 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36))
    {
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v34, v35, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, (uint64_t)v10);
    uint64_t v3 = v46;
  }
  uint64_t v39 = *(int *)(v3 + 28);
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
  return a1;
}

void *assignWithTake for DisambiguationOption(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (uint64_t)a1 + v8;
  uint64_t v10 = (uint64_t)a2 + v8;
  uint64_t v11 = (int *)type metadata accessor for IconConfiguration();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v11);
  int v13 = __swift_getEnumTagSinglePayload(v10, 1, (uint64_t)v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      uint64_t v84 = a3;
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v9, v10, v14);
      uint64_t v15 = v11[5];
      uint64_t v16 = v9 + v15;
      uint64_t v17 = v10 + v15;
      uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v82 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 32);
      v82(v16, v17, v80);
      uint64_t v18 = v11[6];
      uint64_t v19 = v9 + v18;
      uint64_t v20 = v10 + v18;
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
      uint64_t v22 = v11[7];
      uint64_t v23 = v9 + v22;
      uint64_t v24 = v10 + v22;
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 32);
      v26(v23, v24, v25);
      v26(v9 + v11[8], v10 + v11[8], v25);
      uint64_t v27 = v11[9];
      uint64_t v28 = v9 + v27;
      uint64_t v29 = v10 + v27;
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
      v82(v9 + v11[10], v10 + v11[10], v80);
      uint64_t v31 = v11[11];
      uint64_t v32 = v9 + v31;
      uint64_t v33 = v10 + v31;
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
      v82(v9 + v11[12], v10 + v11[12], v80);
      v82(v9 + v11[13], v10 + v11[13], v80);
      uint64_t v35 = v11[14];
      uint64_t v36 = (void *)(v9 + v35);
      uint64_t v37 = (const void *)(v10 + v35);
      uint64_t v38 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v73 - 8) + 32))(v36, v37, v73);
        __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
      }
      a3 = v84;
      uint64_t v71 = v9;
      uint64_t v72 = (uint64_t)v11;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  if (v13)
  {
    sub_2519A0B28(v9, (void (*)(void))type metadata accessor for IconConfiguration);
LABEL_7:
    size_t v40 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
    uint64_t v41 = (void *)v9;
    uint64_t v42 = (const void *)v10;
    goto LABEL_8;
  }
  uint64_t v85 = a3;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 40))(v9, v10, v43);
  uint64_t v44 = v11[5];
  uint64_t v45 = v9 + v44;
  uint64_t v46 = v10 + v44;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  uint64_t v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v81 - 8) + 40);
  v83(v45, v46, v81);
  uint64_t v47 = v11[6];
  uint64_t v48 = v9 + v47;
  uint64_t v49 = v10 + v47;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 40))(v48, v49, v50);
  uint64_t v51 = v11[7];
  uint64_t v52 = v9 + v51;
  uint64_t v53 = v10 + v51;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
  uint64_t v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 40);
  v55(v52, v53, v54);
  v55(v9 + v11[8], v10 + v11[8], v54);
  uint64_t v56 = v11[9];
  uint64_t v57 = v9 + v56;
  uint64_t v58 = v10 + v56;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 40))(v57, v58, v59);
  v83(v9 + v11[10], v10 + v11[10], v81);
  uint64_t v60 = v11[11];
  uint64_t v61 = v9 + v60;
  uint64_t v62 = v10 + v60;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v63 - 8) + 40))(v61, v62, v63);
  v83(v9 + v11[12], v10 + v11[12], v81);
  v83(v9 + v11[13], v10 + v11[13], v81);
  uint64_t v64 = v11[14];
  uint64_t v65 = v9 + v64;
  uint64_t v66 = v10 + v64;
  uint64_t v67 = type metadata accessor for DirectInvocationConfig();
  int v68 = __swift_getEnumTagSinglePayload(v65, 1, v67);
  int v69 = __swift_getEnumTagSinglePayload(v66, 1, v67);
  if (v68)
  {
    a3 = v85;
    if (!v69)
    {
      uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 32))(v65, v66, v70);
      uint64_t v71 = v65;
      uint64_t v72 = v67;
LABEL_14:
      __swift_storeEnumTagSinglePayload(v71, 0, 1, v72);
      goto LABEL_15;
    }
  }
  else
  {
    a3 = v85;
    if (!v69)
    {
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 40))(v65, v66, v79);
      goto LABEL_15;
    }
    sub_2519A0B28(v65, (void (*)(void))type metadata accessor for DirectInvocationConfig);
  }
  size_t v40 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94030) - 8) + 64);
  uint64_t v41 = (void *)v65;
  uint64_t v42 = (const void *)v66;
LABEL_8:
  memcpy(v41, v42, v40);
LABEL_15:
  uint64_t v74 = *(int *)(a3 + 28);
  uint64_t v75 = (char *)a1 + v74;
  uint64_t v76 = (char *)a2 + v74;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 40))(v75, v76, v77);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519A4EAC);
}

uint64_t sub_2519A4EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_25_0(*(void *)(a1 + 8));
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(int *)(a3 + 24);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    uint64_t v10 = *(int *)(a3 + 28);
  }

  return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
}

uint64_t storeEnumTagSinglePayload for DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519A4F68);
}

uint64_t sub_2519A4F68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 24);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      uint64_t v11 = *(int *)(a4 + 28);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_2519A5018()
{
  sub_2519A514C(319, &qword_269B94050, (uint64_t (*)(uint64_t))type metadata accessor for IconConfiguration, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F)
  {
    sub_2519A514C(319, (unint64_t *)&qword_269B94048, (uint64_t (*)(uint64_t))sub_2519869B8, MEMORY[0x263F76C68]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2519A514C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    unint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = type metadata accessor for DisambiguationOption(0);
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
      memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      uint64_t v15 = v11[1];
      *uint64_t v10 = *v11;
      v10[1] = v15;
      uint64_t v16 = v11[3];
      v10[2] = v11[2];
      v10[3] = v16;
      uint64_t v17 = *(int *)(v12 + 24);
      __dst = (char *)v10 + v17;
      uint64_t v55 = v12;
      uint64_t v18 = (char *)v11 + v17;
      uint64_t v19 = (int *)type metadata accessor for IconConfiguration();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
        memcpy(__dst, v18, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        v8((uint64_t *)__dst, (uint64_t *)v18, v7);
        uint64_t v21 = v19[5];
        uint64_t v22 = &__dst[v21];
        uint64_t v23 = &v18[v21];
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v53 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 16);
        v53(v22, v23, v52);
        uint64_t v24 = v19[6];
        uint64_t v25 = &__dst[v24];
        uint64_t v26 = &v18[v24];
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
        uint64_t v28 = v19[7];
        uint64_t v50 = &__dst[v28];
        uint64_t v29 = &v18[v28];
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
        v31(v50, v29, v30);
        v31(&__dst[v19[8]], &v18[v19[8]], v30);
        uint64_t v32 = v19[9];
        uint64_t v33 = &__dst[v32];
        uint64_t v34 = &v18[v32];
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
        v53(&__dst[v19[10]], &v18[v19[10]], v52);
        uint64_t v36 = v19[11];
        uint64_t v37 = &__dst[v36];
        uint64_t v51 = &v18[v36];
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v37, v51, v38);
        v53(&__dst[v19[12]], &v18[v19[12]], v52);
        v53(&__dst[v19[13]], &v18[v19[13]], v52);
        uint64_t v39 = v19[14];
        size_t v40 = &__dst[v39];
        uint64_t v41 = &v18[v39];
        uint64_t v42 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v42))
        {
          uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
          memcpy(v40, v41, *(void *)(*(void *)(v43 - 8) + 64));
        }
        else
        {
          uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16))(v40, v41, v44);
          __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v42);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, (uint64_t)v19);
      }
      uint64_t v45 = *(int *)(v55 + 28);
      uint64_t v46 = (char *)v10 + v45;
      uint64_t v47 = (char *)v11 + v45;
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v55);
    }
  }
  return a1;
}

uint64_t destroy for DisambiguationSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = type metadata accessor for DisambiguationOption(0);
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    uint64_t v10 = (int *)type metadata accessor for IconConfiguration();
    if (!__swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10))
    {
      v5(v9, v4);
      uint64_t v11 = v9 + v10[5];
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
      v28(v11, v12);
      uint64_t v13 = v9 + v10[6];
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
      uint64_t v15 = v9 + v10[7];
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8);
      v17(v15, v16);
      v17(v9 + v10[8], v16);
      uint64_t v18 = v9 + v10[9];
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
      v28(v9 + v10[10], v12);
      uint64_t v20 = v9 + v10[11];
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
      v28(v9 + v10[12], v12);
      v28(v9 + v10[13], v12);
      uint64_t v22 = v9 + v10[14];
      uint64_t v23 = type metadata accessor for DirectInvocationConfig();
      if (!__swift_getEnumTagSinglePayload(v22, 1, v23))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v22, v24);
      }
    }
    uint64_t v25 = v6 + *(int *)(v7 + 28);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8);
    return v27(v25, v26);
  }
  return result;
}

uint64_t initializeWithCopy for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for DisambiguationOption(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    uint64_t v13 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v13;
    uint64_t v14 = v10[3];
    v9[2] = v10[2];
    v9[3] = v14;
    uint64_t v15 = *(int *)(v11 + 24);
    __dst = (char *)v9 + v15;
    uint64_t v53 = v11;
    uint64_t v16 = (char *)v10 + v15;
    uint64_t v17 = (int *)type metadata accessor for IconConfiguration();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, (uint64_t)v17))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(__dst, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      v7((uint64_t)__dst, (uint64_t)v16, v6);
      uint64_t v19 = v17[5];
      uint64_t v20 = &__dst[v19];
      uint64_t v21 = &v16[v19];
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16);
      v51(v20, v21, v50);
      uint64_t v22 = v17[6];
      uint64_t v23 = &__dst[v22];
      uint64_t v24 = &v16[v22];
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
      uint64_t v26 = v17[7];
      uint64_t v48 = &__dst[v26];
      uint64_t v27 = &v16[v26];
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16);
      v29(v48, v27, v28);
      v29(&__dst[v17[8]], &v16[v17[8]], v28);
      uint64_t v30 = v17[9];
      uint64_t v31 = &__dst[v30];
      uint64_t v32 = &v16[v30];
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
      v51(&__dst[v17[10]], &v16[v17[10]], v50);
      uint64_t v34 = v17[11];
      uint64_t v35 = &__dst[v34];
      uint64_t v49 = &v16[v34];
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v35, v49, v36);
      v51(&__dst[v17[12]], &v16[v17[12]], v50);
      v51(&__dst[v17[13]], &v16[v17[13]], v50);
      uint64_t v37 = v17[14];
      uint64_t v38 = &__dst[v37];
      uint64_t v39 = &v16[v37];
      uint64_t v40 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v40))
      {
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v38, v39, *(void *)(*(void *)(v41 - 8) + 64));
      }
      else
      {
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v38, v39, v42);
        __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v40);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, (uint64_t)v17);
    }
    uint64_t v43 = *(int *)(v53 + 28);
    uint64_t v44 = (char *)v9 + v43;
    uint64_t v45 = (char *)v10 + v43;
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v53);
  }
  return a1;
}

uint64_t assignWithCopy for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for DisambiguationOption(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    if (v14)
    {
      sub_2519A0B28((uint64_t)v10, (void (*)(void))type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    *uint64_t v10 = *v11;
    v10[1] = v11[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v10[2] = v11[2];
    v10[3] = v11[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v127 = v12;
    uint64_t v21 = *(int *)(v12 + 24);
    uint64_t v22 = (uint64_t)v10 + v21;
    uint64_t v23 = (uint64_t)v11 + v21;
    uint64_t v24 = (int *)type metadata accessor for IconConfiguration();
    uint64_t v125 = v22;
    LODWORD(v22) = __swift_getEnumTagSinglePayload(v22, 1, (uint64_t)v24);
    int v25 = __swift_getEnumTagSinglePayload(v23, 1, (uint64_t)v24);
    if (v22)
    {
      if (v25)
      {
        size_t v26 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
        uint64_t v27 = (void *)v125;
LABEL_15:
        uint64_t v51 = (const void *)v23;
LABEL_16:
        memcpy(v27, v51, v26);
LABEL_28:
        uint64_t v107 = *(int *)(v127 + 28);
        unint64_t v108 = (char *)v10 + v107;
        uint64_t v109 = (char *)v11 + v107;
        uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v110 - 8) + 24))(v108, v109, v110);
        return a1;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v125, v23, v6);
      uint64_t v52 = v24[5];
      uint64_t v53 = v125 + v52;
      uint64_t v54 = v23 + v52;
      uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v122 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v119 - 8) + 16);
      v122(v53, v54, v119);
      uint64_t v55 = v24[6];
      uint64_t v56 = v125 + v55;
      uint64_t v57 = v23 + v55;
      uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 16))(v56, v57, v58);
      uint64_t v59 = v24[7];
      uint64_t v113 = v125 + v59;
      uint64_t v60 = v23 + v59;
      uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 16);
      v62(v113, v60, v61);
      v62(v125 + v24[8], v23 + v24[8], v61);
      uint64_t v63 = v24[9];
      uint64_t v64 = v125 + v63;
      uint64_t v65 = v23 + v63;
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 16))(v64, v65, v66);
      v122(v125 + v24[10], v23 + v24[10], v119);
      uint64_t v67 = v24[11];
      uint64_t v68 = v125 + v67;
      uint64_t v114 = v23 + v67;
      uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 16))(v68, v114, v69);
      v122(v125 + v24[12], v23 + v24[12], v119);
      v122(v125 + v24[13], v23 + v24[13], v119);
      uint64_t v70 = v24[14];
      uint64_t v71 = (void *)(v125 + v70);
      uint64_t v72 = (const void *)(v23 + v70);
      uint64_t v73 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v72, 1, v73))
      {
        uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v71, v72, *(void *)(*(void *)(v74 - 8) + 64));
      }
      else
      {
        uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v106 - 8) + 16))(v71, v72, v106);
        __swift_storeEnumTagSinglePayload((uint64_t)v71, 0, 1, v73);
      }
      uint64_t v104 = v125;
      uint64_t v105 = (uint64_t)v24;
LABEL_27:
      __swift_storeEnumTagSinglePayload(v104, 0, 1, v105);
      goto LABEL_28;
    }
    if (v25)
    {
      sub_2519A0B28(v125, (void (*)(void))type metadata accessor for IconConfiguration);
      size_t v26 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
      uint64_t v27 = (void *)v125;
      goto LABEL_15;
    }
    v8(v125, v23, v6);
    uint64_t v80 = v24[5];
    uint64_t v81 = v125 + v80;
    uint64_t v82 = v23 + v80;
    uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v123 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v120 - 8) + 24);
    v123(v81, v82, v120);
    uint64_t v83 = v24[6];
    uint64_t v84 = v125 + v83;
    uint64_t v85 = v23 + v83;
    uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 24))(v84, v85, v86);
    uint64_t v87 = v24[7];
    uint64_t v115 = v125 + v87;
    uint64_t v88 = v23 + v87;
    uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    BOOL v90 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 24);
    v90(v115, v88, v89);
    v90(v125 + v24[8], v23 + v24[8], v89);
    uint64_t v91 = v24[9];
    uint64_t v92 = v125 + v91;
    uint64_t v93 = v23 + v91;
    uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 24))(v92, v93, v94);
    v123(v125 + v24[10], v23 + v24[10], v120);
    uint64_t v95 = v24[11];
    uint64_t v96 = v125 + v95;
    uint64_t v116 = v23 + v95;
    uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 24))(v96, v116, v97);
    v123(v125 + v24[12], v23 + v24[12], v120);
    v123(v125 + v24[13], v23 + v24[13], v120);
    uint64_t v98 = v24[14];
    uint64_t v99 = v125 + v98;
    uint64_t v100 = v23 + v98;
    uint64_t v101 = type metadata accessor for DirectInvocationConfig();
    LODWORD(v96) = __swift_getEnumTagSinglePayload(v99, 1, v101);
    int v102 = __swift_getEnumTagSinglePayload(v100, 1, v101);
    if (v96)
    {
      if (!v102)
      {
        uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v103 - 8) + 16))(v99, v100, v103);
        uint64_t v104 = v99;
        uint64_t v105 = v101;
        goto LABEL_27;
      }
    }
    else
    {
      if (!v102)
      {
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v112 - 8) + 24))(v99, v100, v112);
        goto LABEL_28;
      }
      sub_2519A0B28(v99, (void (*)(void))type metadata accessor for DirectInvocationConfig);
    }
    size_t v26 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94030) - 8) + 64);
    uint64_t v27 = (void *)v99;
    uint64_t v51 = (const void *)v100;
    goto LABEL_16;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  *uint64_t v10 = *v11;
  v10[1] = v11[1];
  v10[2] = v11[2];
  v10[3] = v11[3];
  uint64_t v126 = v12;
  uint64_t v15 = *(int *)(v12 + 24);
  uint64_t v16 = (char *)v10 + v15;
  uint64_t v17 = (char *)v11 + v15;
  uint64_t v18 = (int *)type metadata accessor for IconConfiguration();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v18))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v16, v17, v6);
    uint64_t v28 = v18[5];
    uint64_t v29 = &v16[v28];
    uint64_t v30 = &v17[v28];
    uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v124 = *(void (**)(char *, char *, uint64_t))(*(void *)(v121 - 8) + 16);
    v124(v29, v30, v121);
    uint64_t v31 = v18[6];
    uint64_t v32 = &v16[v31];
    uint64_t v33 = &v17[v31];
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
    uint64_t v35 = v18[7];
    uint64_t v117 = &v16[v35];
    uint64_t v36 = &v17[v35];
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
    v38(v117, v36, v37);
    v38(&v16[v18[8]], &v17[v18[8]], v37);
    uint64_t v39 = v18[9];
    uint64_t v40 = &v16[v39];
    uint64_t v41 = &v17[v39];
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    v124(&v16[v18[10]], &v17[v18[10]], v121);
    uint64_t v43 = v18[11];
    unint64_t v118 = &v16[v43];
    uint64_t v44 = &v17[v43];
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16))(v118, v44, v45);
    v124(&v16[v18[12]], &v17[v18[12]], v121);
    v124(&v16[v18[13]], &v17[v18[13]], v121);
    uint64_t v46 = v18[14];
    uint64_t v47 = &v16[v46];
    uint64_t v48 = &v17[v46];
    uint64_t v49 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v48, 1, v49))
    {
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v47, v48, *(void *)(*(void *)(v50 - 8) + 64));
    }
    else
    {
      uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16))(v47, v48, v75);
      __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v49);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, (uint64_t)v18);
  }
  uint64_t v76 = *(int *)(v126 + 28);
  uint64_t v77 = (char *)v10 + v76;
  uint64_t v78 = (char *)v11 + v76;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 16))(v77, v78, v79);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v126);
  return a1;
}

uint64_t initializeWithTake for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v9 = (_OWORD *)(a1 + v8);
  uint64_t v10 = (_OWORD *)(a2 + v8);
  uint64_t v11 = type metadata accessor for DisambiguationOption(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    long long v13 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v13;
    uint64_t v14 = *(int *)(v11 + 24);
    uint64_t v15 = (char *)v9 + v14;
    uint64_t v16 = (char *)v10 + v14;
    uint64_t v17 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, (uint64_t)v17))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v15, (uint64_t)v16, v6);
      uint64_t v19 = v17[5];
      uint64_t v20 = &v15[v19];
      uint64_t v21 = &v16[v19];
      uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32);
      v51(v20, v21, v50);
      uint64_t v22 = v17[6];
      uint64_t v23 = &v15[v22];
      uint64_t v24 = &v16[v22];
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
      uint64_t v26 = v17[7];
      uint64_t v46 = &v16[v26];
      uint64_t v48 = &v15[v26];
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32);
      v28(v48, v46, v27);
      v28(&v15[v17[8]], &v16[v17[8]], v27);
      uint64_t v29 = v17[9];
      uint64_t v30 = &v15[v29];
      uint64_t v31 = &v16[v29];
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
      v51(&v15[v17[10]], &v16[v17[10]], v50);
      uint64_t v33 = v17[11];
      uint64_t v47 = &v16[v33];
      uint64_t v49 = &v15[v33];
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v49, v47, v34);
      v51(&v15[v17[12]], &v16[v17[12]], v50);
      v51(&v15[v17[13]], &v16[v17[13]], v50);
      uint64_t v35 = v17[14];
      uint64_t v36 = &v15[v35];
      uint64_t v37 = &v16[v35];
      uint64_t v38 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v36, v37, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32))(v36, v37, v40);
        __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, (uint64_t)v17);
    }
    uint64_t v41 = *(int *)(v11 + 28);
    uint64_t v42 = (char *)v9 + v41;
    uint64_t v43 = (char *)v10 + v41;
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32))(v42, v43, v44);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

uint64_t assignWithTake for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for DisambiguationOption(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  int v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (!EnumTagSinglePayload)
  {
    if (v14)
    {
      sub_2519A0B28((uint64_t)v10, (void (*)(void))type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    uint64_t v22 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v22;
    swift_bridgeObjectRelease();
    uint64_t v23 = v11[3];
    v10[2] = v11[2];
    v10[3] = v23;
    swift_bridgeObjectRelease();
    uint64_t v24 = *(int *)(v12 + 24);
    uint64_t v25 = (uint64_t)v10 + v24;
    uint64_t v129 = v11;
    uint64_t v26 = (char *)v11 + v24;
    uint64_t v27 = (int *)type metadata accessor for IconConfiguration();
    uint64_t v132 = v25;
    LODWORD(v25) = __swift_getEnumTagSinglePayload(v25, 1, (uint64_t)v27);
    __src = v26;
    int v28 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, (uint64_t)v27);
    if (v25)
    {
      if (v28)
      {
        size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
        uint64_t v30 = (void *)v132;
LABEL_15:
        memcpy(v30, v26, v29);
        uint64_t v54 = v129;
LABEL_30:
        uint64_t v112 = *(int *)(v12 + 28);
        uint64_t v113 = (char *)v10 + v112;
        uint64_t v114 = (uint64_t)v54 + v112;
        uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v115 - 8) + 40))(v113, v114, v115);
        return a1;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v132, v26, v6);
      uint64_t v55 = v27;
      uint64_t v56 = v27[5];
      uint64_t v57 = v132 + v56;
      uint64_t v58 = &__src[v56];
      uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v124 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v122 - 8) + 32);
      v124(v57, v58, v122);
      uint64_t v59 = v27[6];
      uint64_t v60 = v132 + v59;
      uint64_t v61 = &__src[v59];
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v62 - 8) + 32))(v60, v61, v62);
      uint64_t v63 = v27[7];
      uint64_t v118 = v132 + v63;
      uint64_t v64 = &__src[v63];
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v66 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v65 - 8) + 32);
      v66(v118, v64, v65);
      v66(v132 + v55[8], &__src[v55[8]], v65);
      uint64_t v67 = v27[9];
      uint64_t v68 = v132 + v67;
      uint64_t v69 = &__src[v67];
      uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v70 - 8) + 32))(v68, v69, v70);
      v124(v132 + v55[10], &__src[v55[10]], v122);
      uint64_t v71 = v27[11];
      uint64_t v72 = v132 + v71;
      uint64_t v119 = &__src[v71];
      uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v73 - 8) + 32))(v72, v119, v73);
      v124(v132 + v55[12], &__src[v55[12]], v122);
      v124(v132 + v55[13], &__src[v55[13]], v122);
      uint64_t v74 = v27[14];
      uint64_t v75 = (void *)(v132 + v74);
      uint64_t v76 = &__src[v74];
      uint64_t v77 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v76, 1, v77))
      {
        uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v75, v76, *(void *)(*(void *)(v78 - 8) + 64));
      }
      else
      {
        uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v110 - 8) + 32))(v75, v76, v110);
        __swift_storeEnumTagSinglePayload((uint64_t)v75, 0, 1, v77);
      }
      uint64_t v109 = (uint64_t)v27;
      uint64_t v54 = v129;
      uint64_t v108 = v132;
LABEL_26:
      __swift_storeEnumTagSinglePayload(v108, 0, 1, v109);
      goto LABEL_30;
    }
    if (v28)
    {
      sub_2519A0B28(v132, (void (*)(void))type metadata accessor for IconConfiguration);
      size_t v29 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
      uint64_t v30 = (void *)v132;
      goto LABEL_15;
    }
    v8(v132, (uint64_t)v26, v6);
    uint64_t v84 = v27[5];
    uint64_t v85 = v132 + v84;
    uint64_t v86 = &v26[v84];
    uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v125 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v123 - 8) + 40);
    v125(v85, v86, v123);
    uint64_t v87 = v27[6];
    uint64_t v88 = v132 + v87;
    uint64_t v89 = &__src[v87];
    uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v90 - 8) + 40))(v88, v89, v90);
    uint64_t v91 = v27[7];
    uint64_t v120 = v132 + v91;
    uint64_t v92 = &__src[v91];
    uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v94 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v93 - 8) + 40);
    v94(v120, v92, v93);
    v94(v132 + v27[8], &__src[v27[8]], v93);
    uint64_t v95 = v27[9];
    uint64_t v96 = v132 + v95;
    uint64_t v97 = &__src[v95];
    uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v98 - 8) + 40))(v96, v97, v98);
    v125(v132 + v27[10], &__src[v27[10]], v123);
    uint64_t v99 = v27[11];
    uint64_t v100 = v132 + v99;
    uint64_t v121 = &__src[v99];
    uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v101 - 8) + 40))(v100, v121, v101);
    v125(v132 + v27[12], &__src[v27[12]], v123);
    v125(v132 + v27[13], &__src[v27[13]], v123);
    uint64_t v102 = v27[14];
    uint64_t v103 = (void *)(v132 + v102);
    uint64_t v104 = &__src[v102];
    uint64_t v105 = type metadata accessor for DirectInvocationConfig();
    LODWORD(v100) = __swift_getEnumTagSinglePayload((uint64_t)v103, 1, v105);
    int v106 = __swift_getEnumTagSinglePayload((uint64_t)v104, 1, v105);
    if (v100)
    {
      uint64_t v54 = v129;
      if (!v106)
      {
        uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v107 - 8) + 32))(v103, v104, v107);
        uint64_t v108 = (uint64_t)v103;
        uint64_t v109 = v105;
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v54 = v129;
      if (!v106)
      {
        uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(void *, char *, uint64_t))(*(void *)(v117 - 8) + 40))(v103, v104, v117);
        goto LABEL_30;
      }
      sub_2519A0B28((uint64_t)v103, (void (*)(void))type metadata accessor for DirectInvocationConfig);
    }
    uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
    memcpy(v103, v104, *(void *)(*(void *)(v111 - 8) + 64));
    goto LABEL_30;
  }
  if (v14)
  {
LABEL_7:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v10, v11, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  long long v15 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v15;
  uint64_t v16 = *(int *)(v12 + 24);
  uint64_t v17 = (char *)v10 + v16;
  uint64_t v18 = (char *)v11 + v16;
  uint64_t v19 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    uint64_t v133 = v12;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v17, v18, v6);
    uint64_t v31 = v19[5];
    uint64_t v32 = &v17[v31];
    uint64_t v33 = &v18[v31];
    uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v130 = *(void (**)(char *, char *, uint64_t))(*(void *)(v128 - 8) + 32);
    v130(v32, v33, v128);
    uint64_t v34 = v19[6];
    uint64_t v35 = &v17[v34];
    uint64_t v36 = &v18[v34];
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32))(v35, v36, v37);
    uint64_t v38 = v19[7];
    uint64_t v126 = &v17[v38];
    uint64_t v39 = &v18[v38];
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 32);
    v41(v126, v39, v40);
    v41(&v17[v19[8]], &v18[v19[8]], v40);
    uint64_t v42 = v19[9];
    uint64_t v43 = &v17[v42];
    uint64_t v44 = &v18[v42];
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
    v130(&v17[v19[10]], &v18[v19[10]], v128);
    uint64_t v46 = v19[11];
    uint64_t v127 = &v17[v46];
    uint64_t v47 = &v18[v46];
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v127, v47, v48);
    v130(&v17[v19[12]], &v18[v19[12]], v128);
    v130(&v17[v19[13]], &v18[v19[13]], v128);
    uint64_t v49 = v19[14];
    uint64_t v50 = &v17[v49];
    uint64_t v51 = &v18[v49];
    uint64_t v52 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v51, 1, v52))
    {
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v50, v51, *(void *)(*(void *)(v53 - 8) + 64));
    }
    else
    {
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v79 - 8) + 32))(v50, v51, v79);
      __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v52);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, (uint64_t)v19);
    uint64_t v12 = v133;
  }
  uint64_t v80 = *(int *)(v12 + 28);
  uint64_t v81 = (char *)v10 + v80;
  uint64_t v82 = (char *)v11 + v80;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v81, v82, v83);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519A7D84);
}

uint64_t sub_2519A7D84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    if (a2 == 0x7FFFFFFF) {
      return OUTLINED_FUNCTION_25_0(*(void *)(a1 + *(int *)(a3 + 20)));
    }
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for DisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519A7E44);
}

void sub_2519A7E44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_2519A7EF8()
{
  sub_251985798();
  if (v0 <= 0x3F)
  {
    sub_2519A514C(319, &qword_269B94468, type metadata accessor for DisambiguationOption, MEMORY[0x263F8D8F0]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for DisambiguationSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DisambiguationSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519A8150);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationSnippetModel.CodingKeys()
{
  return &type metadata for DisambiguationSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DisambiguationOption.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DisambiguationOption.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519A82DCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationOption.CodingKeys()
{
  return &type metadata for DisambiguationOption.CodingKeys;
}

unint64_t sub_2519A8318()
{
  unint64_t result = qword_269B94470;
  if (!qword_269B94470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94470);
  }
  return result;
}

unint64_t sub_2519A8368()
{
  unint64_t result = qword_269B94478;
  if (!qword_269B94478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94478);
  }
  return result;
}

unint64_t sub_2519A83B8()
{
  unint64_t result = qword_269B94480;
  if (!qword_269B94480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94480);
  }
  return result;
}

unint64_t sub_2519A8408()
{
  unint64_t result = qword_269B94488;
  if (!qword_269B94488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94488);
  }
  return result;
}

unint64_t sub_2519A8458()
{
  unint64_t result = qword_269B94490;
  if (!qword_269B94490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94490);
  }
  return result;
}

unint64_t sub_2519A84A8()
{
  unint64_t result = qword_269B94498;
  if (!qword_269B94498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94498);
  }
  return result;
}

char *sub_2519A84F4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B944B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  long long v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2519A170C(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2519A18D0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_2519A85D8(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    long long v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B944A8);
  uint64_t v10 = *(void *)(type metadata accessor for DisambiguationOption(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  long long v13 = (void *)swift_allocObject();
  unint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for DisambiguationOption(0) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v17 = (unint64_t)v13 + v16;
  unint64_t v18 = a4 + v16;
  if (v5)
  {
    sub_2519A17A0(v18, v8, v17);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2519A19B0(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

size_t sub_2519A8774(uint64_t a1)
{
  return sub_2519A85D8(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_2519A8788(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DisambiguationOption(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return *(void *)(v0 - 120);
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return sub_2519CA210();
}

void OUTLINED_FUNCTION_13_3()
{
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = v4 + 16 * v1;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return type metadata accessor for DisambiguationOption(0);
}

uint64_t OUTLINED_FUNCTION_25_0@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t DirectInvocationConfig.action.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);

  return sub_2519C9890();
}

uint64_t sub_2519A89B4(id *a1)
{
  id v1 = *a1;
  return DirectInvocationConfig.action.setter();
}

uint64_t DirectInvocationConfig.action.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);

  return sub_2519C98A0();
}

void (*DirectInvocationConfig.action.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  v2[4] = sub_2519C9880();
  return sub_251979DD8;
}

uint64_t DirectInvocationConfig.id.getter()
{
  uint64_t v0 = sub_2519C9850();
  OUTLINED_FUNCTION_4_0();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_5();
  uint64_t v6 = v5 - v4;
  sub_2519C9840();
  uint64_t v7 = sub_2519C9830();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  return v7;
}

BOOL sub_2519A8B3C()
{
  uint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_2519A8B84()
{
  return sub_2519A8B3C();
}

uint64_t sub_2519A8BA0()
{
  return 1;
}

uint64_t sub_2519A8BA8()
{
  return 0x6E6F69746361;
}

BOOL sub_2519A8BCC@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_2519A8B3C();
  *a1 = result;
  return result;
}

uint64_t sub_2519A8C00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519A8BA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_2519A8C2C@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_2519A8B84();
  *a1 = result;
  return result;
}

uint64_t sub_2519A8C58()
{
  return sub_251979E7C();
}

uint64_t sub_2519A8C74@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519A8BA0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2519A8CA0(uint64_t a1)
{
  unint64_t v2 = sub_2519A8F80();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519A8CDC(uint64_t a1)
{
  unint64_t v2 = sub_2519A8F80();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DirectInvocationConfig.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v18 = v5;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B944B8);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_3_4();
  uint64_t v11 = type metadata accessor for DirectInvocationConfig();
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_5();
  uint64_t v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519A8F80();
  sub_2519CA550();
  if (!v2)
  {
    sub_251987794(&qword_269B93FE8);
    sub_2519CA480();
    sub_2519C9890();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v9, v4);
    sub_2519869B8();
    sub_2519C9870();
    uint64_t v15 = OUTLINED_FUNCTION_2_4();
    v16(v15);
    sub_2519A8FCC(v14, a2);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for DirectInvocationConfig()
{
  uint64_t result = qword_269B944D0;
  if (!qword_269B944D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_2519A8F80()
{
  unint64_t result = qword_269B944C0;
  if (!qword_269B944C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B944C0);
  }
  return result;
}

uint64_t sub_2519A8FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DirectInvocationConfig();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t DirectInvocationConfig.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B944C8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_3_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519A8F80();
  sub_2519CA560();
  sub_2519C9890();
  sub_2519869B8();
  sub_2519C9870();
  sub_251987794(&qword_269B94000);
  sub_2519CA4D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v1, v10);
}

uint64_t DirectInvocationConfig.Builder.init(action:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id DirectInvocationConfig.Builder.withAction(_:)@<X0>(id a1@<X0>, id *a2@<X8>)
{
  *a2 = a1;
  return a1;
}

uint64_t DirectInvocationConfig.Builder.build()()
{
  uint64_t v1 = *v0;
  sub_2519869B8();
  id v2 = v1;

  return sub_2519C9870();
}

uint64_t sub_2519A9248(void *a1)
{
  return DirectInvocationConfig.encode(to:)(a1);
}

uint64_t sub_2519A9260@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DirectInvocationConfig.init(from:)(a1, a2);
}

uint64_t sub_2519A9278@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DirectInvocationConfig.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2519A92A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DirectInvocationConfig.action.getter();
  *a1 = result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for DirectInvocationConfig(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for DirectInvocationConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DirectInvocationConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519A955C);
}

uint64_t sub_2519A955C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);

  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DirectInvocationConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519A95BC);
}

uint64_t sub_2519A95BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);

  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

void sub_2519A960C()
{
  sub_2519A9698();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2519A9698()
{
  if (!qword_269B94048)
  {
    sub_2519869B8();
    unint64_t v0 = sub_2519C98B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B94048);
    }
  }
}

ValueMetadata *type metadata accessor for DirectInvocationConfig.Builder()
{
  return &type metadata for DirectInvocationConfig.Builder;
}

uint64_t getEnumTagSinglePayload for DirectInvocationConfig.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for DirectInvocationConfig.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2519A97F0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2519A9818()
{
  return 0;
}

ValueMetadata *type metadata accessor for DirectInvocationConfig.CodingKeys()
{
  return &type metadata for DirectInvocationConfig.CodingKeys;
}

unint64_t sub_2519A9834()
{
  unint64_t result = qword_269B944E0;
  if (!qword_269B944E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B944E0);
  }
  return result;
}

unint64_t sub_2519A9884()
{
  unint64_t result = qword_269B944E8;
  if (!qword_269B944E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B944E8);
  }
  return result;
}

unint64_t sub_2519A98D4()
{
  unint64_t result = qword_269B944F0;
  if (!qword_269B944F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B944F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return v0;
}

HomeAutomationUIFramework::SnippetState_optional __swiftcall SnippetState.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_2519CA430();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

uint64_t SnippetState.rawValue.getter()
{
  return qword_2519CC2B0[*v0];
}

uint64_t sub_2519A99CC()
{
  return sub_2519BE798();
}

uint64_t sub_2519A99D8()
{
  return sub_2519BE9F0();
}

uint64_t sub_2519A99E0()
{
  return sub_2519BECC4();
}

uint64_t sub_2519A99E8()
{
  return sub_2519BEE20();
}

HomeAutomationUIFramework::SnippetState_optional sub_2519A99F0(Swift::String *a1)
{
  return SnippetState.init(rawValue:)(*a1);
}

uint64_t sub_2519A99FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SnippetState.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2519A9A24(uint64_t a1, char *a2, char a3, char a4)
{
  char v7 = *a2;
  sub_2519AAAB8(a1, v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  *(unsigned char *)(v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) = v7;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress) = a3;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) = a4;
  return v4;
}

uint64_t sub_2519A9A8C@<X0>(uint64_t a1@<X8>)
{
  if (!*(unsigned char *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_269B93B70 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2519C99D0();
    __swift_project_value_buffer(v4, (uint64_t)qword_269B99480);
    OUTLINED_FUNCTION_5_5();
    OUTLINED_FUNCTION_8_10();
    OUTLINED_FUNCTION_2_5(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationUIFramework/Utils/CompletionStyleSettings.swift");
    uint64_t v6 = (unsigned int *)MEMORY[0x263F18508];
    goto LABEL_13;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) == 1) {
    OUTLINED_FUNCTION_4_8();
  }
  else {
    OUTLINED_FUNCTION_3_5();
  }
  char v3 = OUTLINED_FUNCTION_1_2();
  swift_bridgeObjectRelease();
  if (v3) {
    goto LABEL_7;
  }
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2519C99D0();
  __swift_project_value_buffer(v7, (uint64_t)qword_269B99480);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_2_5(v8, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationUIFramework/Utils/CompletionStyleSettings.swift");
  uint64_t v6 = (unsigned int *)MEMORY[0x263F184F8];
LABEL_13:
  uint64_t v9 = *v6;
  sub_2519C9A50();
  OUTLINED_FUNCTION_0();
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 104);

  return v12(a1, v9, v10);
}

uint64_t sub_2519A9C18@<X0>(uint64_t *a1@<X8>)
{
  if (!*(unsigned char *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state))
  {
    swift_bridgeObjectRelease();
LABEL_7:
    if (qword_269B93B70 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2519C99D0();
    __swift_project_value_buffer(v4, (uint64_t)qword_269B99480);
    OUTLINED_FUNCTION_5_5();
    OUTLINED_FUNCTION_8_10();
    OUTLINED_FUNCTION_2_5(v5, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationUIFramework/Utils/CompletionStyleSettings.swift");
    *a1 = sub_2519C9EE0();
    uint64_t v6 = (unsigned int *)MEMORY[0x263F775F0];
    goto LABEL_13;
  }
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) == 1) {
    OUTLINED_FUNCTION_4_8();
  }
  else {
    OUTLINED_FUNCTION_3_5();
  }
  char v3 = OUTLINED_FUNCTION_1_2();
  swift_bridgeObjectRelease();
  if (v3) {
    goto LABEL_7;
  }
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2519C99D0();
  __swift_project_value_buffer(v7, (uint64_t)qword_269B99480);
  OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_2_5(v8, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationUIFramework/Utils/CompletionStyleSettings.swift");
  uint64_t v9 = *MEMORY[0x263F775D8];
  sub_2519CA040();
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t *, uint64_t))(v10 + 104))(a1, v9);
  uint64_t v6 = (unsigned int *)MEMORY[0x263F775F8];
LABEL_13:
  uint64_t v11 = *v6;
  sub_2519CA050();
  OUTLINED_FUNCTION_0();
  uint64_t v14 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v13 + 104);

  return v14(a1, v11, v12);
}

uint64_t sub_2519A9DEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25199CA64(v3 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig, (uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  sub_2519C9920();
  sub_2519AA798((uint64_t)v9);
  if (v19[15] == 48) {
    char v10 = 0;
  }
  else {
    char v10 = sub_2519BE8A4();
  }
  if (a3 == 1)
  {
    uint64_t v13 = *MEMORY[0x263F76578];
    uint64_t v14 = sub_2519C9860();
    OUTLINED_FUNCTION_0();
    unint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 104);
    v16(a1, v13, v14);
    if (v10) {
      unint64_t v17 = (unsigned int *)MEMORY[0x263F76570];
    }
    else {
      unint64_t v17 = (unsigned int *)MEMORY[0x263F76568];
    }
    return ((uint64_t (*)(uint64_t, void, uint64_t))v16)(a2, *v17, v14);
  }
  else
  {
    sub_2519C9860();
    OUTLINED_FUNCTION_0();
    uint64_t v12 = *(void (**)(void))(v11 + 104);
    OUTLINED_FUNCTION_7_8();
    v12();
    OUTLINED_FUNCTION_7_8();
    return ((uint64_t (*)(void))v12)();
  }
}

uint64_t sub_2519A9FF8()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle)) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t sub_2519AA01C(unsigned __int8 *a1, uint64_t a2)
{
  int v3 = *a1;
  switch(v3)
  {
    case 18:
      uint64_t v4 = sub_2519C9E70();
      sub_2519C9EC0();
      uint64_t v5 = sub_2519C9E70();
      goto LABEL_7;
    case 35:
      uint64_t v4 = sub_2519C9EE0();
      sub_2519C9E90();
      uint64_t v5 = sub_2519C9E90();
LABEL_7:
      uint64_t v6 = v5;
      if (*(unsigned char *)(v2 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) == 1)
      {
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
        return v4;
      }
      return v6;
    case 39:
      uint64_t v4 = sub_2519C9E60();
      sub_2519C9EC0();
      uint64_t v5 = sub_2519C9E60();
      goto LABEL_7;
  }
  uint64_t v6 = a2;
  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) == 1)
  {
    swift_retain();
  }
  else
  {
    int v7 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress);
    uint64_t v8 = sub_2519C9EE0();
    if (v7 == 1)
    {
      uint64_t v9 = sub_2519C9F30();
      swift_release();
      uint64_t v8 = v9;
    }
    swift_retain();
    return v8;
  }
  return v6;
}

uint64_t sub_2519AA154()
{
  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_6_1();
  uint64_t v3 = v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig;
  sub_25199CA64(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
  sub_2519C9920();
  sub_2519AA798(v1);
  sub_25199CA64(v3, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  sub_2519AA798(v1);
  uint64_t v4 = OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state;
  int v5 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state);
  if (v5 == 2)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle)) {
      return 2;
    }
    else {
      return 1;
    }
  }
  if (v5 == 1) {
    OUTLINED_FUNCTION_4_8();
  }
  char v6 = sub_2519CA500();
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_6;
  }
  sub_25199CA64(v3, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  sub_2519C9920();
  sub_2519AA798(v1);
  uint64_t v8 = static ColorUtils.getColor(colorString:colorDict:)(v12[0], v12[1], v12[0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(unsigned char *)(v0 + v4))
  {
    swift_bridgeObjectRelease();
LABEL_15:
    uint64_t v7 = sub_2519AA01C((unsigned __int8 *)v12, v8);
LABEL_25:
    swift_release();
    return v7;
  }
  if (*(unsigned char *)(v0 + v4) == 1) {
    OUTLINED_FUNCTION_4_8();
  }
  else {
    OUTLINED_FUNCTION_3_5();
  }
  char v9 = OUTLINED_FUNCTION_1_2();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_15;
  }
  switch(LOBYTE(v12[0]))
  {
    case 0x12u:
      uint64_t v7 = sub_2519C9E70();
      sub_2519C9EC0();
      sub_2519C9E70();
      goto LABEL_24;
    case 0x23u:
      uint64_t v7 = sub_2519C9EE0();
      if (qword_269B93B90 != -1) {
        swift_once();
      }
      swift_retain();
      sub_2519C9E60();
      goto LABEL_24;
    case 0x27u:
      sub_2519C9EE0();
      uint64_t v7 = sub_2519C9F30();
      swift_release();
      sub_2519C9EC0();
      sub_2519C9EE0();
      sub_2519C9F30();
      swift_release();
LABEL_24:
      swift_release();
      goto LABEL_25;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_noCircle) != 1
    && *(unsigned char *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress) == 1)
  {
    uint64_t v11 = sub_2519C9EE0();
    swift_release();
    return v11;
  }
  return v8;
}

uint64_t sub_2519AA4C4@<X0>(char *a1@<X8>)
{
  type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_1();
  uint64_t v5 = v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig;
  sub_25199CA64(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
  sub_2519C9920();
  sub_2519AA798(v2);
  uint64_t v6 = OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state))
  {
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_state) == 1) {
      OUTLINED_FUNCTION_4_8();
    }
    else {
      OUTLINED_FUNCTION_3_5();
    }
    char v8 = OUTLINED_FUNCTION_1_2();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v8 & 1) == 0)
    {
      if ((v13 | 4) != 0x27)
      {
LABEL_12:
        if (*(unsigned char *)(v1 + v6))
        {
          char v10 = OUTLINED_FUNCTION_1_2();
          swift_bridgeObjectRelease();
          if ((v10 & 1) == 0)
          {
            sub_25199CA64(v5, v2);
            __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
            sub_2519C9920();
            uint64_t result = sub_2519AA798(v2);
            char v9 = v12;
            goto LABEL_17;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        sub_25199CA64(v5, v2);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        sub_2519C9920();
        uint64_t result = sub_2519AA798(v2);
        char v9 = v11;
        goto LABEL_17;
      }
LABEL_11:
      char v9 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  if (v13 == 39) {
    goto LABEL_11;
  }
  if (v13 != 35) {
    goto LABEL_12;
  }
  char v9 = 2;
LABEL_17:
  *a1 = v9;
  return result;
}

uint64_t sub_2519AA6B0()
{
  uint64_t v1 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25199CA64(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  uint64_t v4 = v6;
  sub_2519AA798((uint64_t)v3);
  return v4;
}

uint64_t sub_2519AA760()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_inProgress);
}

uint64_t CompletionStyleSettings.deinit()
{
  sub_2519AA798(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  return v0;
}

uint64_t sub_2519AA798(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for IconConfiguration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CompletionStyleSettings.__deallocating_deinit()
{
  sub_2519AA798(v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework23CompletionStyleSettings_iconConfig);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

unint64_t sub_2519AA85C()
{
  unint64_t result = qword_269B944F8;
  if (!qword_269B944F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B944F8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SnippetState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519AA974);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SnippetState()
{
  return &type metadata for SnippetState;
}

uint64_t sub_2519AA9AC()
{
  return type metadata accessor for CompletionStyleSettings();
}

uint64_t type metadata accessor for CompletionStyleSettings()
{
  uint64_t result = qword_269B94500;
  if (!qword_269B94500) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519AA9FC()
{
  uint64_t result = type metadata accessor for IconConfiguration();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for CompletionStyleSettings(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CompletionStyleSettings);
}

uint64_t sub_2519AAAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IconConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_2519CA500();
}

void OUTLINED_FUNCTION_2_5(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v5 = 0xD000000000000076;
  unint64_t v4 = (a2 - 32) | 0x8000000000000000;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&v5);
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return 0x64656C696166;
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return 6710895;
}

uint64_t CallToActionView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = sub_2519C99B0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_5();
  uint64_t v14 = v13 - v12;
  uint64_t v22 = type metadata accessor for CallToActionView();
  uint64_t v15 = (uint64_t *)(a2 + *(int *)(v22 + 20));
  sub_2519CA170();
  sub_2519ABBD8(&qword_269B93CB0, MEMORY[0x263F77980]);
  *uint64_t v15 = sub_2519C9AC0();
  v15[1] = v16;
  sub_2519AB928(a1, a2, (void (*)(void))type metadata accessor for CallToActionSnippetModel);
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v9, (uint64_t)qword_269B99480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v14, v17, v9);
  sub_2519CA3B0();
  sub_2519CA210();
  CallToActionSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v18._uint64_t countAndFlagsBits = 0;
  v19._uint64_t countAndFlagsBits = 0xD000000000000069;
  v19._object = (void *)0x80000002519CECB0;
  v18._object = (void *)0xE000000000000000;
  Logger.debug(output:test:caller:)(v18, 0, v19);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v14, v9);
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  id v20 = (id)qword_269B99498;
  sub_2519C99A0();
  sub_2519CA300();
  sub_2519C9990();
  sub_2519AB8CC(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a2 + *(int *)(v22 + 24), v8, v23);
}

uint64_t type metadata accessor for CallToActionView()
{
  uint64_t result = qword_269B94548;
  if (!qword_269B94548) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CallToActionView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v21 = a1;
  uint64_t v3 = type metadata accessor for CallToActionView();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94510);
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5();
  uint64_t v12 = v11 - v10;
  sub_2519AB928(v1, (uint64_t)v6, (void (*)(void))type metadata accessor for CallToActionView);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v14 = swift_allocObject();
  sub_2519AB98C((uint64_t)v6, v14 + v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94518);
  sub_2519ABA40();
  sub_2519CA030();
  sub_2519AB928(v2, (uint64_t)v6, (void (*)(void))type metadata accessor for CallToActionView);
  uint64_t v15 = swift_allocObject();
  sub_2519AB98C((uint64_t)v6, v15 + v13);
  uint64_t v17 = v20;
  uint64_t v16 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v21, v12, v20);
  Swift::String v18 = (uint64_t (**)())(v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94540) + 36));
  *Swift::String v18 = sub_2519ABC24;
  v18[1] = (uint64_t (*)())v15;
  v18[2] = 0;
  void v18[3] = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v12, v17);
}

uint64_t sub_2519AB130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = sub_2519CA020();
  uint64_t v44 = *(void *)(v3 - 8);
  uint64_t v45 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CallToActionView();
  uint64_t v40 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v40 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B942A8);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94568);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v41 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94530);
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  Swift::String v19 = (char *)&v37 - v18;
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 24)) == 1)
  {
    uint64_t v37 = v19;
    uint64_t v38 = v17;
    uint64_t v39 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    sub_2519C9920();
    sub_2519AB928(a1, (uint64_t)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for CallToActionView);
    unint64_t v20 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
    uint64_t v21 = swift_allocObject();
    sub_2519AB98C((uint64_t)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
    sub_251991D3C();
    sub_2519C9FC0();
    sub_2519C9C40();
    sub_2519827F8(&qword_269B942B0, &qword_269B942A8);
    sub_2519ABBD8(&qword_269B94538, MEMORY[0x263F775B0]);
    uint64_t v22 = v41;
    uint64_t v23 = v43;
    uint64_t v24 = v45;
    sub_2519C9DC0();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v5, v24);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v23);
    LOBYTE(v24) = sub_2519C9C80();
    char v25 = sub_2519C9CA0();
    char v26 = sub_2519C9C90();
    sub_2519C9C90();
    uint64_t v27 = v22;
    if (sub_2519C9C90() != v24) {
      char v26 = sub_2519C9C90();
    }
    sub_2519C9C90();
    char v28 = sub_2519C9C90();
    uint64_t v29 = v46;
    uint64_t v30 = v14;
    uint64_t v32 = (uint64_t)v38;
    uint64_t v31 = v39;
    uint64_t v33 = (uint64_t)v37;
    if (v28 != v25) {
      char v26 = sub_2519C9C90();
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v32, v27, v11);
    uint64_t v34 = v32 + *(int *)(v30 + 36);
    *(unsigned char *)uint64_t v34 = v26;
    *(_OWORD *)(v34 + 8) = 0u;
    *(_OWORD *)(v34 + 24) = 0u;
    *(unsigned char *)(v34 + 40) = 1;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v27, v11);
    sub_2519AC8EC(v32, v33);
    sub_2519AC8EC(v33, v29);
    return __swift_storeEnumTagSinglePayload(v29, 0, 1, v30);
  }
  else
  {
    uint64_t v36 = v46;
    return __swift_storeEnumTagSinglePayload(v36, 1, 1, v14);
  }
}

void sub_2519AB698(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + *(int *)(type metadata accessor for CallToActionView() + 20));
  if (v1)
  {
    type metadata accessor for CallToActionSnippetModel();
    id v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    id v3 = (id)sub_2519C9890();
    sub_2519CA160();
  }
  else
  {
    sub_2519CA170();
    sub_2519ABBD8(&qword_269B93CB0, MEMORY[0x263F77980]);
    sub_2519C9AB0();
    __break(1u);
  }
}

void sub_2519AB788()
{
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  type metadata accessor for CallToActionView();
  sub_2519CA2F0();
  sub_2519C9980();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2519C99D0();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
  v1._uint64_t countAndFlagsBits = 0xD000000000000069;
  v2._object = (void *)0x80000002519CED40;
  v1._object = (void *)0x80000002519CECB0;
  v2._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

uint64_t sub_2519AB8CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CallToActionSnippetModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2519AB928(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_2519AB98C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CallToActionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2519AB9F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CallToActionView();
  OUTLINED_FUNCTION_4_1(v3);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_2519AB130(v5, a1);
}

unint64_t sub_2519ABA40()
{
  unint64_t result = qword_269B94520;
  if (!qword_269B94520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94518);
    sub_2519ABAB4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94520);
  }
  return result;
}

unint64_t sub_2519ABAB4()
{
  unint64_t result = qword_269B94528;
  if (!qword_269B94528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94530);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B942A8);
    sub_2519CA020();
    sub_2519827F8(&qword_269B942B0, &qword_269B942A8);
    sub_2519ABBD8(&qword_269B94538, MEMORY[0x263F775B0]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94528);
  }
  return result;
}

uint64_t sub_2519ABBD8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519ABC24()
{
  return sub_2519AC898((uint64_t (*)(uint64_t))sub_2519AB788);
}

uint64_t sub_2519ABC3C()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for CallToActionView(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (void *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for CallToActionSnippetModel();
    uint64_t v9 = *(int *)(v8 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    *((unsigned char *)a1 + *(int *)(v8 + 24)) = *((unsigned char *)a2 + *(int *)(v8 + 24));
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (void *)((char *)a1 + v13);
    uint64_t v16 = (char *)a2 + v13;
    uint64_t v18 = *(void **)v16;
    uint64_t v17 = *((void *)v16 + 1);
    *uint64_t v15 = v18;
    v15[1] = v17;
    Swift::String v19 = (char *)a1 + v14;
    unint64_t v20 = (char *)a2 + v14;
    uint64_t v21 = sub_2519C99B0();
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
    id v23 = v18;
    v22(v19, v20, v21);
  }
  return a1;
}

uint64_t destroy for CallToActionView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = sub_2519C99B0();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t initializeWithCopy for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CallToActionSnippetModel();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  *(unsigned char *)(a1 + *(int *)(v7 + 24)) = *(unsigned char *)(a2 + *(int *)(v7 + 24));
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = a2 + v12;
  uint64_t v17 = *(void **)v15;
  uint64_t v16 = *(void *)(v15 + 8);
  *uint64_t v14 = v17;
  v14[1] = v16;
  uint64_t v18 = a1 + v13;
  uint64_t v19 = a2 + v13;
  uint64_t v20 = sub_2519C99B0();
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16);
  id v22 = v17;
  v21(v18, v19, v20);
  return a1;
}

uint64_t assignWithCopy for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CallToActionSnippetModel();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  *(unsigned char *)(a1 + *(int *)(v7 + 24)) = *(unsigned char *)(a2 + *(int *)(v7 + 24));
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void **)(a1 + v12);
  uint64_t v16 = *(void **)(a2 + v12);
  *uint64_t v13 = v16;
  id v17 = v16;

  v13[1] = *(void *)(v14 + 8);
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
  return a1;
}

uint64_t initializeWithTake for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CallToActionSnippetModel();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  *(unsigned char *)(a1 + *(int *)(v7 + 24)) = *(unsigned char *)(a2 + *(int *)(v7 + 24));
  uint64_t v12 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for CallToActionSnippetModel();
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  *(unsigned char *)(a1 + *(int *)(v7 + 24)) = *(unsigned char *)(a2 + *(int *)(v7 + 24));
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = *(void **)(a1 + v12);
  *uint64_t v13 = *v14;

  v13[1] = v14[1];
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519AC424);
}

uint64_t sub_2519AC424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for CallToActionSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_2519C99B0();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for CallToActionView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519AC4F4);
}

void sub_2519AC4F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for CallToActionSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_2519C99B0();
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_2519AC5A0()
{
  uint64_t result = type metadata accessor for CallToActionSnippetModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2519C99B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_2519AC674()
{
  unint64_t result = qword_269B94558;
  if (!qword_269B94558)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94540);
    sub_2519827F8(&qword_269B94560, &qword_269B94510);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94558);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  unint64_t v1 = (int *)(type metadata accessor for CallToActionView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v7 + 8))(v6);
  uint64_t v8 = v6 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v9 + 8))(v8);

  uint64_t v10 = v6 + v1[8];
  sub_2519C99B0();
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v11 + 8))(v10);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2519AC880()
{
  return sub_2519AC898((uint64_t (*)(uint64_t))sub_2519AB698);
}

uint64_t sub_2519AC898(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for CallToActionView();
  OUTLINED_FUNCTION_4_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

uint64_t sub_2519AC8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94530);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t static ColorUtils.fromString(_:)()
{
  uint64_t v0 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v2 = v1;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v23 - v7;
  uint64_t v9 = sub_2519CA1C0();
  uint64_t v11 = v10;
  if (qword_269B93B88 != -1) {
    swift_once();
  }
  uint64_t v12 = qword_269B994D0;
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_2519AD6CC(v9, v11, v12);
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_bridgeObjectRelease();
    if (qword_269B93B70 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v14, v0);
    OUTLINED_FUNCTION_9_7();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_9((uint64_t)"Icon color converted from ");
    sub_2519CA210();
    sub_2519C9E10();
    sub_2519CA210();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_7();
    OUTLINED_FUNCTION_8_11();
    Logger.debug(output:test:caller:)(v15, v16, v17);
  }
  else
  {
    uint64_t v13 = sub_2519AD758();
    swift_bridgeObjectRelease();
    if (qword_269B93B70 != -1) {
      swift_once();
    }
    uint64_t v18 = __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v18, v0);
    OUTLINED_FUNCTION_9_7();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_9((uint64_t)"Icon color converted from ");
    sub_2519CA210();
    sub_2519C9E10();
    sub_2519CA210();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_7();
    OUTLINED_FUNCTION_8_11();
    Logger.debug(output:test:caller:)(v19, v20, v21);
    uint64_t v8 = v6;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v0);
  return v13;
}

uint64_t sub_2519ACC58(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      sub_2519C9EC0();
      break;
    case 1:
      sub_2519C9EE0();
      break;
    case 2:
      sub_2519C9EE0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B94240);
      sub_2519ADC1C();
      break;
    case 3:
      if (qword_269B93B90 != -1) {
        swift_once();
      }
      goto LABEL_8;
    default:
LABEL_8:
      swift_retain();
      break;
  }
  return sub_2519C9A90();
}

uint64_t SnippetRenderingMode.toUIMode()()
{
  switch(*v0)
  {
    case 1:
      uint64_t result = sub_2519C9BF0();
      break;
    case 2:
      uint64_t result = sub_2519C9BE0();
      break;
    case 3:
      uint64_t result = sub_2519C9C10();
      break;
    default:
      uint64_t result = sub_2519C9C00();
      break;
  }
  return result;
}

uint64_t static ColorUtils.getColor(colorString:colorDict:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a3;
  sub_2519C9E20();
  OUTLINED_FUNCTION_4_0();
  uint64_t v31 = v6;
  uint64_t v32 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v30 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v10 = v9;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v33 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  Swift::String v15 = (char *)&v30 - v14;
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v8, (uint64_t)qword_269B99480);
  Swift::Bool v16 = *(void (**)(void))(v10 + 16);
  OUTLINED_FUNCTION_7_9();
  v16();
  v38._uint64_t countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  v38._uint64_t countAndFlagsBits = 0xD000000000000015;
  v38._object = (void *)0x80000002519CEE00;
  uint64_t v35 = a1;
  uint64_t v36 = a1;
  uint64_t v37 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  sub_2519CA1B0();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_7();
  v17._object = (void *)0x80000002519CED90;
  v17._uint64_t countAndFlagsBits = 0xD000000000000069;
  Logger.debug(output:test:caller:)(v38, 0, v17);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v15, v8);
  if (!a2)
  {
LABEL_8:
    uint64_t v23 = v34;
    if (v34)
    {
      swift_bridgeObjectRetain();
      sub_2519AD710(114, 0xE100000000000000, v23);
      if (v24 & 1) != 0 || (sub_2519AD710(103, 0xE100000000000000, v23), (v25))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2519AD710(98, 0xE100000000000000, v23);
        char v27 = v26;
        swift_bridgeObjectRelease();
        if ((v27 & 1) == 0)
        {
          (*(void (**)(char *, void, uint64_t))(v31 + 104))(v30, *MEMORY[0x263F1B388], v32);
          OUTLINED_FUNCTION_3_6();
          return v28;
        }
      }
    }
    if (a2) {
      return static ColorUtils.fromString(_:)();
    }
    else {
      return sub_2519C9F00();
    }
  }
  swift_bridgeObjectRetain();
  if ((sub_2519CA240() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  uint64_t v19 = sub_2519C9E00();
  if (!v19) {
    goto LABEL_8;
  }
  uint64_t v20 = v19;
  OUTLINED_FUNCTION_7_9();
  v16();
  v38._uint64_t countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  v38._uint64_t countAndFlagsBits = 0xD000000000000013;
  v38._object = (void *)0x80000002519CEE20;
  sub_2519C9E10();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_7();
  v21._object = (void *)0x80000002519CED90;
  v21._uint64_t countAndFlagsBits = 0xD000000000000069;
  id v22 = v33;
  Logger.debug(output:test:caller:)(v38, 0, v21);
  swift_bridgeObjectRelease();
  v18(v22, v8);
  return v20;
}

uint64_t SnippetHomeDeviceType.onStateColorOverride.getter()
{
  int v1 = *v0;
  switch(v1)
  {
    case 18:
      uint64_t v2 = sub_2519C9E70();
      sub_2519C9EC0();
      sub_2519C9E70();
      break;
    case 35:
      uint64_t v2 = sub_2519C9EE0();
      sub_2519C9E90();
      sub_2519C9E90();
      break;
    case 39:
      uint64_t v2 = sub_2519C9E60();
      sub_2519C9EC0();
      sub_2519C9E60();
      break;
    default:
      return 0;
  }
  return v2;
}

uint64_t SnippetHomeDeviceType.offStateColorOverride.getter()
{
  int v1 = *v0;
  switch(v1)
  {
    case 18:
      uint64_t v2 = sub_2519C9E70();
      sub_2519C9EC0();
      sub_2519C9E70();
      break;
    case 35:
      uint64_t v2 = sub_2519C9EE0();
      if (qword_269B93B90 != -1) {
        swift_once();
      }
      swift_retain();
      sub_2519C9E60();
      break;
    case 39:
      sub_2519C9EE0();
      uint64_t v2 = sub_2519C9F30();
      swift_release();
      sub_2519C9EC0();
      sub_2519C9EE0();
      sub_2519C9F30();
      swift_release();
      break;
    default:
      return 0;
  }
  return v2;
}

void SnippetHomeDeviceType.onStateModeOverride.getter(char *a1@<X8>)
{
  int v2 = *v1;
  if (v2 == 35) {
    char v3 = 2;
  }
  else {
    char v3 = 4;
  }
  if (v2 == 39) {
    char v4 = 0;
  }
  else {
    char v4 = v3;
  }
  *a1 = v4;
}

void SnippetHomeDeviceType.offStateModeOverride.getter(unsigned char *a1@<X8>)
{
  *a1 = 4 * (((*v1 - 35) & 0xFB) != 0);
}

uint64_t sub_2519AD384()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94570);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2519CC380;
  *(void *)(inited + 32) = 0x6B63616C62;
  *(void *)(inited + 40) = 0xE500000000000000;
  *(void *)(inited + 48) = sub_2519C9EA0();
  *(void *)(inited + 56) = 1702194274;
  *(void *)(inited + 64) = 0xE400000000000000;
  *(void *)(inited + 72) = sub_2519C9E40();
  *(void *)(inited + 80) = 0x6E776F7262;
  *(void *)(inited + 88) = 0xE500000000000000;
  *(void *)(inited + 96) = sub_2519C9EB0();
  *(void *)(inited + 104) = 0x7261656C63;
  *(void *)(inited + 112) = 0xE500000000000000;
  *(void *)(inited + 120) = sub_2519C9EC0();
  *(void *)(inited + 128) = 1851881827;
  *(void *)(inited + 136) = 0xE400000000000000;
  *(void *)(inited + 144) = sub_2519C9E50();
  *(void *)(inited + 152) = 2036429415;
  *(void *)(inited + 160) = 0xE400000000000000;
  *(void *)(inited + 168) = sub_2519C9E60();
  *(void *)(inited + 176) = 0x6E65657267;
  *(void *)(inited + 184) = 0xE500000000000000;
  *(void *)(inited + 192) = sub_2519C9ED0();
  *(void *)(inited + 200) = 0x6F6769646E69;
  *(void *)(inited + 208) = 0xE600000000000000;
  *(void *)(inited + 216) = sub_2519C9EF0();
  *(void *)(inited + 224) = 1953393005;
  *(void *)(inited + 232) = 0xE400000000000000;
  *(void *)(inited + 240) = sub_2519C9E70();
  *(void *)(inited + 248) = 0x65676E61726FLL;
  *(void *)(inited + 256) = 0xE600000000000000;
  *(void *)(inited + 264) = sub_2519C9F00();
  *(void *)(inited + 272) = 1802398064;
  *(void *)(inited + 280) = 0xE400000000000000;
  *(void *)(inited + 288) = sub_2519C9E80();
  *(void *)(inited + 296) = 0x7972616D697270;
  *(void *)(inited + 304) = 0xE700000000000000;
  *(void *)(inited + 312) = sub_2519C9F40();
  *(void *)(inited + 320) = 0x656C70727570;
  *(void *)(inited + 328) = 0xE600000000000000;
  *(void *)(inited + 336) = sub_2519C9F10();
  *(void *)(inited + 344) = 6579570;
  *(void *)(inited + 352) = 0xE300000000000000;
  *(void *)(inited + 360) = sub_2519C9E30();
  *(void *)(inited + 368) = 1818322292;
  *(void *)(inited + 376) = 0xE400000000000000;
  *(void *)(inited + 384) = sub_2519C9E90();
  *(void *)(inited + 392) = 0x7261646E6F636573;
  *(void *)(inited + 400) = 0xE900000000000079;
  *(void *)(inited + 408) = sub_2519C9F50();
  *(void *)(inited + 416) = 0x6574696877;
  *(void *)(inited + 424) = 0xE500000000000000;
  *(void *)(inited + 432) = sub_2519C9EE0();
  *(void *)(inited + 440) = 0x776F6C6C6579;
  *(void *)(inited + 448) = 0xE600000000000000;
  *(void *)(inited + 456) = sub_2519C9F20();
  uint64_t result = sub_2519CA180();
  qword_269B994D0 = result;
  return result;
}

void static ColorUtils.fromRGBDictionary(_:)(uint64_t a1)
{
  sub_2519C9E20();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5_6();
  if (a1)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_1_3(114);
    if (v3 & 1) != 0 || (OUTLINED_FUNCTION_1_3(103), (v4))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_1_3(98);
      char v6 = v5;
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = OUTLINED_FUNCTION_2_6();
        v8(v7);
        OUTLINED_FUNCTION_3_6();
      }
    }
  }
}

uint64_t sub_2519AD6CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_2519ADAC0(a1, a2), (v3 & 1) != 0)) {
    return swift_retain();
  }
  else {
    return 0;
  }
}

uint64_t sub_2519AD710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (unint64_t v4 = sub_2519ADAC0(a1, a2), (v5 & 1) != 0)) {
    return *(void *)(*(void *)(a3 + 56) + 8 * v4);
  }
  else {
    return 0;
  }
}

uint64_t sub_2519AD758()
{
  if (qword_269B93B88 == -1) {
    goto LABEL_2;
  }
LABEL_28:
  swift_once();
LABEL_2:
  uint64_t v0 = qword_269B994D0;
  uint64_t v1 = qword_269B994D0 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(qword_269B994D0 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(qword_269B994D0 + 64);
  int64_t v13 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v5 = 0;
  if (v4)
  {
LABEL_5:
    unint64_t v6 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v7 = v6 | (v5 << 6);
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    if (v8 >= v13) {
      goto LABEL_24;
    }
    unint64_t v9 = *(void *)(v1 + 8 * v8);
    ++v5;
    if (!v9)
    {
      int64_t v5 = v8 + 1;
      if (v8 + 1 >= v13) {
        goto LABEL_24;
      }
      unint64_t v9 = *(void *)(v1 + 8 * v5);
      if (!v9)
      {
        int64_t v5 = v8 + 2;
        if (v8 + 2 >= v13) {
          goto LABEL_24;
        }
        unint64_t v9 = *(void *)(v1 + 8 * v5);
        if (!v9) {
          break;
        }
      }
    }
LABEL_19:
    unint64_t v4 = (v9 - 1) & v9;
    unint64_t v7 = __clz(__rbit64(v9)) + (v5 << 6);
LABEL_20:
    uint64_t v11 = *(void *)(*(void *)(v0 + 56) + 8 * v7);
    sub_251991D3C();
    swift_retain();
    if (sub_2519CA3A0())
    {
      swift_release();
      return v11;
    }
    swift_release();
    if (v4) {
      goto LABEL_5;
    }
  }
  int64_t v10 = v8 + 3;
  if (v10 < v13)
  {
    unint64_t v9 = *(void *)(v1 + 8 * v10);
    if (!v9)
    {
      while (1)
      {
        int64_t v5 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_27;
        }
        if (v5 >= v13) {
          goto LABEL_24;
        }
        unint64_t v9 = *(void *)(v1 + 8 * v5);
        ++v10;
        if (v9) {
          goto LABEL_19;
        }
      }
    }
    int64_t v5 = v10;
    goto LABEL_19;
  }
LABEL_24:
  swift_release();
  return sub_2519C9EA0();
}

void Color.init(_:)(uint64_t a1)
{
  sub_2519C9E20();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_5_6();
  if (a1)
  {
    OUTLINED_FUNCTION_1_3(114);
    if (v3 & 1) != 0 || (OUTLINED_FUNCTION_1_3(103), (v4))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_1_3(98);
      char v6 = v5;
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = OUTLINED_FUNCTION_2_6();
        v8(v7);
        OUTLINED_FUNCTION_3_6();
      }
    }
  }
}

uint64_t sub_2519ADA6C()
{
  sub_2519C9EA0();
  uint64_t v0 = sub_2519C9F30();
  uint64_t result = swift_release();
  qword_269B994D8 = v0;
  return result;
}

ValueMetadata *type metadata accessor for ColorUtils()
{
  return &type metadata for ColorUtils;
}

unint64_t sub_2519ADAC0(uint64_t a1, uint64_t a2)
{
  sub_2519CA520();
  sub_2519CA1E0();
  uint64_t v4 = sub_2519CA540();

  return sub_2519ADB38(a1, a2, v4);
}

unint64_t sub_2519ADB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2519CA500() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2519CA500() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2519ADC1C()
{
  unint64_t result = qword_269B94248;
  if (!qword_269B94248)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94240);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94248);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  return sub_2519AD710(a1, 0xE100000000000000, v1);
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return v0;
}

void OUTLINED_FUNCTION_3_6()
{
  JUMPOUT(0x2533A7E00);
}

uint64_t OUTLINED_FUNCTION_4_9@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 96) = v1;
  *(void *)(v2 - 88) = (a1 - 32) | 0x8000000000000000;
  return sub_2519CA210();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return sub_2519CA210();
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
  return sub_2519CA3B0();
}

uint64_t CompletionView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_8_12();
  uint64_t v9 = (int *)type metadata accessor for CompletionView();
  int64_t v10 = (uint64_t *)(a2 + v9[5]);
  sub_2519CA170();
  sub_2519AF988(&qword_269B93CB0, MEMORY[0x263F77980]);
  *int64_t v10 = sub_2519C9AC0();
  v10[1] = v11;
  uint64_t v12 = (uint64_t *)(a2 + v9[8]);
  *uint64_t v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  swift_storeEnumTagMultiPayload();
  sub_2519AFD98(a1, a2, (void (*)(void))type metadata accessor for CompletionSnippetModel);
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  uint64_t v13 = a2 + v9[6];
  *(unsigned char *)uint64_t v13 = v20;
  *(void *)(v13 + 8) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  uint64_t v14 = a2 + v9[7];
  *(unsigned char *)uint64_t v14 = (v20 == 2) | v20 & 1;
  *(void *)(v14 + 8) = 0;
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  id v15 = (id)qword_269B99498;
  sub_2519C99A0();
  sub_2519CA300();
  sub_2519C9990();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v5, (uint64_t)qword_269B99480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v2, v16, v5);
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  CompletionSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v17._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
  v18._uint64_t countAndFlagsBits = 0xD000000000000067;
  v18._object = (void *)0x80000002519CEE90;
  v17._object = (void *)0x80000002519CEE60;
  Logger.debug(output:test:caller:)(v17, 0, v18);
  swift_bridgeObjectRelease();
  sub_2519AFDEC(a1, (void (*)(void))type metadata accessor for CompletionSnippetModel);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
}

uint64_t type metadata accessor for CompletionView()
{
  uint64_t result = qword_269B945E8;
  if (!qword_269B945E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519AE0E4()
{
  return sub_2519C9AF0();
}

uint64_t sub_2519AE108()
{
  return sub_2519C9AF0();
}

uint64_t sub_2519AE12C(uint64_t a1)
{
  sub_2519C9A50();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6_1();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  return sub_2519C9B00();
}

uint64_t CompletionView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v124 = a1;
  uint64_t v110 = sub_2519CA110();
  OUTLINED_FUNCTION_4_0();
  uint64_t v109 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_8(v5);
  uint64_t v113 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_269B94578);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_8(v7);
  uint64_t v115 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_269B94580);
  OUTLINED_FUNCTION_4_0();
  uint64_t v114 = v8;
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_8(v10);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94588);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_1();
  uint64_t v123 = v12;
  uint64_t v13 = type metadata accessor for CompletionSnippetView();
  MEMORY[0x270FA5388](v13 - 8);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_8(v14);
  uint64_t v119 = (void (*)(void))__swift_instantiateConcreteTypeFromMangledName(&qword_269B94590);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2();
  uint64_t v103 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_6_8((uint64_t)&v98 - v18);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94598);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1();
  uint64_t v118 = v20;
  uint64_t v108 = type metadata accessor for CompletionView();
  OUTLINED_FUNCTION_4_0();
  uint64_t v120 = v21;
  uint64_t v23 = *(void *)(v22 + 64);
  MEMORY[0x270FA5388](v24);
  uint64_t v100 = type metadata accessor for CompletionSnippetViewTVOS();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_8(v26);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B945A0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2();
  uint64_t v101 = v28;
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_6_8((uint64_t)&v98 - v30);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B945A8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6_8(v32);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388](v33 - 8);
  uint64_t v35 = (char *)&v98 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  MEMORY[0x270FA5388](v36 - 8);
  OUTLINED_FUNCTION_8_12();
  uint64_t v37 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  uint64_t v39 = MEMORY[0x270FA5388](v38);
  uint64_t v41 = (char *)&v98 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v39);
  uint64_t v43 = (char *)&v98 - v42;
  type metadata accessor for CompletionSnippetModel();
  uint64_t v44 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  sub_2519C9920();
  if (__swift_getEnumTagSinglePayload(v2, 1, v37) == 1)
  {
    sub_251982980(v2, &qword_269B93FC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    sub_2519C9920();
    uint64_t v45 = MEMORY[0x263F8D310];
    uint64_t v46 = MEMORY[0x263F77998];
    uint64_t v140 = MEMORY[0x263F8D310];
    uint64_t v141 = MEMORY[0x263F77998];
    uint64_t v99 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    sub_2519C9920();
    uint64_t v47 = v134;
    unint64_t v48 = v135;
    uint64_t v136 = v45;
    uint64_t v137 = v46;
    if (!v135)
    {
      uint64_t v47 = 0;
      unint64_t v48 = 0xE000000000000000;
    }
    uint64_t v134 = v47;
    unint64_t v135 = v48;
    uint64_t v133 = 0;
    long long v131 = 0u;
    long long v132 = 0u;
    uint64_t v130 = 0;
    long long v128 = 0u;
    long long v129 = 0u;
    uint64_t v127 = 0;
    long long v126 = 0u;
    long long v125 = 0u;
    uint64_t v49 = v107;
    sub_2519CA100();
    uint64_t v119 = (void (*)(void))type metadata accessor for CompletionView;
    uint64_t v50 = (char *)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2519AFD98(v44, (uint64_t)v50, (void (*)(void))type metadata accessor for CompletionView);
    unint64_t v51 = (*(unsigned __int8 *)(v120 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80);
    uint64_t v120 = v51 + v23;
    uint64_t v52 = swift_allocObject();
    sub_2519AF9D0((uint64_t)v50, v52 + v51, (void (*)(void))type metadata accessor for CompletionView);
    uint64_t v53 = v109;
    uint64_t v54 = v111;
    uint64_t v55 = v110;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v109 + 16))(v111, v49, v110);
    uint64_t v56 = (uint64_t)v113;
    uint64_t v57 = (uint64_t (**)())(v54 + *((int *)v113 + 9));
    *uint64_t v57 = sub_2519AF68C;
    v57[1] = (uint64_t (*)())v52;
    v57[2] = 0;
    v57[3] = 0;
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v49, v55);
    sub_2519AFD98(v99, (uint64_t)v50, v119);
    uint64_t v58 = swift_allocObject();
    sub_2519AF9D0((uint64_t)v50, v58 + v51, (void (*)(void))type metadata accessor for CompletionView);
    unint64_t v59 = sub_2519AF708();
    sub_2519C9D60();
    swift_release();
    sub_251982980(v54, &qword_269B94578);
    uint64_t v138 = v56;
    uint64_t v139 = v59;
    swift_getOpaqueTypeConformance2();
    uint64_t v60 = sub_2519C9D30();
    OUTLINED_FUNCTION_5_1();
    v61();
    uint64_t *v123 = v60;
    swift_storeEnumTagMultiPayload();
    sub_2519AF7B4();
    return sub_2519C9C30();
  }
  else
  {
    uint64_t v114 = v23;
    uint64_t v115 = (char *)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2519AF9D0(v2, (uint64_t)v43, (void (*)(void))type metadata accessor for IconConfiguration);
    uint64_t v113 = v43;
    sub_2519AFD98((uint64_t)v43, (uint64_t)v41, (void (*)(void))type metadata accessor for IconConfiguration);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    uint64_t v63 = v1;
    sub_2519C9920();
    uint64_t v64 = v138;
    uint64_t v112 = v139;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    sub_2519C9920();
    uint64_t v65 = v138;
    if (!v139) {
      uint64_t v65 = 0;
    }
    uint64_t v111 = v65;
    unint64_t v66 = 0xE000000000000000;
    if (v139) {
      unint64_t v66 = v139;
    }
    uint64_t v110 = v66;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    sub_2519C9920();
    int v67 = v138 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    sub_2519C9920();
    int v68 = v138;
    sub_2519C9920();
    int v69 = v138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    sub_2519C9920();
    sub_2519C9920();
    unsigned __int8 v70 = v138;
    type metadata accessor for SnippetDetailsModel();
    swift_allocObject();
    uint64_t v71 = sub_2519B1798((uint64_t)v41, v64, v112, v111, v110, v67, v68, v69, (uint64_t)v35, v70);
    uint64_t v72 = *(void **)(v1 + *(int *)(v108 + 20));
    if (v72)
    {
      uint64_t v73 = v71;
      id v74 = v72;
      sub_2519CA140();

      char v75 = sub_2519CA320();
      uint64_t v76 = (uint64_t)v115;
      uint64_t v77 = v120;
      if (v75)
      {
        uint64_t KeyPath = swift_getKeyPath();
        uint64_t v79 = v100;
        uint64_t v80 = v102;
        *(void *)(v102 + *(int *)(v100 + 24)) = KeyPath;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
        swift_storeEnumTagMultiPayload();
        *(void *)uint64_t v80 = sub_25198E6B8;
        *(void *)(v80 + 8) = v73;
        *(unsigned char *)(v80 + 16) = 0;
        sub_2519CA170();
        sub_2519AF988(&qword_269B93CB0, MEMORY[0x263F77980]);
        swift_retain();
        *(void *)(v80 + 24) = sub_2519C9AC0();
        *(void *)(v80 + 32) = v81;
        uint64_t v82 = v80 + *(int *)(v79 + 28);
        LOBYTE(v134) = 0;
        sub_2519C9F90();
        uint64_t v83 = v139;
        *(unsigned char *)uint64_t v82 = v138;
        *(void *)(v82 + 8) = v83;
        sub_2519AFD98(v63, v76, (void (*)(void))type metadata accessor for CompletionView);
        unint64_t v84 = (*(unsigned __int8 *)(v77 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
        uint64_t v85 = swift_allocObject();
        sub_2519AF9D0(v76, v85 + v84, (void (*)(void))type metadata accessor for CompletionView);
        uint64_t v86 = v101;
        sub_2519AFD98(v80, v101, (void (*)(void))type metadata accessor for CompletionSnippetViewTVOS);
        uint64_t v87 = (uint64_t (**)())(v86 + *(int *)(v116 + 36));
        *uint64_t v87 = sub_2519AFD80;
        v87[1] = (uint64_t (*)())v85;
        v87[2] = 0;
        v87[3] = 0;
        sub_2519AFDEC(v80, (void (*)(void))type metadata accessor for CompletionSnippetViewTVOS);
        uint64_t v88 = &qword_269B945A0;
        uint64_t v89 = v104;
        sub_2519AFE40(v86, v104, &qword_269B945A0);
        sub_251982930(v89, v118, &qword_269B945A0);
        swift_storeEnumTagMultiPayload();
        sub_2519AF830();
        sub_2519AF8DC();
        OUTLINED_FUNCTION_11_5();
        sub_2519C9C30();
        uint64_t v90 = v89;
      }
      else
      {
        uint64_t v91 = swift_retain();
        uint64_t v92 = v105;
        sub_25198A97C(v91, v105);
        sub_2519AFD98(v63, v76, (void (*)(void))type metadata accessor for CompletionView);
        unint64_t v93 = (*(unsigned __int8 *)(v77 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
        uint64_t v94 = swift_allocObject();
        sub_2519AF9D0(v76, v94 + v93, (void (*)(void))type metadata accessor for CompletionView);
        uint64_t v95 = v103;
        sub_2519AFD98(v92, v103, (void (*)(void))type metadata accessor for CompletionSnippetView);
        uint64_t v96 = (uint64_t (**)())(v95 + *((int *)v119 + 9));
        *uint64_t v96 = sub_2519AFA28;
        v96[1] = (uint64_t (*)())v94;
        v96[2] = 0;
        v96[3] = 0;
        sub_2519AFDEC(v92, (void (*)(void))type metadata accessor for CompletionSnippetView);
        uint64_t v88 = &qword_269B94590;
        uint64_t v97 = v106;
        sub_2519AFE40(v95, v106, &qword_269B94590);
        sub_251982930(v97, v118, &qword_269B94590);
        swift_storeEnumTagMultiPayload();
        sub_2519AF830();
        sub_2519AF8DC();
        OUTLINED_FUNCTION_11_5();
        sub_2519C9C30();
        uint64_t v90 = v97;
      }
      sub_251982980(v90, v88);
      sub_251982930(v76, (uint64_t)v123, &qword_269B945A8);
      swift_storeEnumTagMultiPayload();
      sub_2519AF7B4();
      sub_2519C9C30();
      swift_release();
      sub_251982980(v76, &qword_269B945A8);
      return sub_2519AFDEC((uint64_t)v113, (void (*)(void))type metadata accessor for IconConfiguration);
    }
    else
    {
      sub_2519CA170();
      sub_2519AF988(&qword_269B93CB0, MEMORY[0x263F77980]);
      uint64_t result = sub_2519C9AB0();
      __break(1u);
    }
  }
  return result;
}

void sub_2519AF058()
{
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  type metadata accessor for CompletionView();
  sub_2519CA2F0();
  sub_2519C9980();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2519C99D0();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
  v1._uint64_t countAndFlagsBits = 0xD000000000000067;
  v2._object = (void *)0x80000002519CEF00;
  v1._object = (void *)0x80000002519CEE90;
  v2._uint64_t countAndFlagsBits = 0xD00000000000002CLL;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

uint64_t sub_2519AF198(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_1();
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  type metadata accessor for CompletionView();
  sub_2519CA2F0();
  sub_2519C9980();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_269B99480);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, v8, v4);
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  CompletionSnippetModel.description.getter();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v9._uint64_t countAndFlagsBits = 0xD000000000000030;
  v10._uint64_t countAndFlagsBits = 0xD000000000000067;
  v10._object = (void *)0x80000002519CEE90;
  v9._object = a2;
  Logger.debug(output:test:caller:)(v9, 0, v10);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_2519AF3A4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = sub_2519C9820();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  sub_2519C9920();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v8) == 1)
  {
    sub_251982980((uint64_t)v5, &qword_269B93F18);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
    return sub_251982980((uint64_t)v7, &qword_269B93F18);
  }
  sub_2519C97E0();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v9 + 8);
  v12(v5, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1) {
    return sub_251982980((uint64_t)v7, &qword_269B93F18);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64EE0]), sel_init);
  uint64_t v15 = (void *)sub_2519C9800();
  objc_msgSend(v14, sel_setPunchOutUri_, v15);

  uint64_t v16 = *(void **)(a1 + *(int *)(type metadata accessor for CompletionView() + 20));
  if (v16)
  {
    id v17 = v16;
    id v18 = v14;
    sub_2519CA150();

    return ((uint64_t (*)(char *, uint64_t))v12)(v11, v8);
  }
  else
  {
    sub_2519CA170();
    sub_2519AF988(&qword_269B93CB0, MEMORY[0x263F77980]);
    uint64_t result = sub_2519C9AB0();
    __break(1u);
  }
  return result;
}

uint64_t sub_2519AF68C()
{
  return OUTLINED_FUNCTION_7_10((uint64_t)"Rendering default since no icon config present. ");
}

uint64_t sub_2519AF69C()
{
  return sub_2519AF6B4(sub_2519AF3A4);
}

uint64_t sub_2519AF6B4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for CompletionView();
  OUTLINED_FUNCTION_4_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

unint64_t sub_2519AF708()
{
  unint64_t result = qword_269B945B0;
  if (!qword_269B945B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94578);
    sub_2519AF988(&qword_269B945B8, MEMORY[0x263F777B0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B945B0);
  }
  return result;
}

unint64_t sub_2519AF7B4()
{
  unint64_t result = qword_269B945C0;
  if (!qword_269B945C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B945A8);
    sub_2519AF830();
    sub_2519AF8DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B945C0);
  }
  return result;
}

unint64_t sub_2519AF830()
{
  unint64_t result = qword_269B945C8;
  if (!qword_269B945C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B945A0);
    sub_2519AF988(&qword_269B945D0, (void (*)(uint64_t))type metadata accessor for CompletionSnippetViewTVOS);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B945C8);
  }
  return result;
}

unint64_t sub_2519AF8DC()
{
  unint64_t result = qword_269B945D8;
  if (!qword_269B945D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94590);
    sub_2519AF988(&qword_269B945E0, (void (*)(uint64_t))type metadata accessor for CompletionSnippetView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B945D8);
  }
  return result;
}

uint64_t sub_2519AF988(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519AF9D0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_13_4();
  v5(v4);
  return a2;
}

uint64_t sub_2519AFA28()
{
  return OUTLINED_FUNCTION_7_10((uint64_t)"Completed rendering general completion snippet. ");
}

uint64_t sub_2519AFA34(void *a1)
{
  uint64_t v3 = type metadata accessor for CompletionView();
  OUTLINED_FUNCTION_4_1(v3);
  return sub_2519AF198(v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), a1);
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = type metadata accessor for CompletionView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v14 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v4();
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  OUTLINED_FUNCTION_0();
  uint64_t v8 = *(void (**)(void))(v7 + 8);
  OUTLINED_FUNCTION_9_8();
  v8();
  OUTLINED_FUNCTION_9_8();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v9();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v10();
  OUTLINED_FUNCTION_9_8();
  v8();

  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2519C9A50();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v11();
  }
  else
  {
    swift_release();
  }
  sub_2519C99B0();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v12();

  return MEMORY[0x270FA0238](v0, v3 + v14, v2 | 7);
}

uint64_t sub_2519AFD80()
{
  return sub_2519AF6B4((uint64_t (*)(uint64_t))sub_2519AF058);
}

uint64_t sub_2519AFD98(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_9_0();
  v5(v4);
  return a2;
}

uint64_t sub_2519AFDEC(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

uint64_t sub_2519AFE40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = OUTLINED_FUNCTION_13_4();
  v5(v4);
  return a2;
}

uint64_t sub_2519AFE90()
{
  return swift_getOpaqueTypeConformance2();
}

char *initializeBufferWithCopyOfBuffer for CompletionView(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v46 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v46 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for CompletionSnippetModel();
    uint64_t v9 = v8[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = v8[6];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = v8[7];
    id v18 = &a1[v17];
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
    v21(v18, v19, v20);
    v21(&a1[v8[8]], (char *)a2 + v8[8], v20);
    uint64_t v22 = v8[9];
    uint64_t v23 = &a1[v22];
    uint64_t v24 = (char *)a2 + v22;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    uint64_t v26 = v8[10];
    uint64_t v27 = &a1[v26];
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    v21(&a1[v8[11]], (char *)a2 + v8[11], v20);
    uint64_t v30 = a3[5];
    uint64_t v31 = a3[6];
    uint64_t v32 = &a1[v30];
    uint64_t v33 = (char *)a2 + v30;
    uint64_t v35 = *(void **)v33;
    uint64_t v34 = *((void *)v33 + 1);
    *(void *)uint64_t v32 = v35;
    *((void *)v32 + 1) = v34;
    uint64_t v36 = &a1[v31];
    uint64_t v37 = (char *)a2 + v31;
    *uint64_t v36 = *v37;
    *((void *)v36 + 1) = *((void *)v37 + 1);
    uint64_t v38 = a3[7];
    uint64_t v39 = a3[8];
    uint64_t v40 = &a1[v38];
    uint64_t v41 = (char *)a2 + v38;
    *uint64_t v40 = *v41;
    *((void *)v40 + 1) = *((void *)v41 + 1);
    uint64_t v42 = &a1[v39];
    uint64_t v43 = (uint64_t *)((char *)a2 + v39);
    id v44 = v35;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v45 = sub_2519C9A50();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v45 - 8) + 16))(v42, v43, v45);
    }
    else
    {
      *(void *)uint64_t v42 = *v43;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v47 = a3[9];
    unint64_t v48 = &a1[v47];
    uint64_t v49 = (char *)a2 + v47;
    uint64_t v50 = sub_2519C99B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
  }
  return a1;
}

uint64_t destroy for CompletionView(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (int *)type metadata accessor for CompletionSnippetModel();
  uint64_t v6 = a1 + v5[5];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + v5[6];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + v5[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12(a1 + v5[8], v11);
  uint64_t v13 = a1 + v5[9];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = a1 + v5[10];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v12(a1 + v5[11], v11);

  swift_release();
  swift_release();
  uint64_t v17 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_2519C9A50();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  }
  else
  {
    swift_release();
  }
  uint64_t v19 = a1 + a2[9];
  uint64_t v20 = sub_2519C99B0();
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8);

  return v21(v19, v20);
}

uint64_t initializeWithCopy for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for CompletionSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = v7[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = v7[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  uint64_t v21 = v7[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  uint64_t v25 = v7[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  uint64_t v29 = a3[5];
  uint64_t v30 = a3[6];
  uint64_t v31 = (void *)(a1 + v29);
  uint64_t v32 = a2 + v29;
  uint64_t v34 = *(void **)v32;
  uint64_t v33 = *(void *)(v32 + 8);
  *uint64_t v31 = v34;
  v31[1] = v33;
  uint64_t v35 = a1 + v30;
  uint64_t v36 = a2 + v30;
  *(unsigned char *)uint64_t v35 = *(unsigned char *)v36;
  *(void *)(v35 + 8) = *(void *)(v36 + 8);
  uint64_t v37 = a3[7];
  uint64_t v38 = a3[8];
  uint64_t v39 = a1 + v37;
  uint64_t v40 = a2 + v37;
  *(unsigned char *)uint64_t v39 = *(unsigned char *)v40;
  *(void *)(v39 + 8) = *(void *)(v40 + 8);
  uint64_t v41 = (void *)(a1 + v38);
  uint64_t v42 = (void *)(a2 + v38);
  id v43 = v34;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v44 = sub_2519C9A50();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v44 - 8) + 16))(v41, v42, v44);
  }
  else
  {
    *uint64_t v41 = *v42;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v45 = a3[9];
  uint64_t v46 = a1 + v45;
  uint64_t v47 = a2 + v45;
  uint64_t v48 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
  return a1;
}

uint64_t assignWithCopy for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for CompletionSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = v7[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = v7[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  uint64_t v21 = v7[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 24))(v22, v23, v24);
  uint64_t v25 = v7[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 24))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  uint64_t v29 = a3[5];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = a2 + v29;
  uint64_t v32 = *(void **)(a1 + v29);
  uint64_t v33 = *(void **)(a2 + v29);
  *uint64_t v30 = v33;
  id v34 = v33;

  v30[1] = *(void *)(v31 + 8);
  uint64_t v35 = a3[6];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  *(unsigned char *)uint64_t v36 = *(unsigned char *)v37;
  *(void *)(v36 + 8) = *(void *)(v37 + 8);
  swift_retain();
  swift_release();
  uint64_t v38 = a3[7];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = a2 + v38;
  *(unsigned char *)uint64_t v39 = *(unsigned char *)v40;
  *(void *)(v39 + 8) = *(void *)(v40 + 8);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v41 = a3[8];
    uint64_t v42 = (void *)(a1 + v41);
    id v43 = (void *)(a2 + v41);
    sub_251982980(a1 + v41, &qword_269B940A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v44 = sub_2519C9A50();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
    }
    else
    {
      *uint64_t v42 = *v43;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v45 = a3[9];
  uint64_t v46 = a1 + v45;
  uint64_t v47 = a2 + v45;
  uint64_t v48 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 24))(v46, v47, v48);
  return a1;
}

uint64_t initializeWithTake for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for CompletionSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = v7[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = v7[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  uint64_t v21 = v7[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  uint64_t v25 = v7[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  uint64_t v29 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v29) = *(_OWORD *)(a2 + v29);
  uint64_t v30 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v34 = sub_2519C9A50();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 32))(v31, v32, v34);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  uint64_t v35 = a3[9];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  uint64_t v38 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
  return a1;
}

uint64_t assignWithTake for CompletionView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for CompletionSnippetModel();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = v7[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = v7[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40);
  v20(v17, v18, v19);
  v20(a1 + v7[8], a2 + v7[8], v19);
  uint64_t v21 = v7[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  uint64_t v25 = v7[10];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 40))(v26, v27, v28);
  v20(a1 + v7[11], a2 + v7[11], v19);
  uint64_t v29 = a3[5];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  uint64_t v32 = *(void **)(a1 + v29);
  *uint64_t v30 = *v31;

  v30[1] = v31[1];
  uint64_t v33 = a3[6];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  *(unsigned char *)uint64_t v34 = *(unsigned char *)v35;
  *(void *)(v34 + 8) = *(void *)(v35 + 8);
  swift_release();
  uint64_t v36 = a3[7];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  *(unsigned char *)uint64_t v37 = *(unsigned char *)v38;
  *(void *)(v37 + 8) = *(void *)(v38 + 8);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v39 = a3[8];
    uint64_t v40 = (void *)(a1 + v39);
    uint64_t v41 = (const void *)(a2 + v39);
    sub_251982980(a1 + v39, &qword_269B940A8);
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B940A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v43 = sub_2519C9A50();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v43 - 8) + 32))(v40, v41, v43);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
  }
  uint64_t v44 = a3[9];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 40))(v45, v46, v47);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519B13D0);
}

uint64_t sub_2519B13D0(uint64_t a1, uint64_t a2, int *a3)
{
  type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_13:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94110);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v15 = a3[8];
    }
    else
    {
      uint64_t v8 = sub_2519C99B0();
      uint64_t v15 = a3[9];
    }
    uint64_t v9 = a1 + v15;
    goto LABEL_13;
  }
  unint64_t v10 = *(void *)(a1 + a3[5]);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for CompletionView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519B14C8);
}

void sub_2519B14C8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + a4[5]) = a2;
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94110);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[8];
    }
    else
    {
      uint64_t v10 = sub_2519C99B0();
      uint64_t v14 = a4[9];
    }
    uint64_t v11 = a1 + v14;
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_2519B159C()
{
  type metadata accessor for CompletionSnippetModel();
  if (v0 <= 0x3F)
  {
    sub_25198E5D8();
    if (v1 <= 0x3F)
    {
      sub_2519C99B0();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

unint64_t sub_2519B16B0()
{
  unint64_t result = qword_269B945F8;
  if (!qword_269B945F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94600);
    sub_2519AF7B4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B945F8);
  }
  return result;
}

void OUTLINED_FUNCTION_6_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_7_10@<X0>(uint64_t a1@<X8>)
{
  return sub_2519AFA34((void *)((a1 - 32) | 0x8000000000000000));
}

uint64_t OUTLINED_FUNCTION_8_12()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  return v0;
}

uint64_t sub_2519B1798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, uint64_t a9, unsigned __int8 a10)
{
  int v36 = a7;
  int v37 = a8;
  int v35 = a6;
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v31 = a2;
  uint64_t v32 = a3;
  uint64_t v40 = a1;
  int v39 = a10;
  uint64_t v38 = a9;
  v30[1] = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v30 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94658);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_6_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  OUTLINED_FUNCTION_0();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)v30 - v24;
  uint64_t v26 = v10 + OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__punchout;
  uint64_t v27 = sub_2519C9820();
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 1, 1, v27);
  sub_2519830FC((uint64_t)v25, (uint64_t)v23);
  sub_2519C9A00();
  sub_251983164((uint64_t)v25);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v26, v11, v18);
  sub_25199CA64(v40, (uint64_t)v17);
  OUTLINED_FUNCTION_0_2();
  sub_25199CA64((uint64_t)v17, (uint64_t)v15);
  sub_2519C9A00();
  sub_2519AA798((uint64_t)v17);
  swift_endAccess();
  OUTLINED_FUNCTION_5_7();
  uint64_t v41 = v31;
  uint64_t v42 = v32;
  sub_2519C9A00();
  swift_endAccess();
  OUTLINED_FUNCTION_5_7();
  uint64_t v41 = v33;
  uint64_t v42 = v34;
  sub_2519C9A00();
  swift_endAccess();
  OUTLINED_FUNCTION_0_2();
  LOBYTE(v41) = v35;
  sub_2519C9A00();
  swift_endAccess();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_10(v36);
  swift_endAccess();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_10(v37);
  swift_endAccess();
  uint64_t v28 = v38;
  sub_2519830FC(v38, (uint64_t)v25);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v26, v18);
  sub_2519830FC((uint64_t)v25, (uint64_t)v23);
  sub_2519C9A00();
  sub_251983164((uint64_t)v25);
  swift_endAccess();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_10(v39);
  swift_endAccess();
  sub_251983164(v28);
  sub_2519AA798(v40);
  return v10;
}

uint64_t sub_2519B1B54(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_6_1();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_25199CA64(a1, v1);
  swift_retain();
  OUTLINED_FUNCTION_9_9();
  return sub_2519AA798(a1);
}

uint64_t sub_2519B1BFC()
{
  return sub_2519B1C24();
}

uint64_t sub_2519B1C10()
{
  return sub_2519B1C24();
}

uint64_t sub_2519B1C24()
{
  return sub_2519C9A20();
}

uint64_t sub_2519B1C9C()
{
  return sub_2519B1D98();
}

uint64_t sub_2519B1CB0()
{
  return sub_2519B1D98();
}

uint64_t sub_2519B1CC4()
{
  return sub_2519B1D98();
}

uint64_t sub_2519B1CD8(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_6_1();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2519830FC(a1, v1);
  swift_retain();
  OUTLINED_FUNCTION_9_9();
  return sub_251983164(a1);
}

uint64_t sub_2519B1D84()
{
  return sub_2519B1D98();
}

uint64_t sub_2519B1D98()
{
  return sub_2519C9A20();
}

uint64_t sub_2519B1E04()
{
  return sub_2519B1EFC();
}

uint64_t sub_2519B1E18()
{
  return sub_2519B1E40();
}

uint64_t sub_2519B1E2C()
{
  return sub_2519B1E40();
}

uint64_t sub_2519B1E40()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2519C9A10();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2519B1EAC()
{
  return sub_2519B1F80();
}

uint64_t sub_2519B1EC0()
{
  return sub_2519B1F80();
}

uint64_t sub_2519B1ED4()
{
  return sub_2519B1F80();
}

uint64_t sub_2519B1EE8()
{
  return sub_2519B1EFC();
}

uint64_t sub_2519B1EFC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2519C9A10();
  swift_release();

  return swift_release();
}

uint64_t sub_2519B1F6C()
{
  return sub_2519B1F80();
}

uint64_t sub_2519B1F80()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2519C9A10();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2519B1FEC()
{
  return sub_2519B1EE8();
}

uint64_t sub_2519B2010(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_6_1();
  sub_2519830FC(a1, v1);
  return sub_2519B1CD8(v1);
}

uint64_t SnippetDetailsModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__iconConfigs;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94610);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94620);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = *(void (**)(void))(v3 + 8);
  OUTLINED_FUNCTION_2_7();
  v4();
  OUTLINED_FUNCTION_2_7();
  v4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94638);
  OUTLINED_FUNCTION_0();
  uint64_t v6 = *(void (**)(void))(v5 + 8);
  OUTLINED_FUNCTION_2_7();
  v6();
  OUTLINED_FUNCTION_2_7();
  v6();
  OUTLINED_FUNCTION_2_7();
  v6();
  uint64_t v7 = v0 + OBJC_IVAR____TtC25HomeAutomationUIFramework19SnippetDetailsModel__punchout;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94658);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t))(v8 + 8))(v7);
  OUTLINED_FUNCTION_2_7();
  v6();
  return v0;
}

uint64_t SnippetDetailsModel.__deallocating_deinit()
{
  SnippetDetailsModel.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2519B2260()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_2519B226C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SnippetDetailsModel();
  uint64_t result = sub_2519C99F0();
  *a1 = result;
  return result;
}

uint64_t sub_2519B22AC()
{
  return type metadata accessor for SnippetDetailsModel();
}

uint64_t type metadata accessor for SnippetDetailsModel()
{
  uint64_t result = qword_269B94668;
  if (!qword_269B94668) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2519B22FC()
{
  sub_2519B2478();
  if (v0 <= 0x3F)
  {
    sub_2519B24D0(319, &qword_269B94680);
    if (v1 <= 0x3F)
    {
      sub_2519B24D0(319, &qword_269B94688);
      if (v2 <= 0x3F)
      {
        sub_2519B2518();
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for SnippetDetailsModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SnippetDetailsModel);
}

void sub_2519B2478()
{
  if (!qword_269B94678)
  {
    type metadata accessor for IconConfiguration();
    unint64_t v0 = sub_2519C9A30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B94678);
    }
  }
}

void sub_2519B24D0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2519C9A30();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_2519B2518()
{
  if (!qword_269B94690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B93F18);
    unint64_t v0 = sub_2519C9A30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B94690);
    }
  }
}

uint64_t sub_2519B2574()
{
  OUTLINED_FUNCTION_8_13();
  uint64_t v0 = sub_2519B1F6C();
  return OUTLINED_FUNCTION_7_11(v0);
}

uint64_t sub_2519B259C(unsigned __int8 *a1)
{
  return sub_2519B1D84();
}

uint64_t sub_2519B25C0()
{
  return sub_2519B1EE8();
}

uint64_t sub_2519B25E8()
{
  OUTLINED_FUNCTION_8_13();
  uint64_t v0 = sub_2519B1ED4();
  return OUTLINED_FUNCTION_7_11(v0);
}

uint64_t sub_2519B2610(unsigned __int8 *a1)
{
  return sub_2519B1CC4();
}

uint64_t sub_2519B2634()
{
  OUTLINED_FUNCTION_8_13();
  uint64_t v0 = sub_2519B1EC0();
  return OUTLINED_FUNCTION_7_11(v0);
}

uint64_t sub_2519B265C(unsigned __int8 *a1)
{
  return sub_2519B1CB0();
}

uint64_t sub_2519B2680()
{
  OUTLINED_FUNCTION_8_13();
  uint64_t v0 = sub_2519B1EAC();
  return OUTLINED_FUNCTION_7_11(v0);
}

uint64_t sub_2519B26A8(unsigned __int8 *a1)
{
  return sub_2519B1C9C();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_10@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 120) = a1;
  return sub_2519C9A00();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6_9(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_7_11(uint64_t result)
{
  *uint64_t v1 = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_9_9()
{
  return sub_2519C9A20();
}

unint64_t CompletionSnippetModel.description.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  uint64_t v1 = OUTLINED_FUNCTION_4(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_1();
  uint64_t v5 = v2;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_1();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  sub_2519CA210();
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  sub_2519CA400();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_6_2();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_1();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_2(0x6572676F72506E69);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_1();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_2();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_2();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  sub_2519C9920();
  uint64_t v3 = type metadata accessor for IconConfiguration();
  __swift_getEnumTagSinglePayload(v5, 1, v3);
  sub_251982980(v5, &qword_269B93FC8);
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  return 0xD000000000000017;
}

uint64_t CompletionSnippetModel.secondaryText.getter()
{
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  sub_2519C9920();
  return v1;
}

uint64_t CompletionSnippetModel.iconConfiguration.getter()
{
  return sub_2519C9920();
}

uint64_t CompletionSnippetModel.isBooleanTrueResponse.getter()
{
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  return v1;
}

uint64_t CompletionSnippetModel.isSuccess.getter()
{
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  return v1;
}

uint64_t CompletionSnippetModel.inProgress.getter()
{
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  return v1;
}

uint64_t CompletionSnippetModel.toggleEnabled.getter()
{
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  return v1;
}

uint64_t CompletionSnippetModel.primaryText.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t type metadata accessor for CompletionSnippetModel()
{
  uint64_t result = qword_269B946B0;
  if (!qword_269B946B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CompletionSnippetModel.punchOut.getter()
{
  return sub_2519C9920();
}

uint64_t CompletionSnippetModel.init(primaryText:secondaryText:isBooleanTrueResponse:iconConfiguration:isSuccess:punchOut:inProgress:toggleEnabled:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10, unsigned __int8 a11)
{
  uint64_t v47 = a8;
  int v45 = a5;
  int v46 = a7;
  uint64_t v43 = a4;
  uint64_t v44 = a6;
  uint64_t v41 = a2;
  uint64_t v42 = a3;
  uint64_t v39 = a1;
  int v48 = a10;
  int v49 = a11;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  OUTLINED_FUNCTION_0();
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v36 - v16;
  v36[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  uint64_t v18 = MEMORY[0x270FA5388](v36[0]);
  uint64_t v20 = (char *)v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)v36 - v21;
  uint64_t v23 = type metadata accessor for CompletionSnippetModel();
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  v36[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  sub_2519C9900();
  uint64_t v38 = a9 + *(int *)(v23 + 24);
  LOBYTE(v51) = 2;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  sub_2519C9900();
  uint64_t v24 = type metadata accessor for IconConfiguration();
  __swift_storeEnumTagSinglePayload((uint64_t)v22, 1, 1, v24);
  sub_2519B3370((uint64_t)v22, (uint64_t)v20, &qword_269B93FC8);
  sub_2519C9900();
  sub_251982980((uint64_t)v22, &qword_269B93FC8);
  sub_2519C9820();
  uint64_t v25 = OUTLINED_FUNCTION_26_0();
  __swift_storeEnumTagSinglePayload(v25, v26, v27, v28);
  int v37 = v15;
  sub_2519B3370((uint64_t)v17, (uint64_t)v15, &qword_269B93F18);
  sub_2519C9900();
  sub_251982980((uint64_t)v17, &qword_269B93F18);
  uint64_t v51 = v39;
  uint64_t v52 = v41;
  sub_2519C9900();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v29();
  uint64_t v51 = v42;
  uint64_t v52 = v43;
  sub_2519C9900();
  uint64_t v30 = v44;
  sub_2519B3370(v44, (uint64_t)v22, &qword_269B93FC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v31();
  sub_2519B3370((uint64_t)v22, (uint64_t)v20, &qword_269B93FC8);
  sub_2519C9900();
  sub_251982980((uint64_t)v22, &qword_269B93FC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v32();
  LOBYTE(v51) = v45;
  sub_2519C9900();
  LOBYTE(v51) = v46;
  sub_2519C9900();
  uint64_t v33 = v47;
  sub_2519B3370(v47, (uint64_t)v17, &qword_269B93F18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v34();
  sub_2519B3370((uint64_t)v17, (uint64_t)v37, &qword_269B93F18);
  sub_2519C9900();
  sub_251982980((uint64_t)v17, &qword_269B93F18);
  LOBYTE(v51) = v48;
  sub_2519C9900();
  LOBYTE(v51) = v49;
  sub_2519C9900();
  sub_251982980(v33, &qword_269B93F18);
  return sub_251982980(v30, &qword_269B93FC8);
}

uint64_t sub_2519B3370(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_2519B33CC()
{
  return CompletionSnippetModel.primaryText.setter();
}

uint64_t CompletionSnippetModel.primaryText.setter()
{
  return sub_2519C9930();
}

uint64_t (*CompletionSnippetModel.primaryText.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  *uint64_t v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  v1[4] = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t sub_2519B34A0()
{
  return CompletionSnippetModel.secondaryText.setter();
}

uint64_t CompletionSnippetModel.secondaryText.setter()
{
  return sub_2519C9930();
}

uint64_t (*CompletionSnippetModel.secondaryText.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_11((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t CompletionSnippetModel.isBooleanTrueResponse.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t (*CompletionSnippetModel.isBooleanTrueResponse.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_11((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t CompletionSnippetModel.isSuccess.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t (*CompletionSnippetModel.isSuccess.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_11((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t CompletionSnippetModel.inProgress.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t (*CompletionSnippetModel.inProgress.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_11((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t CompletionSnippetModel.iconConfiguration.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  uint64_t v3 = OUTLINED_FUNCTION_4(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_9_10(v4, v6);
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  sub_2519C9930();
  return sub_251982980(a1, &qword_269B93FC8);
}

uint64_t (*CompletionSnippetModel.iconConfiguration.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_11((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t sub_2519B3868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(uint64_t))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = OUTLINED_FUNCTION_4(v9);
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5();
  uint64_t v13 = v12 - v11;
  sub_2519B3370(a1, v12 - v11, a5);
  return a6(v13);
}

uint64_t CompletionSnippetModel.punchOut.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  uint64_t v3 = OUTLINED_FUNCTION_4(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_9_10(v4, v6);
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  sub_2519C9930();
  return sub_251982980(a1, &qword_269B93F18);
}

uint64_t (*CompletionSnippetModel.punchOut.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_11((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t CompletionSnippetModel.toggleEnabled.setter()
{
  return OUTLINED_FUNCTION_25();
}

uint64_t (*CompletionSnippetModel.toggleEnabled.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_11((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  *(void *)(v0 + 32) = OUTLINED_FUNCTION_8_0();
  return sub_2519796F0;
}

uint64_t sub_2519B3A98()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t sub_2519B3AE8()
{
  return 8;
}

unint64_t sub_2519B3AF0(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7261646E6F636573;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x7365636375537369;
      break;
    case 5:
      unint64_t result = 0x74754F68636E7570;
      break;
    case 6:
      unint64_t result = 0x6572676F72506E69;
      break;
    case 7:
      unint64_t result = 0x6E45656C67676F74;
      break;
    default:
      unint64_t result = 0x547972616D697270;
      break;
  }
  return result;
}

unint64_t sub_2519B3C28(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7261646E6F636573;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x7365636375537369;
      break;
    case 5:
      unint64_t result = 0x74754F68636E7570;
      break;
    case 6:
      unint64_t result = 0x6572676F72506E69;
      break;
    case 7:
      unint64_t result = 0x6E45656C67676F74;
      break;
    default:
      unint64_t result = 0x547972616D697270;
      break;
  }
  return result;
}

uint64_t sub_2519B3D60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2519BE690(*a1, *a2);
}

uint64_t sub_2519B3D6C()
{
  return sub_2519BE9FC();
}

uint64_t sub_2519B3D74(uint64_t a1)
{
  return sub_2519BEBFC(a1, *v1);
}

uint64_t sub_2519B3D7C(uint64_t a1)
{
  return sub_2519BEF1C(a1, *v1);
}

uint64_t sub_2519B3D84@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519B3A98();
  *a1 = result;
  return result;
}

unint64_t sub_2519B3DB4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2519B3AF0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2519B3DE0()
{
  return sub_2519B3C28(*v0);
}

uint64_t sub_2519B3DE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519B3AE4();
  *a1 = result;
  return result;
}

uint64_t sub_2519B3E10@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519B3AE8();
  *a1 = result;
  return result;
}

uint64_t sub_2519B3E38(uint64_t a1)
{
  unint64_t v2 = sub_2519B47B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519B3E74(uint64_t a1)
{
  unint64_t v2 = sub_2519B47B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::String __swiftcall CompletionSnippetModel.responseViewId()()
{
  unint64_t v0 = (void *)0x80000002519CE150;
  uint64_t v1 = 0xD000000000000019;
  result._object = v0;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t CompletionSnippetModel.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = (void *)a1;
  uint64_t v61 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94698);
  OUTLINED_FUNCTION_4_0();
  uint64_t v65 = v4;
  uint64_t v66 = v3;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v74 = v5;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_2();
  uint64_t v60 = v7;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v59 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v59 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_2();
  uint64_t v59 = v15;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v59 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v59 - v20;
  uint64_t v22 = (int *)type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_7_2();
  uint64_t v25 = v2 + *(int *)(v24 + 20);
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
  uint64_t v73 = v25;
  uint64_t v63 = v26;
  sub_2519C9900();
  uint64_t v27 = v2 + v22[6];
  LOBYTE(v75) = 2;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  uint64_t v72 = v27;
  uint64_t v64 = v28;
  sub_2519C9900();
  uint64_t v29 = v2 + v22[9];
  type metadata accessor for IconConfiguration();
  uint64_t v30 = OUTLINED_FUNCTION_26_0();
  uint64_t v62 = v31;
  __swift_storeEnumTagSinglePayload(v30, v32, v33, v31);
  sub_2519B3370((uint64_t)v21, (uint64_t)v19, &qword_269B93FC8);
  uint64_t v70 = v29;
  sub_2519C9900();
  sub_251982980((uint64_t)v21, &qword_269B93FC8);
  uint64_t v71 = v22;
  uint64_t v34 = v2 + v22[10];
  uint64_t v35 = sub_2519C9820();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v35);
  sub_2519B3370((uint64_t)v13, (uint64_t)v11, &qword_269B93F18);
  uint64_t v67 = v34;
  int v36 = v77;
  sub_2519C9900();
  sub_251982980((uint64_t)v13, &qword_269B93F18);
  __swift_project_boxed_opaque_existential_1(v36, v36[3]);
  sub_2519B47B8();
  uint64_t v37 = v69;
  sub_2519CA550();
  if (v37)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v39();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v40();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v41();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    return v42();
  }
  else
  {
    uint64_t v68 = (uint64_t)v13;
    uint64_t v69 = v2;
    uint64_t v38 = v65;
    LOBYTE(v75) = 0;
    uint64_t v75 = sub_2519CA460();
    uint64_t v76 = v43;
    sub_2519C9900();
    LOBYTE(v75) = 1;
    uint64_t v44 = sub_2519CA460();
    uint64_t v46 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v47();
    uint64_t v75 = v44;
    uint64_t v76 = v46;
    sub_2519C9900();
    LOBYTE(v75) = 2;
    LOBYTE(v46) = sub_2519CA470() & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_5_1();
    v48();
    LOBYTE(v75) = v46;
    sub_2519C9900();
    uint64_t v49 = OUTLINED_FUNCTION_10_7(4);
    OUTLINED_FUNCTION_14_1(v49);
    sub_2519C9900();
    uint64_t v50 = OUTLINED_FUNCTION_10_7(7);
    OUTLINED_FUNCTION_14_1(v50);
    sub_2519C9900();
    uint64_t v51 = OUTLINED_FUNCTION_10_7(6);
    OUTLINED_FUNCTION_14_1(v51);
    sub_2519C9900();
    LOBYTE(v75) = 3;
    sub_2519B51AC(&qword_269B93C28, (void (*)(uint64_t))type metadata accessor for IconConfiguration);
    OUTLINED_FUNCTION_19_1();
    uint64_t v52 = v59;
    sub_2519CA480();
    uint64_t v53 = v60;
    __swift_storeEnumTagSinglePayload(v52, 0, 1, v62);
    sub_2519B3370(v52, (uint64_t)v21, &qword_269B93FC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
    sub_2519C9930();
    sub_251982980(v52, &qword_269B93FC8);
    LOBYTE(v75) = 5;
    sub_2519B51AC(&qword_269B93F40, MEMORY[0x263F06EA8]);
    OUTLINED_FUNCTION_19_1();
    uint64_t v54 = v66;
    sub_2519CA480();
    uint64_t v55 = v61;
    uint64_t v56 = v68;
    __swift_storeEnumTagSinglePayload(v53, 0, 1, v35);
    sub_2519B3370(v53, v56, &qword_269B93F18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    sub_2519C9930();
    sub_251982980(v53, &qword_269B93F18);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v74, v54);
    uint64_t v57 = v69;
    sub_2519B4804(v69, v55);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
    return sub_2519B50C8(v57, (void (*)(void))type metadata accessor for CompletionSnippetModel);
  }
}

unint64_t sub_2519B47B8()
{
  unint64_t result = qword_269B946A0;
  if (!qword_269B946A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946A0);
  }
  return result;
}

uint64_t sub_2519B4804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CompletionSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CompletionSnippetModel.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F18);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_1();
  uint64_t v14 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B946A8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_7_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519B47B8();
  sub_2519CA560();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA4B0();
  if (v15)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for CompletionSnippetModel();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    sub_2519C9920();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F20);
    sub_251984094((unint64_t *)&qword_269B93F50, &qword_269B93F20);
    OUTLINED_FUNCTION_20_0();
    sub_2519CA4D0();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    sub_2519C9920();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
    sub_251984094(&qword_269B93F58, &qword_269B93F28);
    OUTLINED_FUNCTION_20_0();
    sub_2519CA4D0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    sub_2519C9920();
    OUTLINED_FUNCTION_6_10(4);
    sub_2519C9920();
    OUTLINED_FUNCTION_6_10(7);
    sub_2519C9920();
    OUTLINED_FUNCTION_6_10(6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
    sub_2519C9920();
    sub_2519876F0();
    OUTLINED_FUNCTION_19_1();
    sub_2519CA4D0();
    sub_251982980(v8, &qword_269B93FC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    sub_2519C9920();
    sub_2519840F8();
    OUTLINED_FUNCTION_19_1();
    sub_2519CA4D0();
    sub_251982980(v14, &qword_269B93F18);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
  }
}

uint64_t CompletionSnippetModel.stringId.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  uint64_t v1 = OUTLINED_FUNCTION_4(v0);
  MEMORY[0x270FA5388](v1);
  OUTLINED_FUNCTION_5();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = type metadata accessor for IconConfiguration();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_5();
  uint64_t v9 = v8 - v7;
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  strcpy((char *)v12, "#primaryText: ");
  HIBYTE(v12[1]) = -18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_2(0x6563637553736923);
  type metadata accessor for CompletionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_2519CA3B0();
  sub_2519CA210();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  sub_2519C9920();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F28);
  sub_2519CA400();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  strcpy((char *)v11, "#inProgress: ");
  HIWORD(v11[1]) = -4864;
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  sub_2519C9920();
  if (__swift_getEnumTagSinglePayload(v4, 1, v5) == 1)
  {
    sub_251982980(v4, &qword_269B93FC8);
  }
  else
  {
    sub_2519AAAB8(v4, v9);
    strcpy((char *)v11, "#iconName: ");
    HIDWORD(v11[1]) = -352321536;
    sub_2519C9920();
    sub_2519CA210();
    swift_bridgeObjectRelease();
    sub_2519CA210();
    swift_bridgeObjectRelease();
    sub_2519B50C8(v9, (void (*)(void))type metadata accessor for IconConfiguration);
  }
  return v12[0];
}

uint64_t sub_2519B50C8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

uint64_t sub_2519B511C()
{
  return sub_2519B51AC(&qword_269B940F0, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
}

uint64_t sub_2519B5164()
{
  return sub_2519B51AC(&qword_269B940F8, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
}

uint64_t sub_2519B51AC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519B51F4()
{
  return sub_2519C98D0();
}

uint64_t sub_2519B52BC()
{
  return sub_2519C98C0();
}

uint64_t sub_2519B536C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return CompletionSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_2519B5384(void *a1)
{
  return CompletionSnippetModel.encode(to:)(a1);
}

uint64_t sub_2519B539C()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = CompletionSnippetModel.primaryText.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2519B53C8()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = CompletionSnippetModel.secondaryText.getter();
  *uint64_t v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t sub_2519B53F4()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = CompletionSnippetModel.isBooleanTrueResponse.getter();
  *uint64_t v0 = result;
  return result;
}

uint64_t sub_2519B541C(unsigned __int8 *a1)
{
  return CompletionSnippetModel.isBooleanTrueResponse.setter();
}

uint64_t sub_2519B5440()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = CompletionSnippetModel.isSuccess.getter();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_2519B546C(unsigned __int8 *a1)
{
  return CompletionSnippetModel.isSuccess.setter();
}

uint64_t sub_2519B5490()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = CompletionSnippetModel.inProgress.getter();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_2519B54BC(unsigned __int8 *a1)
{
  return CompletionSnippetModel.inProgress.setter();
}

uint64_t sub_2519B54E0()
{
  return CompletionSnippetModel.iconConfiguration.getter();
}

uint64_t sub_2519B5504(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2519B3868(a1, a2, a3, a4, &qword_269B93FC8, CompletionSnippetModel.iconConfiguration.setter);
}

uint64_t sub_2519B5538()
{
  return CompletionSnippetModel.punchOut.getter();
}

uint64_t sub_2519B555C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2519B3868(a1, a2, a3, a4, &qword_269B93F18, CompletionSnippetModel.punchOut.setter);
}

uint64_t sub_2519B5590()
{
  OUTLINED_FUNCTION_9();
  uint64_t result = CompletionSnippetModel.toggleEnabled.getter();
  *uint64_t v0 = result & 1;
  return result;
}

uint64_t sub_2519B55BC(unsigned __int8 *a1)
{
  return CompletionSnippetModel.toggleEnabled.setter();
}

char *initializeBufferWithCopyOfBuffer for CompletionSnippetModel(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v29 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[6];
    uint64_t v13 = &a1[v12];
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    uint64_t v16 = a3[7];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
    v20(v17, v18, v19);
    v20(&a1[a3[8]], (char *)a2 + a3[8], v19);
    uint64_t v21 = a3[9];
    uint64_t v22 = &a1[v21];
    uint64_t v23 = (char *)a2 + v21;
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    uint64_t v25 = a3[10];
    uint64_t v26 = &a1[v25];
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    v20(&a1[a3[11]], (char *)a2 + a3[11], v19);
  }
  return a1;
}

uint64_t destroy for CompletionSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v17)((void *)(v10 - 8), v9, v10);
  v17(a1 + a2[8], v10);
  uint64_t v11 = a1 + a2[9];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = a1 + a2[10];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  uint64_t v15 = a1 + a2[11];

  return ((uint64_t (*)(uint64_t, uint64_t))v17)(v15, v10);
}

uint64_t initializeWithCopy for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t assignWithCopy for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t initializeWithTake for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t assignWithTake for CompletionSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[6];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40);
  v19(v16, v17, v18);
  v19(a1 + a3[8], a2 + a3[8], v18);
  uint64_t v20 = a3[9];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  uint64_t v24 = a3[10];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 40))(v25, v26, v27);
  v19(a1 + a3[11], a2 + a3[11], v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519B6384);
}

uint64_t sub_2519B6384(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v11 + 84) == a2)
    {
      uint64_t v8 = v10;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v8 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        OUTLINED_FUNCTION_0_0();
        if (*(_DWORD *)(v16 + 84) == a2)
        {
          uint64_t v8 = v15;
          uint64_t v12 = a3[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
          OUTLINED_FUNCTION_0_0();
          if (*(_DWORD *)(v18 + 84) == a2)
          {
            uint64_t v8 = v17;
            uint64_t v12 = a3[9];
          }
          else
          {
            uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
            uint64_t v12 = a3[10];
          }
        }
      }
    }
    uint64_t v9 = a1 + v12;
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CompletionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519B64BC);
}

uint64_t sub_2519B64BC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      OUTLINED_FUNCTION_0_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        OUTLINED_FUNCTION_0_0();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[7];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
          OUTLINED_FUNCTION_0_0();
          if (*(_DWORD *)(v20 + 84) == a3)
          {
            uint64_t v10 = v19;
            uint64_t v14 = a4[9];
          }
          else
          {
            uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
            uint64_t v14 = a4[10];
          }
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }

  return __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_2519B65E8()
{
  sub_25197C958(319, (unint64_t *)&qword_269B93C78);
  if (v0 <= 0x3F)
  {
    sub_2519857E4(319, &qword_269B93F90, &qword_269B93F20);
    if (v1 <= 0x3F)
    {
      sub_2519857E4(319, &qword_269B93F98, &qword_269B93F28);
      if (v2 <= 0x3F)
      {
        sub_25197C958(319, &qword_269B93C90);
        if (v3 <= 0x3F)
        {
          sub_2519857E4(319, &qword_269B946C0, &qword_269B93FC8);
          if (v4 <= 0x3F)
          {
            sub_2519857E4(319, &qword_269B93FA0, &qword_269B93F18);
            if (v5 <= 0x3F) {
              swift_initStructMetadata();
            }
          }
        }
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for CompletionSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 7) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v5 = v6 - 8;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for CompletionSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519B6954);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CompletionSnippetModel.CodingKeys()
{
  return &type metadata for CompletionSnippetModel.CodingKeys;
}

unint64_t sub_2519B6990()
{
  unint64_t result = qword_269B946C8;
  if (!qword_269B946C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946C8);
  }
  return result;
}

unint64_t sub_2519B69E0()
{
  unint64_t result = qword_269B946D0;
  if (!qword_269B946D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946D0);
  }
  return result;
}

unint64_t sub_2519B6A30()
{
  unint64_t result = qword_269B946D8;
  if (!qword_269B946D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946D8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_11(uint64_t a1)
{
  *unint64_t v1 = a1;
  return type metadata accessor for CompletionSnippetModel();
}

uint64_t OUTLINED_FUNCTION_6_10@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_2519CA4C0();
}

uint64_t OUTLINED_FUNCTION_9_10@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_2519B3370(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
}

uint64_t OUTLINED_FUNCTION_10_7@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 96) = a1;
  return sub_2519CA470();
}

uint64_t OUTLINED_FUNCTION_14_1(uint64_t result)
{
  *(unsigned char *)(v1 - 96) = result & 1;
  return result;
}

void OUTLINED_FUNCTION_18_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 112) = a1;
  *(void *)(v1 - 104) = 0xEC000000203A7373;
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_23_1(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return type metadata accessor for CompletionSnippetModel();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return sub_2519CA210();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return v0;
}

HomeAutomationUIFramework::SnippetRenderingMode_optional __swiftcall SnippetRenderingMode.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_2519CA430();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t SnippetRenderingMode.rawValue.getter()
{
  return *(void *)&aHierarchmultic[8 * *v0];
}

uint64_t sub_2519B6C34()
{
  return sub_2519BE6A8();
}

uint64_t sub_2519B6C40()
{
  return sub_2519BEA5C();
}

uint64_t sub_2519B6C48()
{
  return sub_2519BEC14();
}

uint64_t sub_2519B6C50(uint64_t a1)
{
  return sub_2519BEEB8(a1, *v1);
}

HomeAutomationUIFramework::SnippetRenderingMode_optional sub_2519B6C58(Swift::String *a1)
{
  return SnippetRenderingMode.init(rawValue:)(*a1);
}

uint64_t sub_2519B6C64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SnippetRenderingMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2519B6C8C()
{
  return sub_2519CA280();
}

uint64_t sub_2519B6CDC()
{
  return sub_2519CA290();
}

HomeAutomationUIFramework::SnippetHomeDeviceType_optional __swiftcall SnippetHomeDeviceType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_2519CA510();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 30;
  switch(v3)
  {
    case 0:
      goto LABEL_32;
    case 1:
      char v5 = 1;
      goto LABEL_32;
    case 2:
      char v5 = 2;
      goto LABEL_32;
    case 3:
      char v5 = 3;
      goto LABEL_32;
    case 4:
      char v5 = 4;
      goto LABEL_32;
    case 5:
      char v5 = 5;
      goto LABEL_32;
    case 6:
      char v5 = 6;
      goto LABEL_32;
    case 7:
      char v5 = 7;
      goto LABEL_32;
    case 8:
      char v5 = 8;
      goto LABEL_32;
    case 9:
      char v5 = 9;
      goto LABEL_32;
    case 10:
      char v5 = 10;
      goto LABEL_32;
    case 11:
      char v5 = 11;
      goto LABEL_32;
    case 12:
      char v5 = 12;
      goto LABEL_32;
    case 13:
      char v5 = 13;
      goto LABEL_32;
    case 14:
      char v5 = 14;
      goto LABEL_32;
    case 15:
      char v5 = 15;
      goto LABEL_32;
    case 16:
      char v5 = 16;
      goto LABEL_32;
    case 17:
      char v5 = 17;
      goto LABEL_32;
    case 18:
      char v5 = 18;
      goto LABEL_32;
    case 19:
      char v5 = 19;
      goto LABEL_32;
    case 20:
      char v5 = 20;
      goto LABEL_32;
    case 21:
      char v5 = 21;
      goto LABEL_32;
    case 22:
      char v5 = 22;
      goto LABEL_32;
    case 23:
      char v5 = 23;
      goto LABEL_32;
    case 24:
      char v5 = 24;
      goto LABEL_32;
    case 25:
      char v5 = 25;
      goto LABEL_32;
    case 26:
      char v5 = 26;
      goto LABEL_32;
    case 27:
      char v5 = 27;
      goto LABEL_32;
    case 28:
      char v5 = 28;
      goto LABEL_32;
    case 29:
      char v5 = 29;
LABEL_32:
      char v6 = v5;
      break;
    case 30:
      break;
    case 31:
      char v6 = 31;
      break;
    case 32:
      char v6 = 32;
      break;
    case 33:
      char v6 = 33;
      break;
    case 34:
      char v6 = 34;
      break;
    case 35:
      char v6 = 35;
      break;
    case 36:
      char v6 = 36;
      break;
    case 37:
      char v6 = 37;
      break;
    case 38:
      char v6 = 38;
      break;
    case 39:
      char v6 = 39;
      break;
    case 40:
      char v6 = 40;
      break;
    case 41:
      char v6 = 41;
      break;
    case 42:
      char v6 = 42;
      break;
    case 43:
      char v6 = 43;
      break;
    case 44:
      char v6 = 44;
      break;
    case 45:
      char v6 = 45;
      break;
    case 46:
      char v6 = 46;
      break;
    case 47:
      char v6 = 47;
      break;
    default:
      char v6 = 48;
      break;
  }
  *uint64_t v2 = v6;
  return result;
}

uint64_t SnippetHomeDeviceType.rawValue.getter()
{
  uint64_t result = 0xD000000000000010;
  switch(*v0)
  {
    case 1:
      return 0x686374697773;
    case 2:
      return 0x74736F6D72656874;
    case 3:
    case 7:
      return result;
    case 4:
      return 7233894;
    case 5:
      uint64_t v2 = 1819571567;
      return v2 & 0xFFFF0000FFFFFFFFLL | 0x746500000000;
    case 6:
      return 0x6B636F4C726F6F64;
    case 8:
      return 0x79726574746162;
    case 9:
      return 0xD000000000000013;
    case 0xA:
      return 0xD000000000000014;
    case 0xB:
      return 0x53746361746E6F63;
    case 0xC:
      return 1919905636;
    case 0xD:
      uint64_t v3 = 0x6964696D7568;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7974000000000000;
    case 0xE:
      return 0x736E65536B61656CLL;
    case 0xF:
      uint64_t v4 = 0x53746867696CLL;
      return v4 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
    case 0x10:
      return 0x65536E6F69746F6DLL;
    case 0x11:
      return 0x636E61707563636FLL;
    case 0x12:
      uint64_t v3 = 0x697275636573;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7974000000000000;
    case 0x13:
      uint64_t v4 = 0x53656B6F6D73;
      return v4 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
    case 0x14:
      return 0xD000000000000011;
    case 0x15:
      return 0x776F646E6977;
    case 0x16:
      return 0x736564616873;
    case 0x17:
      return 0x6172656D61437069;
    case 0x18:
      return 0x6F68706F7263696DLL;
    case 0x19:
      return 0x72656B61657073;
    case 0x1A:
    case 0x1B:
      return 0x657A69726F746F6DLL;
    case 0x1C:
      return 0x6F43726574616568;
    case 0x1D:
      return 0xD000000000000016;
    case 0x1E:
      return 1952541811;
    case 0x1F:
      return 0x656C6B6E69727073;
    case 0x20:
      return 0x65766C6176;
    case 0x21:
      uint64_t v2 = 1668637030;
      return v2 & 0xFFFF0000FFFFFFFFLL | 0x746500000000;
    case 0x22:
      uint64_t v5 = 2003789939;
      goto LABEL_41;
    case 0x23:
      return 0x69736976656C6574;
    case 0x24:
      return 0x6C6C6542726F6F64;
    case 0x25:
      return 0x6669727550726961;
    case 0x26:
      uint64_t v5 = 1953261926;
LABEL_41:
      uint64_t result = v5 & 0xFFFF0000FFFFFFFFLL | 0x726500000000;
      break;
    case 0x27:
      uint64_t result = 0x5654656C707061;
      break;
    case 0x28:
      uint64_t result = 0x65526172656D6163;
      break;
    case 0x29:
      uint64_t result = 1802398067;
      break;
    case 0x2A:
      uint64_t result = 0x706F4D746F626F72;
      break;
    case 0x2B:
      uint64_t result = 0xD000000000000012;
      break;
    case 0x2C:
      uint64_t result = 0x74726F70726961;
      break;
    case 0x2D:
      uint64_t result = 0x726F736E6573;
      break;
    case 0x2E:
      uint64_t result = 0x6D6F74737563;
      break;
    case 0x2F:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      uint64_t result = 0x6C7562746867696CLL;
      break;
  }
  return result;
}

unint64_t sub_2519B7570()
{
  unint64_t result = qword_269B946E0;
  if (!qword_269B946E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946E0);
  }
  return result;
}

uint64_t sub_2519B75BC()
{
  return sub_2519BE8A4();
}

unint64_t sub_2519B75CC()
{
  unint64_t result = qword_269B946E8;
  if (!qword_269B946E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946E8);
  }
  return result;
}

uint64_t sub_2519B7618()
{
  return sub_2519BEAB4();
}

uint64_t sub_2519B7620()
{
  return sub_2519BED6C();
}

uint64_t sub_2519B7628()
{
  return sub_2519BEDB8();
}

HomeAutomationUIFramework::SnippetHomeDeviceType_optional sub_2519B7630(Swift::String *a1)
{
  return SnippetHomeDeviceType.init(rawValue:)(*a1);
}

uint64_t sub_2519B763C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SnippetHomeDeviceType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2519B7664()
{
  return sub_2519CA280();
}

uint64_t sub_2519B76B4()
{
  return sub_2519CA290();
}

unsigned char *storeEnumTagSinglePayload for SnippetRenderingMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519B77E0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SnippetRenderingMode()
{
  return &type metadata for SnippetRenderingMode;
}

uint64_t getEnumTagSinglePayload for SnippetHomeDeviceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD1)
  {
    if (a2 + 47 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 47) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 48;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x30;
  int v5 = v6 - 48;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SnippetHomeDeviceType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 47 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 47) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD0)
  {
    unsigned int v6 = ((a2 - 209) >> 8) + 1;
    *uint64_t result = a2 + 47;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519B796CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 47;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SnippetHomeDeviceType()
{
  return &type metadata for SnippetHomeDeviceType;
}

unint64_t sub_2519B79A4()
{
  unint64_t result = qword_269B946F0;
  if (!qword_269B946F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946F0);
  }
  return result;
}

unint64_t sub_2519B79F0()
{
  unint64_t result = qword_269B946F8;
  if (!qword_269B946F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B946F8);
  }
  return result;
}

uint64_t static Signpost.begin(logging:_:)(void *a1)
{
  id v1 = a1;
  sub_2519C99A0();
  sub_2519CA300();

  return sub_2519C9990();
}

uint64_t static Signpost.end(logging:_:_:_:)()
{
  return sub_2519C9980();
}

void static Signpost.general.getter()
{
}

void static Signpost.Name.temperatureView.getter()
{
}

void static Signpost.Name.completionView.getter()
{
}

void static Signpost.Name.automationView.getter()
{
}

void static Signpost.Name.disambiguationView.getter()
{
}

void static Signpost.Name.confirmationView.getter()
{
}

void static Signpost.Name.callToActionView.getter()
{
}

uint64_t static Signpost.generateSignpostID(for:)(void *a1)
{
  id v1 = a1;

  return sub_2519C99A0();
}

ValueMetadata *type metadata accessor for Signpost()
{
  return &type metadata for Signpost;
}

ValueMetadata *type metadata accessor for Signpost.Name()
{
  return &type metadata for Signpost.Name;
}

uint64_t *sub_2519B7C20(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a3;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = type metadata accessor for DisambiguationSnippetModel(0);
    *(uint64_t *)((char *)a1 + *(int *)(v9 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 20));
    uint64_t v10 = *(int *)(v9 + 24);
    uint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    uint64_t v13 = type metadata accessor for DisambiguationOption(0);
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
      memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      uint64_t v16 = v12[1];
      *uint64_t v11 = *v12;
      v11[1] = v16;
      uint64_t v17 = v13;
      uint64_t v18 = v12[3];
      void v11[2] = v12[2];
      v11[3] = v18;
      uint64_t v72 = v6;
      uint64_t v73 = v17;
      uint64_t v19 = *(int *)(v17 + 24);
      uint64_t v74 = v11;
      __dst = (char *)v11 + v19;
      uint64_t v20 = (char *)v12 + v19;
      uint64_t v21 = (int *)type metadata accessor for IconConfiguration();
      uint64_t v22 = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, (uint64_t)v21))
      {
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
        memcpy(__dst, v20, *(void *)(*(void *)(v23 - 8) + 64));
        uint64_t v25 = v73;
        uint64_t v24 = (uint64_t)v74;
        uint64_t v6 = v72;
      }
      else
      {
        v8((uint64_t *)__dst, (uint64_t *)v20, v7);
        uint64_t v26 = v21[5];
        uint64_t v27 = &__dst[v26];
        uint64_t v28 = &v20[v26];
        uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v71 = *(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16);
        v71(v27, v28, v70);
        uint64_t v29 = v21[6];
        uint64_t v30 = &__dst[v29];
        uint64_t v31 = &v20[v29];
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
        uint64_t v33 = v21[7];
        uint64_t v68 = &__dst[v33];
        uint64_t v34 = &v20[v33];
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        int v36 = *(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16);
        v36(v68, v34, v35);
        v36(&__dst[v21[8]], &v20[v21[8]], v35);
        uint64_t v37 = v21[9];
        uint64_t v38 = &__dst[v37];
        uint64_t v39 = &v20[v37];
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
        v71(&__dst[v21[10]], &v20[v21[10]], v70);
        uint64_t v41 = v21[11];
        uint64_t v69 = &__dst[v41];
        uint64_t v42 = &v20[v41];
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        uint64_t v44 = v42;
        uint64_t v45 = (uint64_t)v21;
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v69, v44, v43);
        v71(&__dst[v21[12]], &v20[v21[12]], v70);
        v71(&__dst[v21[13]], &v20[v21[13]], v70);
        uint64_t v46 = v21[14];
        uint64_t v47 = &__dst[v46];
        int v48 = &v22[v46];
        uint64_t v49 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v48, 1, v49))
        {
          uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
          memcpy(v47, v48, *(void *)(*(void *)(v50 - 8) + 64));
        }
        else
        {
          uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v47, v48, v51);
          __swift_storeEnumTagSinglePayload((uint64_t)v47, 0, 1, v49);
        }
        uint64_t v25 = v73;
        uint64_t v24 = (uint64_t)v74;
        uint64_t v6 = v72;
        __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v45);
      }
      uint64_t v52 = *(int *)(v25 + 28);
      uint64_t v53 = v24 + v52;
      uint64_t v54 = (char *)v12 + v52;
      uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v55 - 8) + 16))(v53, v54, v55);
      __swift_storeEnumTagSinglePayload(v24, 0, 1, v25);
    }
    uint64_t v56 = *(int *)(v6 + 20);
    uint64_t v57 = *(int *)(v6 + 24);
    uint64_t v58 = (uint64_t *)((char *)a1 + v56);
    uint64_t v59 = (char *)a2 + v56;
    uint64_t v61 = *(void **)v59;
    uint64_t v60 = *((void *)v59 + 1);
    *uint64_t v58 = v61;
    v58[1] = v60;
    uint64_t v62 = (char *)a1 + v57;
    uint64_t v63 = (char *)a2 + v57;
    uint64_t v64 = sub_2519C99B0();
    uint64_t v65 = *(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16);
    id v66 = v61;
    v65(v62, v63, v64);
  }
  return a1;
}

uint64_t sub_2519B81C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = type metadata accessor for DisambiguationSnippetModel(0);
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + *(int *)(v6 + 24);
  uint64_t v8 = type metadata accessor for DisambiguationOption(0);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = v7 + *(int *)(v8 + 24);
    uint64_t v10 = (int *)type metadata accessor for IconConfiguration();
    if (!__swift_getEnumTagSinglePayload(v9, 1, (uint64_t)v10))
    {
      v5(v9, v4);
      uint64_t v11 = v9 + v10[5];
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v31 = *(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8);
      v31(v11, v30);
      uint64_t v12 = v9 + v10[6];
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
      uint64_t v14 = v9 + v10[7];
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
      v16(v14, v15);
      v16(v9 + v10[8], v15);
      uint64_t v17 = v9 + v10[9];
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
      v31(v9 + v10[10], v30);
      uint64_t v19 = v9 + v10[11];
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
      v31(v9 + v10[12], v30);
      v31(v9 + v10[13], v30);
      uint64_t v21 = v9 + v10[14];
      uint64_t v22 = type metadata accessor for DirectInvocationConfig();
      if (!__swift_getEnumTagSinglePayload(v21, 1, v22))
      {
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v21, v23);
      }
    }
    uint64_t v24 = v7 + *(int *)(v8 + 28);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  }

  uint64_t v26 = a1 + *(int *)(a2 + 24);
  uint64_t v27 = sub_2519C99B0();
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8);

  return v28(v26, v27);
}

uint64_t sub_2519B85A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for DisambiguationSnippetModel(0);
  *(void *)(a1 + *(int *)(v8 + 20)) = *(void *)(a2 + *(int *)(v8 + 20));
  uint64_t v9 = *(int *)(v8 + 24);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for DisambiguationOption(0);
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v69 = v12;
    uint64_t v70 = a3;
    uint64_t v14 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v14;
    uint64_t v15 = v11[3];
    v10[2] = v11[2];
    v10[3] = v15;
    uint64_t v16 = *(int *)(v12 + 24);
    uint64_t v67 = v10;
    __dst = (char *)v10 + v16;
    uint64_t v17 = (char *)v11 + v16;
    uint64_t v18 = type metadata accessor for IconConfiguration();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v19 = (int *)v18;
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(__dst, v17, *(void *)(*(void *)(v20 - 8) + 64));
      uint64_t v21 = v69;
      uint64_t v22 = (uint64_t)v67;
    }
    else
    {
      v7((uint64_t)__dst, (uint64_t)v17, v6);
      uint64_t v23 = *(int *)(v18 + 20);
      uint64_t v24 = &__dst[v23];
      uint64_t v25 = &v17[v23];
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      id v66 = *(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 16);
      v66(v24, v25, v65);
      uint64_t v26 = v19[6];
      uint64_t v27 = &__dst[v26];
      uint64_t v28 = &v17[v26];
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
      uint64_t v30 = v19[7];
      uint64_t v63 = &__dst[v30];
      uint64_t v31 = &v17[v30];
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
      v33(v63, v31, v32);
      v33(&__dst[v19[8]], &v17[v19[8]], v32);
      uint64_t v34 = v19[9];
      uint64_t v35 = &__dst[v34];
      int v36 = &v17[v34];
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
      v66(&__dst[v19[10]], &v17[v19[10]], v65);
      uint64_t v38 = v19[11];
      uint64_t v39 = &__dst[v38];
      uint64_t v64 = &v17[v38];
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v39, v64, v40);
      v66(&__dst[v19[12]], &v17[v19[12]], v65);
      v66(&__dst[v19[13]], &v17[v19[13]], v65);
      uint64_t v41 = v19[14];
      uint64_t v42 = &__dst[v41];
      uint64_t v43 = &v17[v41];
      uint64_t v44 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v43, 1, v44))
      {
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v42, v43, *(void *)(*(void *)(v45 - 8) + 64));
      }
      else
      {
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v42, v43, v46);
        __swift_storeEnumTagSinglePayload((uint64_t)v42, 0, 1, v44);
      }
      uint64_t v22 = (uint64_t)v67;
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, (uint64_t)v19);
      uint64_t v21 = v69;
    }
    uint64_t v47 = *(int *)(v21 + 28);
    uint64_t v48 = v22 + v47;
    uint64_t v49 = (char *)v11 + v47;
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
    __swift_storeEnumTagSinglePayload(v22, 0, 1, v21);
    a3 = v70;
  }
  uint64_t v51 = *(int *)(a3 + 20);
  uint64_t v52 = *(int *)(a3 + 24);
  uint64_t v53 = (void *)(a1 + v51);
  uint64_t v54 = a2 + v51;
  uint64_t v56 = *(void **)v54;
  uint64_t v55 = *(void *)(v54 + 8);
  *uint64_t v53 = v56;
  v53[1] = v55;
  uint64_t v57 = a1 + v52;
  uint64_t v58 = a2 + v52;
  uint64_t v59 = sub_2519C99B0();
  uint64_t v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16);
  id v61 = v56;
  v60(v57, v58, v59);
  return a1;
}

uint64_t sub_2519B8AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = type metadata accessor for DisambiguationSnippetModel(0);
  *(void *)(a1 + *(int *)(v9 + 20)) = *(void *)(a2 + *(int *)(v9 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(v9 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v142 = a2;
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for DisambiguationOption(0);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  uint64_t v141 = v13;
  int v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!EnumTagSinglePayload)
  {
    if (v15)
    {
      sub_2519BE3B8((uint64_t)v11, (void (*)(void))type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    uint64_t v140 = a3;
    *uint64_t v11 = *v12;
    v11[1] = v12[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    void v11[2] = v12[2];
    v11[3] = v12[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(int *)(v13 + 24);
    uint64_t v25 = (char *)v11 + v24;
    uint64_t v138 = v12;
    uint64_t v26 = (char *)v12 + v24;
    uint64_t v27 = (int *)type metadata accessor for IconConfiguration();
    int v28 = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, (uint64_t)v27);
    int v29 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, (uint64_t)v27);
    if (v28)
    {
      if (!v29)
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v25, v26, v6);
        uint64_t v30 = v27[5];
        uint64_t v31 = &v25[v30];
        uint64_t v32 = &v26[v30];
        uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        long long v132 = *(void (**)(char *, char *, uint64_t))(*(void *)(v135 - 8) + 16);
        v132(v31, v32, v135);
        uint64_t v33 = v27[6];
        uint64_t v34 = &v25[v33];
        uint64_t v35 = &v26[v33];
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
        uint64_t v37 = v27[7];
        long long v129 = &v25[v37];
        uint64_t v38 = &v26[v37];
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        uint64_t v40 = *(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16);
        v40(v129, v38, v39);
        v40(&v25[v27[8]], &v26[v27[8]], v39);
        uint64_t v41 = v27[9];
        uint64_t v42 = &v25[v41];
        uint64_t v43 = &v26[v41];
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
        v132(&v25[v27[10]], &v26[v27[10]], v135);
        uint64_t v45 = v27[11];
        uint64_t v46 = &v25[v45];
        uint64_t v47 = &v26[v45];
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
        v132(&v25[v27[12]], &v26[v27[12]], v135);
        v132(&v25[v27[13]], &v26[v27[13]], v135);
        uint64_t v49 = v27[14];
        uint64_t v50 = &v25[v49];
        uint64_t v51 = &v26[v49];
        uint64_t v52 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v51, 1, v52))
        {
          uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
          memcpy(v50, v51, *(void *)(*(void *)(v53 - 8) + 64));
        }
        else
        {
          uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v111 - 8) + 16))(v50, v51, v111);
          __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v52);
        }
        uint64_t v22 = v142;
        __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, (uint64_t)v27);
        uint64_t v80 = v138;
        a3 = v140;
        goto LABEL_29;
      }
      goto LABEL_16;
    }
    if (v29)
    {
      sub_2519BE3B8((uint64_t)v25, (void (*)(void))type metadata accessor for IconConfiguration);
LABEL_16:
      uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(v25, v26, *(void *)(*(void *)(v79 - 8) + 64));
      uint64_t v80 = v138;
      a3 = v140;
      uint64_t v22 = v142;
LABEL_29:
      uint64_t v113 = *(int *)(v141 + 28);
      uint64_t v114 = (char *)v11 + v113;
      uint64_t v115 = (uint64_t)v80 + v113;
      uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v116 - 8) + 24))(v114, v115, v116);
      goto LABEL_30;
    }
    v8((uint64_t)v25, (uint64_t)v26, v6);
    uint64_t v86 = v27[5];
    uint64_t v87 = &v25[v86];
    uint64_t v88 = &v26[v86];
    uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v134 = *(void (**)(char *, char *, uint64_t))(*(void *)(v136 - 8) + 24);
    v134(v87, v88, v136);
    uint64_t v89 = v27[6];
    uint64_t v90 = &v25[v89];
    uint64_t v91 = &v26[v89];
    uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v92 - 8) + 24))(v90, v91, v92);
    uint64_t v93 = v27[7];
    long long v131 = &v25[v93];
    uint64_t v94 = &v26[v93];
    uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v96 = *(void (**)(char *, char *, uint64_t))(*(void *)(v95 - 8) + 24);
    v96(v131, v94, v95);
    v96(&v25[v27[8]], &v26[v27[8]], v95);
    uint64_t v97 = v27[9];
    uint64_t v98 = &v25[v97];
    uint64_t v99 = &v26[v97];
    uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v100 - 8) + 24))(v98, v99, v100);
    v134(&v25[v27[10]], &v26[v27[10]], v136);
    uint64_t v101 = v27[11];
    uint64_t v102 = &v25[v101];
    uint64_t v103 = &v26[v101];
    uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v104 - 8) + 24))(v102, v103, v104);
    v134(&v25[v27[12]], &v26[v27[12]], v136);
    v134(&v25[v27[13]], &v26[v27[13]], v136);
    uint64_t v105 = v27[14];
    uint64_t v106 = &v25[v105];
    uint64_t v107 = &v26[v105];
    uint64_t v108 = type metadata accessor for DirectInvocationConfig();
    LODWORD(v103) = __swift_getEnumTagSinglePayload((uint64_t)v106, 1, v108);
    int v109 = __swift_getEnumTagSinglePayload((uint64_t)v107, 1, v108);
    if (v103)
    {
      uint64_t v80 = v138;
      uint64_t v22 = v142;
      if (!v109)
      {
        uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v110 - 8) + 16))(v106, v107, v110);
        __swift_storeEnumTagSinglePayload((uint64_t)v106, 0, 1, v108);
LABEL_28:
        a3 = v140;
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v80 = v138;
      uint64_t v22 = v142;
      if (!v109)
      {
        uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v128 - 8) + 24))(v106, v107, v128);
        goto LABEL_28;
      }
      sub_2519BE3B8((uint64_t)v106, (void (*)(void))type metadata accessor for DirectInvocationConfig);
    }
    uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
    memcpy(v106, v107, *(void *)(*(void *)(v112 - 8) + 64));
    goto LABEL_28;
  }
  if (v15)
  {
LABEL_7:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v11, v12, *(void *)(*(void *)(v23 - 8) + 64));
    uint64_t v22 = v142;
    goto LABEL_30;
  }
  uint64_t v137 = v12;
  uint64_t v139 = a3;
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  void v11[2] = v12[2];
  v11[3] = v12[3];
  uint64_t v16 = *(int *)(v13 + 24);
  uint64_t v17 = (char *)v11 + v16;
  uint64_t v18 = (char *)v12 + v16;
  uint64_t v19 = (int *)type metadata accessor for IconConfiguration();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, (uint64_t)v19))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
    uint64_t v21 = v137;
    a3 = v139;
    uint64_t v22 = v142;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v17, v18, v6);
    uint64_t v54 = v19[5];
    uint64_t v55 = &v17[v54];
    uint64_t v56 = &v18[v54];
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v133 = *(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16);
    v133(v55, v56, v57);
    uint64_t v58 = v19[6];
    uint64_t v59 = &v17[v58];
    uint64_t v60 = &v18[v58];
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
    uint64_t v62 = v19[7];
    uint64_t v130 = &v17[v62];
    uint64_t v63 = &v18[v62];
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v65 = *(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16);
    v65(v130, v63, v64);
    v65(&v17[v19[8]], &v18[v19[8]], v64);
    uint64_t v66 = v19[9];
    uint64_t v67 = &v17[v66];
    uint64_t v68 = &v18[v66];
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 16))(v67, v68, v69);
    v133(&v17[v19[10]], &v18[v19[10]], v57);
    uint64_t v70 = v19[11];
    uint64_t v71 = &v17[v70];
    uint64_t v72 = &v18[v70];
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16))(v71, v72, v73);
    v133(&v17[v19[12]], &v18[v19[12]], v57);
    v133(&v17[v19[13]], &v18[v19[13]], v57);
    uint64_t v74 = v19[14];
    uint64_t v75 = &v17[v74];
    uint64_t v76 = &v18[v74];
    uint64_t v77 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v76, 1, v77))
    {
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v75, v76, *(void *)(*(void *)(v78 - 8) + 64));
    }
    else
    {
      uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v81 - 8) + 16))(v75, v76, v81);
      __swift_storeEnumTagSinglePayload((uint64_t)v75, 0, 1, v77);
    }
    uint64_t v22 = v142;
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, (uint64_t)v19);
    uint64_t v21 = v137;
    a3 = v139;
  }
  uint64_t v82 = *(int *)(v141 + 28);
  uint64_t v83 = (char *)v11 + v82;
  uint64_t v84 = (uint64_t)v21 + v82;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v85 - 8) + 16))(v83, v84, v85);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v141);
LABEL_30:
  uint64_t v117 = *(int *)(a3 + 20);
  uint64_t v118 = (void *)(a1 + v117);
  uint64_t v119 = v22 + v117;
  uint64_t v120 = *(void **)(a1 + v117);
  uint64_t v121 = *(void **)(v22 + v117);
  *uint64_t v118 = v121;
  id v122 = v121;

  v118[1] = *(void *)(v119 + 8);
  uint64_t v123 = *(int *)(a3 + 24);
  uint64_t v124 = a1 + v123;
  uint64_t v125 = v22 + v123;
  uint64_t v126 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v126 - 8) + 24))(v124, v125, v126);
  return a1;
}

uint64_t sub_2519B985C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for DisambiguationSnippetModel(0);
  *(void *)(a1 + *(int *)(v8 + 20)) = *(void *)(a2 + *(int *)(v8 + 20));
  uint64_t v9 = *(int *)(v8 + 24);
  uint64_t v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  uint64_t v12 = type metadata accessor for DisambiguationOption(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    uint64_t v57 = v12;
    uint64_t v58 = a3;
    long long v14 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v14;
    uint64_t v15 = *(int *)(v12 + 24);
    uint64_t v16 = (char *)v10 + v15;
    uint64_t v17 = (char *)v11 + v15;
    uint64_t v18 = (int *)type metadata accessor for IconConfiguration();
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v18))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      v7((uint64_t)v16, (uint64_t)v17, v6);
      uint64_t v20 = v18[5];
      uint64_t v21 = &v16[v20];
      uint64_t v22 = &v17[v20];
      uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v56 = *(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 32);
      v56(v21, v22, v55);
      uint64_t v23 = v18[6];
      uint64_t v24 = &v16[v23];
      uint64_t v25 = &v17[v23];
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
      uint64_t v27 = v18[7];
      uint64_t v51 = &v17[v27];
      uint64_t v53 = &v16[v27];
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      int v29 = *(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 32);
      v29(v53, v51, v28);
      v29(&v16[v18[8]], &v17[v18[8]], v28);
      uint64_t v30 = v18[9];
      uint64_t v31 = &v16[v30];
      uint64_t v32 = &v17[v30];
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32))(v31, v32, v33);
      v56(&v16[v18[10]], &v17[v18[10]], v55);
      uint64_t v34 = v18[11];
      uint64_t v52 = &v17[v34];
      uint64_t v54 = &v16[v34];
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v54, v52, v35);
      v56(&v16[v18[12]], &v17[v18[12]], v55);
      v56(&v16[v18[13]], &v17[v18[13]], v55);
      uint64_t v36 = v18[14];
      uint64_t v37 = &v16[v36];
      uint64_t v38 = &v17[v36];
      uint64_t v39 = type metadata accessor for DirectInvocationConfig();
      if (__swift_getEnumTagSinglePayload((uint64_t)v38, 1, v39))
      {
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
        memcpy(v37, v38, *(void *)(*(void *)(v40 - 8) + 64));
      }
      else
      {
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 32))(v37, v38, v41);
        __swift_storeEnumTagSinglePayload((uint64_t)v37, 0, 1, v39);
      }
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, (uint64_t)v18);
    }
    uint64_t v42 = *(int *)(v57 + 28);
    uint64_t v43 = (char *)v10 + v42;
    uint64_t v44 = (char *)v11 + v42;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v57);
    a3 = v58;
  }
  uint64_t v46 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 32))(v47, v48, v49);
  return a1;
}

uint64_t sub_2519B9D60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = type metadata accessor for DisambiguationSnippetModel(0);
  *(void *)(a1 + *(int *)(v9 + 20)) = *(void *)(a2 + *(int *)(v9 + 20));
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(v9 + 24);
  uint64_t v143 = a1;
  uint64_t v144 = a2;
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for DisambiguationOption(0);
  long long v14 = (void *)v11;
  LODWORD(v11) = __swift_getEnumTagSinglePayload(v11, 1, v13);
  uint64_t v15 = v12;
  uint64_t v142 = v13;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (!v11)
  {
    if (EnumTagSinglePayload)
    {
      sub_2519BE3B8((uint64_t)v14, (void (*)(void))type metadata accessor for DisambiguationOption);
      goto LABEL_7;
    }
    uint64_t v141 = a3;
    uint64_t v27 = v12[1];
    *long long v14 = *v12;
    v14[1] = v27;
    swift_bridgeObjectRelease();
    uint64_t v28 = v12[3];
    v14[2] = v12[2];
    v14[3] = v28;
    swift_bridgeObjectRelease();
    uint64_t v29 = *(int *)(v13 + 24);
    uint64_t v30 = (uint64_t)v14 + v29;
    uint64_t v31 = (uint64_t)v15 + v29;
    uint64_t v32 = (int *)type metadata accessor for IconConfiguration();
    int v33 = __swift_getEnumTagSinglePayload(v30, 1, (uint64_t)v32);
    int v34 = __swift_getEnumTagSinglePayload(v31, 1, (uint64_t)v32);
    if (v33)
    {
      if (!v34)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v30, v31, v6);
        uint64_t v35 = v32[5];
        uint64_t v36 = v30 + v35;
        uint64_t v37 = v31 + v35;
        uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v135 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v138 - 8) + 32);
        v135(v36, v37, v138);
        uint64_t v38 = v32[6];
        uint64_t v39 = v30 + v38;
        uint64_t v40 = v31 + v38;
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 32))(v39, v40, v41);
        uint64_t v42 = v32[7];
        uint64_t v132 = v30 + v42;
        uint64_t v43 = v31 + v42;
        uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 32);
        v45(v132, v43, v44);
        v45(v30 + v32[8], v31 + v32[8], v44);
        uint64_t v46 = v32[9];
        uint64_t v47 = v30 + v46;
        uint64_t v48 = v31 + v46;
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 32))(v47, v48, v49);
        v135(v30 + v32[10], v31 + v32[10], v138);
        uint64_t v50 = v32[11];
        uint64_t v51 = v30 + v50;
        uint64_t v52 = v31 + v50;
        uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 32))(v51, v52, v53);
        v135(v30 + v32[12], v31 + v32[12], v138);
        v135(v30 + v32[13], v31 + v32[13], v138);
        uint64_t v54 = v32[14];
        uint64_t v55 = (void *)(v30 + v54);
        uint64_t v56 = (const void *)(v31 + v54);
        uint64_t v57 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v56, 1, v57))
        {
          uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
          memcpy(v55, v56, *(void *)(*(void *)(v58 - 8) + 64));
        }
        else
        {
          uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
          (*(void (**)(void *, const void *, uint64_t))(*(void *)(v117 - 8) + 32))(v55, v56, v117);
          __swift_storeEnumTagSinglePayload((uint64_t)v55, 0, 1, v57);
        }
        uint64_t v26 = v143;
        uint64_t v25 = v144;
        __swift_storeEnumTagSinglePayload(v30, 0, 1, (uint64_t)v32);
        a3 = v141;
        goto LABEL_27;
      }
    }
    else
    {
      if (!v34)
      {
        v8(v30, v31, v6);
        uint64_t v92 = v32[5];
        uint64_t v93 = v30 + v92;
        uint64_t v94 = v31 + v92;
        uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v137 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v139 - 8) + 40);
        v137(v93, v94, v139);
        uint64_t v95 = v32[6];
        uint64_t v96 = v30 + v95;
        uint64_t v97 = v31 + v95;
        uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 40))(v96, v97, v98);
        uint64_t v99 = v32[7];
        uint64_t v134 = v30 + v99;
        uint64_t v100 = v31 + v99;
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        uint64_t v102 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v101 - 8) + 40);
        v102(v134, v100, v101);
        v102(v30 + v32[8], v31 + v32[8], v101);
        uint64_t v103 = v32[9];
        uint64_t v104 = v30 + v103;
        uint64_t v105 = v31 + v103;
        uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 40))(v104, v105, v106);
        v137(v30 + v32[10], v31 + v32[10], v139);
        uint64_t v107 = v32[11];
        uint64_t v108 = v30 + v107;
        uint64_t v109 = v31 + v107;
        uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 40))(v108, v109, v110);
        v137(v30 + v32[12], v31 + v32[12], v139);
        v137(v30 + v32[13], v31 + v32[13], v139);
        uint64_t v111 = v32[14];
        uint64_t v112 = v30 + v111;
        uint64_t v113 = v31 + v111;
        uint64_t v114 = type metadata accessor for DirectInvocationConfig();
        LODWORD(v109) = __swift_getEnumTagSinglePayload(v112, 1, v114);
        int v115 = __swift_getEnumTagSinglePayload(v113, 1, v114);
        if (v109)
        {
          if (!v115)
          {
            uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v116 - 8) + 32))(v112, v113, v116);
            __swift_storeEnumTagSinglePayload(v112, 0, 1, v114);
            goto LABEL_18;
          }
        }
        else
        {
          if (!v115)
          {
            uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v131 - 8) + 40))(v112, v113, v131);
            goto LABEL_18;
          }
          sub_2519BE3B8(v112, (void (*)(void))type metadata accessor for DirectInvocationConfig);
        }
        size_t v84 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94030) - 8) + 64);
        uint64_t v85 = (void *)v112;
        uint64_t v86 = (const void *)v113;
LABEL_17:
        memcpy(v85, v86, v84);
LABEL_18:
        a3 = v141;
        uint64_t v26 = v143;
        uint64_t v25 = v144;
LABEL_27:
        uint64_t v118 = *(int *)(v142 + 28);
        uint64_t v119 = (char *)v14 + v118;
        uint64_t v120 = (char *)v15 + v118;
        uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v121 - 8) + 40))(v119, v120, v121);
        goto LABEL_28;
      }
      sub_2519BE3B8(v30, (void (*)(void))type metadata accessor for IconConfiguration);
    }
    size_t v84 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8) - 8) + 64);
    uint64_t v85 = (void *)v30;
    uint64_t v86 = (const void *)v31;
    goto LABEL_17;
  }
  if (EnumTagSinglePayload)
  {
LABEL_7:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
    memcpy(v14, v12, *(void *)(*(void *)(v24 - 8) + 64));
    uint64_t v26 = v143;
    uint64_t v25 = v144;
    goto LABEL_28;
  }
  uint64_t v140 = a3;
  long long v17 = *((_OWORD *)v12 + 1);
  uint64_t v18 = (uint64_t)v14;
  *(_OWORD *)long long v14 = *v15;
  *((_OWORD *)v14 + 1) = v17;
  uint64_t v19 = *(int *)(v13 + 24);
  uint64_t v20 = (char *)v14 + v19;
  uint64_t v21 = (char *)v15 + v19;
  uint64_t v22 = (int *)type metadata accessor for IconConfiguration();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, (uint64_t)v22))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
    memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v20, v21, v6);
    uint64_t v59 = v22[5];
    uint64_t v60 = &v20[v59];
    uint64_t v61 = &v21[v59];
    uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v63 = *(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32);
    v63(v60, v61, v62);
    uint64_t v64 = v22[6];
    uint64_t v65 = &v20[v64];
    uint64_t v66 = &v21[v64];
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 32))(v65, v66, v67);
    uint64_t v68 = v22[7];
    uint64_t v133 = &v21[v68];
    uint64_t v136 = &v20[v68];
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v70 = *(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 32);
    v70(v136, v133, v69);
    v70(&v20[v22[8]], &v21[v22[8]], v69);
    uint64_t v71 = v22[9];
    uint64_t v72 = &v20[v71];
    uint64_t v73 = &v21[v71];
    uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 32))(v72, v73, v74);
    v63(&v20[v22[10]], &v21[v22[10]], v62);
    uint64_t v75 = v22[11];
    uint64_t v76 = &v20[v75];
    uint64_t v77 = &v21[v75];
    uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 32))(v76, v77, v78);
    v63(&v20[v22[12]], &v21[v22[12]], v62);
    v63(&v20[v22[13]], &v21[v22[13]], v62);
    uint64_t v79 = v22[14];
    uint64_t v80 = &v20[v79];
    uint64_t v81 = &v21[v79];
    uint64_t v82 = type metadata accessor for DirectInvocationConfig();
    if (__swift_getEnumTagSinglePayload((uint64_t)v81, 1, v82))
    {
      uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
      memcpy(v80, v81, *(void *)(*(void *)(v83 - 8) + 64));
    }
    else
    {
      uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 32))(v80, v81, v87);
      __swift_storeEnumTagSinglePayload((uint64_t)v80, 0, 1, v82);
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, (uint64_t)v22);
  }
  a3 = v140;
  uint64_t v26 = v143;
  uint64_t v25 = v144;
  uint64_t v88 = *(int *)(v142 + 28);
  uint64_t v89 = v18 + v88;
  uint64_t v90 = (char *)v15 + v88;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v91 - 8) + 32))(v89, v90, v91);
  __swift_storeEnumTagSinglePayload(v18, 0, 1, v142);
LABEL_28:
  uint64_t v122 = *(int *)(a3 + 20);
  uint64_t v123 = (void *)(v26 + v122);
  uint64_t v124 = (void *)(v25 + v122);
  uint64_t v125 = *(void **)(v26 + v122);
  void *v123 = *v124;

  v123[1] = v124[1];
  uint64_t v126 = *(int *)(a3 + 24);
  uint64_t v127 = v26 + v126;
  uint64_t v128 = v25 + v126;
  uint64_t v129 = sub_2519C99B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v129 - 8) + 40))(v127, v128, v129);
  return v26;
}

uint64_t sub_2519BAA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519BAA64);
}

uint64_t sub_2519BAA64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for DisambiguationSnippetModel(0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_10:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 2147483646)
  {
    uint64_t v8 = sub_2519C99B0();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    goto LABEL_10;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  int v11 = v10 - 1;
  if (v11 < 0) {
    int v11 = -1;
  }
  return (v11 + 1);
}

uint64_t sub_2519BAB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519BAB34);
}

void sub_2519BAB34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for DisambiguationSnippetModel(0);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = a2;
      return;
    }
    uint64_t v10 = sub_2519C99B0();
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for DisambiguationView()
{
  uint64_t result = qword_269B94700;
  if (!qword_269B94700) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519BAC28()
{
  uint64_t result = type metadata accessor for DisambiguationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2519C99B0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2519BACF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2519BAD14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2519C99D0();
  OUTLINED_FUNCTION_4_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)(a2 + *(int *)(type metadata accessor for DisambiguationView() + 20));
  sub_2519CA170();
  sub_2519BDAD4(&qword_269B93CB0, MEMORY[0x263F77980]);
  *uint64_t v10 = sub_2519C9AC0();
  v10[1] = v11;
  sub_2519BE36C();
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  id v12 = (id)qword_269B99498;
  sub_2519C99A0();
  sub_2519CA300();
  sub_2519C9990();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_269B99480);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v13, v4);
  v16._uint64_t countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  sub_2519CA3B0();
  sub_2519CA210();
  sub_2519A0EAC();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  v14._uint64_t countAndFlagsBits = 0xD00000000000006BLL;
  v14._object = (void *)0x80000002519CF110;
  Logger.debug(output:test:caller:)(v16, 0, v14);
  swift_bridgeObjectRelease();
  sub_2519BE3B8(a1, (void (*)(void))type metadata accessor for DisambiguationSnippetModel);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

uint64_t sub_2519BAFC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v1 = type metadata accessor for DisambiguationView();
  uint64_t v2 = OUTLINED_FUNCTION_2_0(v1);
  MEMORY[0x270FA5388](v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94710);
  OUTLINED_FUNCTION_4_0();
  uint64_t v13 = v4;
  uint64_t v14 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2519BE36C();
  swift_allocObject();
  sub_2519BDA7C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94718);
  sub_2519827F8(&qword_269B94720, &qword_269B94718);
  sub_2519CA030();
  sub_2519BE36C();
  uint64_t v7 = swift_allocObject();
  sub_2519BDA7C();
  uint64_t v8 = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v15, v6, v14);
  uint64_t v9 = (void (**)())(v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B94728) + 36));
  *uint64_t v9 = sub_2519BD488;
  v9[1] = (void (*)())v7;
  v9[2] = 0;
  v9[3] = 0;
  OUTLINED_FUNCTION_5_1();
  return v10();
}

uint64_t sub_2519BB224@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v45 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for DisambiguationOption(0);
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (uint64_t *)((char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94730);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v49 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v46 = (uint64_t *)((char *)&v43 - v9);
  uint64_t v10 = type metadata accessor for DisambiguationView();
  uint64_t v11 = v10 - 8;
  uint64_t v47 = *(char **)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = sub_2519CA0C0();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94738);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v48 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v43 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  uint64_t v19 = v54;
  uint64_t v20 = v55;
  uint64_t v56 = MEMORY[0x263F1A830];
  uint64_t v57 = MEMORY[0x263F77348];
  uint64_t v21 = swift_allocObject();
  uint64_t v54 = v21;
  *(void *)(v21 + 16) = v19;
  *(void *)(v21 + 24) = v20;
  uint64_t v22 = MEMORY[0x263F8EE78];
  *(unsigned char *)(v21 + 32) = 0;
  *(void *)(v21 + 40) = v22;
  uint64_t v53 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  sub_2519CA0B0();
  sub_2519BE36C();
  swift_allocObject();
  sub_2519BDA7C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94740);
  sub_2519827F8(&qword_269B94748, &qword_269B94740);
  uint64_t v47 = v18;
  sub_2519CA080();
  uint64_t v23 = *(void **)(a1 + *(int *)(v11 + 28));
  if (v23)
  {
    id v24 = v23;
    sub_2519CA140();

    if ((sub_2519CA340() & 1) == 0)
    {
      uint64_t v25 = type metadata accessor for DisambiguationSnippetModel(0);
      uint64_t v26 = v45;
      sub_251982930(a1 + *(int *)(v25 + 24), v45, &qword_269B943E8);
      if (__swift_getEnumTagSinglePayload(v26, 1, v44) != 1)
      {
        uint64_t v29 = v43;
        sub_2519BDA7C();
        uint64_t v30 = sub_2519C9B70();
        uint64_t v31 = v46;
        *uint64_t v46 = v30;
        v31[1] = 0;
        *((unsigned char *)v31 + 16) = 1;
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94760);
        uint64_t v33 = a1;
        uint64_t v28 = v31;
        sub_2519BCFB0(v29, v33, (uint64_t *)((char *)v31 + *(int *)(v32 + 44)));
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94750);
        __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v34);
        sub_2519BE3B8((uint64_t)v29, (void (*)(void))type metadata accessor for DisambiguationOption);
        goto LABEL_7;
      }
      sub_251992234(v26, &qword_269B943E8);
    }
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94750);
    uint64_t v28 = v46;
    __swift_storeEnumTagSinglePayload((uint64_t)v46, 1, 1, v27);
LABEL_7:
    uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    uint64_t v36 = v47;
    uint64_t v37 = v48;
    v35(v48, v47, v13);
    uint64_t v38 = v49;
    sub_251982930((uint64_t)v28, v49, &qword_269B94730);
    uint64_t v39 = v50;
    v35(v50, v37, v13);
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94758);
    sub_251982930(v38, (uint64_t)&v39[*(int *)(v40 + 48)], &qword_269B94730);
    sub_251992234((uint64_t)v28, &qword_269B94730);
    uint64_t v41 = *(void (**)(char *, uint64_t))(v14 + 8);
    v41(v36, v13);
    sub_251992234(v38, &qword_269B94730);
    return ((uint64_t (*)(char *, uint64_t))v41)(v37, v13);
  }
  sub_2519CA170();
  sub_2519BDAD4(&qword_269B93CB0, MEMORY[0x263F77980]);
  uint64_t result = sub_2519C9AB0();
  __break(1u);
  return result;
}

uint64_t sub_2519BB874@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v3 = sub_2519CA0A0();
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v53 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94770);
  uint64_t v54 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  long long v52 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v58 = (uint64_t)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for DisambiguationOption(0);
  v50[5] = *(void *)(v57 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v57);
  v50[6] = v9;
  v50[7] = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v51 = (char *)v50 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94778);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v64 = (uint64_t)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v63 = (char *)v50 - v14;
  uint64_t v15 = type metadata accessor for DisambiguationView();
  uint64_t v16 = v15 - 8;
  uint64_t v17 = *(void *)(v15 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388](v15);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94780);
  uint64_t v60 = *(void *)(v62 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v62);
  uint64_t v61 = (char *)v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v50 - v21;
  uint64_t v23 = type metadata accessor for DisambiguationSnippetModel(0);
  uint64_t v91 = *(void *)(a1 + *(int *)(v23 + 20));
  sub_2519BE36C();
  uint64_t v24 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v25 = (v24 + 16) & ~v24;
  v50[1] = v25 + v18;
  void v50[2] = v24 | 7;
  swift_allocObject();
  v50[3] = v25;
  v50[4] = (char *)v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2519BDA7C();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94400);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94788);
  sub_2519827F8(&qword_269B94790, &qword_269B94400);
  sub_2519BD9A0();
  sub_2519BDAD4(&qword_269B947A8, (void (*)(uint64_t))type metadata accessor for DisambiguationOption);
  uint64_t v59 = v22;
  uint64_t v26 = MEMORY[0x263F8D310];
  sub_2519C9FE0();
  uint64_t v27 = *(void **)(a1 + *(int *)(v16 + 28));
  if (v27)
  {
    id v28 = v27;
    sub_2519CA140();

    if (sub_2519CA340())
    {
      uint64_t v29 = a1 + *(int *)(v23 + 24);
      uint64_t v30 = v58;
      sub_251982930(v29, v58, &qword_269B943E8);
      if (__swift_getEnumTagSinglePayload(v30, 1, v57) != 1)
      {
        uint64_t v34 = (uint64_t *)v51;
        sub_2519BDA7C();
        uint64_t v36 = *v34;
        uint64_t v35 = v34[1];
        uint64_t v93 = v26;
        uint64_t v94 = MEMORY[0x263F77998];
        uint64_t v91 = v36;
        uint64_t v92 = v35;
        uint64_t v90 = 0;
        long long v88 = 0u;
        long long v89 = 0u;
        uint64_t v87 = 0;
        long long v85 = 0u;
        long long v86 = 0u;
        uint64_t v84 = 0;
        long long v82 = 0u;
        long long v83 = 0u;
        uint64_t v81 = 0;
        long long v79 = 0u;
        long long v80 = 0u;
        uint64_t v78 = 0;
        long long v76 = 0u;
        long long v77 = 0u;
        uint64_t v75 = 0;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v72 = 0;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v69 = 0;
        long long v67 = 0u;
        long long v68 = 0u;
        swift_bridgeObjectRetain();
        uint64_t v37 = v53;
        sub_2519CA090();
        sub_2519BE36C();
        sub_2519BE36C();
        swift_allocObject();
        sub_2519BDA7C();
        sub_2519BDA7C();
        sub_2519BDAD4(&qword_269B947A0, MEMORY[0x263F77720]);
        uint64_t v38 = v52;
        uint64_t v39 = v56;
        sub_2519C9D60();
        swift_release();
        (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v39);
        sub_2519BE3B8((uint64_t)v34, (void (*)(void))type metadata accessor for DisambiguationOption);
        uint64_t v33 = (uint64_t)v63;
        uint64_t v32 = v65;
        (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v63, v38, v65);
        uint64_t v31 = 0;
        goto LABEL_7;
      }
      sub_251992234(v30, &qword_269B943E8);
    }
    uint64_t v31 = 1;
    uint64_t v32 = v65;
    uint64_t v33 = (uint64_t)v63;
LABEL_7:
    __swift_storeEnumTagSinglePayload(v33, v31, 1, v32);
    uint64_t v41 = v60;
    uint64_t v40 = v61;
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v60 + 16);
    uint64_t v43 = v59;
    uint64_t v44 = v62;
    v42(v61, v59, v62);
    uint64_t v45 = v64;
    sub_251982930(v33, v64, &qword_269B94778);
    uint64_t v46 = v66;
    v42(v66, v40, v44);
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B947B0);
    sub_251982930(v45, (uint64_t)&v46[*(int *)(v47 + 48)], &qword_269B94778);
    sub_251992234(v33, &qword_269B94778);
    uint64_t v48 = *(void (**)(char *, uint64_t))(v41 + 8);
    v48(v43, v44);
    sub_251992234(v45, &qword_269B94778);
    return ((uint64_t (*)(char *, uint64_t))v48)(v40, v44);
  }
  sub_2519CA170();
  sub_2519BDAD4(&qword_269B93CB0, MEMORY[0x263F77980]);
  uint64_t result = sub_2519C9AB0();
  __break(1u);
  return result;
}

uint64_t sub_2519BC190@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v72 = a2;
  uint64_t v86 = a3;
  uint64_t v87 = a1;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B947B8);
  MEMORY[0x270FA5388](v84);
  long long v85 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DisambiguationOption(0);
  uint64_t v5 = v4 - 8;
  uint64_t v73 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v74 = v6;
  long long v76 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DisambiguationView();
  uint64_t v70 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v71 = v8;
  uint64_t v75 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2519CA0A0();
  uint64_t v79 = *(void *)(v9 - 8);
  uint64_t v80 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v78 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94770);
  uint64_t v82 = *(void *)(v11 - 8);
  uint64_t v83 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  long long v77 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v81 = (char *)&v60 - v14;
  uint64_t v15 = sub_2519C9F80();
  uint64_t v68 = *(void *)(v15 - 8);
  uint64_t v69 = v15;
  MEMORY[0x270FA5388](v15);
  long long v67 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2519C98F0();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v64 = sub_2519CA000();
  uint64_t v62 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B947C0);
  uint64_t v65 = *(void *)(v20 - 8);
  uint64_t v66 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B947C8);
  MEMORY[0x270FA5388](v63);
  uint64_t v24 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v60 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for IconConfiguration();
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v60 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_251982930((uint64_t)v87 + *(int *)(v5 + 32), (uint64_t)v27, &qword_269B93FC8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28) == 1)
  {
    sub_251992234((uint64_t)v27, &qword_269B93FC8);
  }
  else
  {
    sub_2519BDA7C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    sub_2519C9920();
    if (v113)
    {
      uint64_t v60 = v112;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      sub_2519C9920();
      sub_2519C98E0();
      swift_bridgeObjectRelease();
      sub_2519CA010();
      uint64_t v32 = v67;
      uint64_t v31 = v68;
      uint64_t v33 = v69;
      (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x263F1B4F8], v69);
      sub_2519BDAD4(&qword_269B93D70, MEMORY[0x263F77558]);
      uint64_t v61 = v30;
      uint64_t v34 = v64;
      sub_2519C9D70();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v19, v34);
      uint64_t v35 = static ColorUtils.fromString(_:)();
      swift_bridgeObjectRelease();
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v38 = v65;
      uint64_t v37 = v66;
      (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v24, v22, v66);
      uint64_t v39 = (uint64_t *)&v24[*(int *)(v63 + 36)];
      uint64_t *v39 = KeyPath;
      v39[1] = v35;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v37);
      sub_2519BDB78();
      uint64_t v40 = sub_2519C9D30();
      sub_251992234((uint64_t)v24, &qword_269B947C8);
      uint64_t v42 = *v87;
      uint64_t v41 = v87[1];
      uint64_t v114 = MEMORY[0x263F8D310];
      uint64_t v115 = MEMORY[0x263F77998];
      uint64_t v112 = v42;
      uint64_t v113 = v41;
      uint64_t v111 = 0;
      long long v109 = 0u;
      long long v110 = 0u;
      uint64_t v108 = 0;
      long long v106 = 0u;
      long long v107 = 0u;
      uint64_t v105 = 0;
      long long v103 = 0u;
      long long v104 = 0u;
      uint64_t v102 = 0;
      long long v100 = 0u;
      long long v101 = 0u;
      uint64_t v99 = 0;
      long long v97 = 0u;
      long long v98 = 0u;
      uint64_t v96 = 0;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v93 = 0;
      long long v91 = 0u;
      long long v92 = 0u;
      *((void *)&v89 + 1) = MEMORY[0x263F1B720];
      uint64_t v90 = MEMORY[0x263F774B0];
      *(void *)&long long v88 = v40;
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v43 = v78;
      sub_2519CA090();
      sub_2519BE36C();
      sub_2519BE36C();
      swift_allocObject();
      sub_2519BDA7C();
      sub_2519BDA7C();
      uint64_t v44 = sub_2519BDAD4(&qword_269B947A0, MEMORY[0x263F77720]);
      uint64_t v45 = v77;
      uint64_t v46 = v80;
      sub_2519C9D60();
      swift_release();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v43, v46);
      uint64_t v48 = v81;
      uint64_t v47 = v82;
      uint64_t v49 = v83;
      (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v81, v45, v83);
      (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v85, v48, v49);
      swift_storeEnumTagMultiPayload();
      uint64_t v112 = v46;
      uint64_t v113 = v44;
      swift_getOpaqueTypeConformance2();
      sub_2519C9C30();
      swift_release();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
      return sub_2519BE3B8((uint64_t)v61, (void (*)(void))type metadata accessor for IconConfiguration);
    }
    sub_2519BE3B8((uint64_t)v30, (void (*)(void))type metadata accessor for IconConfiguration);
  }
  uint64_t v52 = *v87;
  uint64_t v51 = v87[1];
  uint64_t v114 = MEMORY[0x263F8D310];
  uint64_t v115 = MEMORY[0x263F77998];
  uint64_t v112 = v52;
  uint64_t v113 = v51;
  uint64_t v111 = 0;
  long long v109 = 0u;
  long long v110 = 0u;
  uint64_t v108 = 0;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v105 = 0;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v102 = 0;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v99 = 0;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v96 = 0;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v93 = 0;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v90 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  swift_bridgeObjectRetain();
  uint64_t v53 = v78;
  sub_2519CA090();
  sub_2519BE36C();
  sub_2519BE36C();
  swift_allocObject();
  sub_2519BDA7C();
  sub_2519BDA7C();
  uint64_t v54 = sub_2519BDAD4(&qword_269B947A0, MEMORY[0x263F77720]);
  uint64_t v55 = v77;
  uint64_t v56 = v80;
  sub_2519C9D60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v53, v56);
  uint64_t v58 = v81;
  uint64_t v57 = v82;
  uint64_t v59 = v83;
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v81, v55, v83);
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v85, v58, v59);
  swift_storeEnumTagMultiPayload();
  uint64_t v112 = v56;
  uint64_t v113 = v54;
  swift_getOpaqueTypeConformance2();
  sub_2519C9C30();
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v58, v59);
}

void sub_2519BCEC4()
{
  OUTLINED_FUNCTION_11_2();
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for DisambiguationView() + 20));
  if (v1)
  {
    type metadata accessor for DisambiguationOption(0);
    id v2 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    id v3 = (id)sub_2519C9890();
    sub_2519CA160();
  }
  else
  {
    sub_2519CA170();
    sub_2519BDAD4(&qword_269B93CB0, MEMORY[0x263F77980]);
    sub_2519C9AB0();
    __break(1u);
  }
}

uint64_t sub_2519BCFB0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v22[3] = a2;
  uint64_t v24 = a3;
  uint64_t v4 = type metadata accessor for DisambiguationOption(0);
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v23 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  v22[1] = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DisambiguationView();
  v22[2] = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B942A8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v22 - v12;
  uint64_t v14 = a1[1];
  uint64_t v25 = *a1;
  uint64_t v26 = v14;
  sub_2519BE36C();
  sub_2519BE36C();
  swift_allocObject();
  sub_2519BDA7C();
  sub_2519BDA7C();
  sub_251991D3C();
  swift_bridgeObjectRetain();
  sub_2519C9FC0();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v15(v11, v13, v7);
  uint64_t v16 = v24;
  *uint64_t v24 = 0;
  *((unsigned char *)v16 + 8) = 1;
  uint64_t v17 = (char *)v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94768);
  v15(&v17[*(int *)(v18 + 48)], v11, v7);
  uint64_t v19 = &v17[*(int *)(v18 + 64)];
  *(void *)uint64_t v19 = 0;
  v19[8] = 1;
  uint64_t v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v13, v7);
  return ((uint64_t (*)(char *, uint64_t))v20)(v11, v7);
}

void sub_2519BD324()
{
  if (qword_269B93B78 != -1) {
    swift_once();
  }
  type metadata accessor for DisambiguationView();
  sub_2519CA2F0();
  sub_2519C9980();
  if (qword_269B93B70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2519C99D0();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99480);
  v1._uint64_t countAndFlagsBits = 0xD00000000000006BLL;
  v2._object = (void *)0x80000002519CF0E0;
  v1._object = (void *)0x80000002519CF110;
  v2._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  Logger.debug(output:test:caller:)(v2, 0, v1);
}

uint64_t sub_2519BD46C()
{
  return sub_2519BD528((uint64_t (*)(uint64_t))sub_2519BB224);
}

void sub_2519BD488()
{
  uint64_t v0 = type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_4_1(v0);

  sub_2519BD324();
}

uint64_t sub_2519BD4C8()
{
  sub_251991DCC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2519BD510()
{
  return sub_2519BD528((uint64_t (*)(uint64_t))sub_2519BB874);
}

uint64_t sub_2519BD528(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_4_1(v2);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return a1(v4);
}

uint64_t objectdestroyTm_3()
{
  uint64_t v1 = type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_3_2();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v33 = v0;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v4, v8);
  uint64_t v10 = type metadata accessor for DisambiguationSnippetModel(0);
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + v4 + *(int *)(v10 + 24);
  uint64_t v12 = type metadata accessor for DisambiguationOption(0);
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12))
  {
    uint64_t v31 = v0 + v4;
    uint64_t v32 = v6;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v11 + *(int *)(v12 + 24);
    uint64_t v14 = (int *)type metadata accessor for IconConfiguration();
    if (!__swift_getEnumTagSinglePayload(v13, 1, (uint64_t)v14))
    {
      OUTLINED_FUNCTION_5_1();
      v15();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      OUTLINED_FUNCTION_0();
      uint64_t v17 = *(void (**)(void))(v16 + 8);
      OUTLINED_FUNCTION_8_14();
      v17();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_5_1();
      v18();
      uint64_t v30 = v13 + v14[7];
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      OUTLINED_FUNCTION_0();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v21(v30, v19);
      v21(v13 + v14[8], v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_5_1();
      v22();
      OUTLINED_FUNCTION_8_14();
      v17();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_5_1();
      v23();
      OUTLINED_FUNCTION_8_14();
      v17();
      OUTLINED_FUNCTION_8_14();
      v17();
      uint64_t v24 = v13 + v14[14];
      uint64_t v25 = type metadata accessor for DirectInvocationConfig();
      if (!__swift_getEnumTagSinglePayload(v24, 1, v25))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        OUTLINED_FUNCTION_4_2();
        (*(void (**)(uint64_t))(v26 + 8))(v24);
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v27();
    uint64_t v6 = v32;
    uint64_t v4 = (v3 + 16) & ~v3;
    uint64_t v7 = v31;
  }

  sub_2519C99B0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v28();

  return MEMORY[0x270FA0238](v33, v4 + v6, v3 | 7);
}

uint64_t sub_2519BD940@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_4_1(v5);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_2519BC190(a1, v7, a2);
}

unint64_t sub_2519BD9A0()
{
  unint64_t result = qword_269B94798;
  if (!qword_269B94798)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94788);
    sub_2519CA0A0();
    sub_2519BDAD4(&qword_269B947A0, MEMORY[0x263F77720]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94798);
  }
  return result;
}

uint64_t sub_2519BDA7C()
{
  uint64_t v2 = OUTLINED_FUNCTION_11_2();
  v3(v2);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v0, v1);
  return v0;
}

uint64_t sub_2519BDAD4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519BDB1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519C9B10();
  *a1 = result;
  return result;
}

uint64_t sub_2519BDB48()
{
  return sub_2519C9B20();
}

unint64_t sub_2519BDB78()
{
  unint64_t result = qword_269B947D0;
  if (!qword_269B947D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B947C8);
    sub_2519CA000();
    sub_2519BDAD4(&qword_269B93D70, MEMORY[0x263F77558]);
    swift_getOpaqueTypeConformance2();
    sub_2519827F8(&qword_269B947D8, &qword_269B947E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B947D0);
  }
  return result;
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_3_2();
  uint64_t v66 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v4 = (v66 + 16) & ~v66;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = type metadata accessor for DisambiguationOption(0);
  OUTLINED_FUNCTION_3_2();
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v4 + v6 + v9) & ~v9;
  uint64_t v65 = *(void *)(v11 + 64);
  uint64_t v12 = v1 + v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t))(v13 + 8))(v1 + v4);
  uint64_t v14 = type metadata accessor for DisambiguationSnippetModel(0);
  swift_bridgeObjectRelease();
  uint64_t v15 = v1 + v4 + *(int *)(v14 + 24);
  if (!__swift_getEnumTagSinglePayload(v15, 1, v7))
  {
    uint64_t v59 = v10;
    uint64_t v62 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = v15 + *(int *)(v7 + 24);
    uint64_t v17 = (int *)type metadata accessor for IconConfiguration();
    if (!__swift_getEnumTagSinglePayload(v16, 1, (uint64_t)v17))
    {
      OUTLINED_FUNCTION_5_1();
      v18();
      uint64_t v60 = v1;
      uint64_t v19 = v16 + v17[5];
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      OUTLINED_FUNCTION_4_2();
      uint64_t v58 = *(void (**)(uint64_t))(v20 + 8);
      uint64_t v22 = v21;
      v58(v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_5_1();
      v23();
      uint64_t v57 = v16 + v17[7];
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
      OUTLINED_FUNCTION_0();
      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v26(v57, v24);
      v26(v16 + v17[8], v24);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_5_1();
      v27();
      ((void (*)(uint64_t, uint64_t))v58)(v16 + v17[10], v22);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
      OUTLINED_FUNCTION_4_2();
      uint64_t v1 = v60;
      OUTLINED_FUNCTION_5_1();
      v28();
      uint64_t v29 = OUTLINED_FUNCTION_12_3(v17[12]);
      v58(v29);
      uint64_t v30 = OUTLINED_FUNCTION_12_3(v17[13]);
      v58(v30);
      uint64_t v31 = v16 + v17[14];
      uint64_t v32 = type metadata accessor for DirectInvocationConfig();
      if (!__swift_getEnumTagSinglePayload(v31, 1, v32))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        OUTLINED_FUNCTION_4_2();
        (*(void (**)(uint64_t))(v33 + 8))(v31);
      }
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v34();
    uint64_t v9 = v62;
    uint64_t v10 = v59;
  }

  sub_2519C99B0();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v35();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v36 = v1 + v10 + *(int *)(v7 + 24);
  uint64_t v37 = (int *)type metadata accessor for IconConfiguration();
  uint64_t v38 = v10;
  if (!__swift_getEnumTagSinglePayload(v36, 1, (uint64_t)v37))
  {
    OUTLINED_FUNCTION_5_1();
    v39();
    uint64_t v40 = v36 + v37[5];
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
    uint64_t v61 = v1;
    uint64_t v64 = *(void (**)(uint64_t))(*(void *)(v41 - 8) + 8);
    uint64_t v42 = v41;
    v64(v40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v43();
    uint64_t v44 = v36 + v37[7];
    uint64_t v63 = v9;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(*(void *)(v45 - 8) + 8);
    v46(v44, v45);
    uint64_t v47 = v45;
    uint64_t v9 = v63;
    v46(v36 + v37[8], v47);
    uint64_t v38 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v48();
    ((void (*)(uint64_t, uint64_t))v64)(v36 + v37[10], v42);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_5_1();
    v49();
    uint64_t v50 = OUTLINED_FUNCTION_11_6(v37[12]);
    v64(v50);
    uint64_t v51 = OUTLINED_FUNCTION_11_6(v37[13]);
    v64(v51);
    uint64_t v1 = v61;
    uint64_t v52 = v36 + v37[14];
    uint64_t v53 = type metadata accessor for DirectInvocationConfig();
    if (!__swift_getEnumTagSinglePayload(v52, 1, v53))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      OUTLINED_FUNCTION_4_2();
      (*(void (**)(uint64_t))(v54 + 8))(v52);
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v55();

  return MEMORY[0x270FA0238](v1, v38 + v65, v66 | v9 | 7);
}

void sub_2519BE2F0()
{
  uint64_t v0 = type metadata accessor for DisambiguationView();
  OUTLINED_FUNCTION_2_0(v0);
  uint64_t v1 = type metadata accessor for DisambiguationOption(0);
  OUTLINED_FUNCTION_4_1(v1);
  sub_2519BCEC4();
}

uint64_t sub_2519BE36C()
{
  uint64_t v1 = OUTLINED_FUNCTION_11_2();
  v2(v1);
  OUTLINED_FUNCTION_0();
  uint64_t v3 = OUTLINED_FUNCTION_9_0();
  v4(v3);
  return v0;
}

uint64_t sub_2519BE3B8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

unint64_t sub_2519BE40C()
{
  unint64_t result = qword_269B947E8;
  if (!qword_269B947E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B94728);
    sub_2519827F8(&qword_269B947F0, &qword_269B94710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B947E8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_11_6@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_12_3@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

uint64_t sub_2519BE4E4()
{
  OUTLINED_FUNCTION_2_9();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_3_7();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2519BE550(uint64_t a1, uint64_t a2)
{
  return sub_2519BE81C(a1, a2, (uint64_t (*)(void))sub_25198643C);
}

uint64_t sub_2519BE568(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000017;
  unint64_t v3 = 0x80000002519CDE70;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD00000000000001CLL;
    }
    else {
      unint64_t v5 = 0x6944646C756F6873;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x80000002519CDE90;
    }
    else {
      unint64_t v6 = 0xED000079616C7073;
    }
  }
  else
  {
    unint64_t v5 = 0xD000000000000017;
    unint64_t v6 = 0x80000002519CDE70;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v2 = 0xD00000000000001CLL;
    }
    else {
      unint64_t v2 = 0x6944646C756F6873;
    }
    if (a2 == 1) {
      unint64_t v3 = 0x80000002519CDE90;
    }
    else {
      unint64_t v3 = 0xED000079616C7073;
    }
  }
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2519CA500();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2519BE678(uint64_t a1, uint64_t a2)
{
  return sub_2519BE81C(a1, a2, (uint64_t (*)(void))sub_25198327C);
}

uint64_t sub_2519BE690(uint64_t a1, uint64_t a2)
{
  return sub_2519BE81C(a1, a2, (uint64_t (*)(void))sub_2519B3AF0);
}

uint64_t sub_2519BE6A8()
{
  OUTLINED_FUNCTION_2_9();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_3_7();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2519BE714()
{
  OUTLINED_FUNCTION_2_9();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_3_7();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2519BE780(uint64_t a1, uint64_t a2)
{
  return sub_2519BE81C(a1, a2, (uint64_t (*)(void))sub_25199BBAC);
}

uint64_t sub_2519BE798()
{
  OUTLINED_FUNCTION_2_9();
  BOOL v2 = v2 && v0 == v1;
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = OUTLINED_FUNCTION_3_7();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2519BE804(uint64_t a1, uint64_t a2)
{
  return sub_2519BE81C(a1, a2, (uint64_t (*)(void))sub_251979E88);
}

uint64_t sub_2519BE81C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  uint64_t v7 = v6;
  if (v5 == ((uint64_t (*)(uint64_t))a3)(a2) && v7 == v8) {
    char v10 = 1;
  }
  else {
    char v10 = OUTLINED_FUNCTION_3_7();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_2519BE8A4()
{
  uint64_t v0 = SnippetHomeDeviceType.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == SnippetHomeDeviceType.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = OUTLINED_FUNCTION_3_7();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2519BE930()
{
  return sub_2519BEA14();
}

uint64_t sub_2519BE948()
{
  return sub_2519BEA14();
}

uint64_t sub_2519BE960()
{
  return sub_2519BEA14();
}

uint64_t sub_2519BE978()
{
  return sub_2519BEA14();
}

uint64_t sub_2519BE990()
{
  return sub_2519BEA74();
}

uint64_t sub_2519BE9A8()
{
  return sub_2519BF0A4();
}

uint64_t sub_2519BE9B4()
{
  return sub_2519CA540();
}

uint64_t sub_2519BE9F0()
{
  return sub_2519BEE20();
}

uint64_t sub_2519BE9FC()
{
  return sub_2519BEA14();
}

uint64_t sub_2519BEA14()
{
  OUTLINED_FUNCTION_9_11();
  v0(v1);
  OUTLINED_FUNCTION_4_12();
  swift_bridgeObjectRelease();
  return sub_2519CA540();
}

uint64_t sub_2519BEA5C()
{
  return sub_2519BEA74();
}

uint64_t sub_2519BEA74()
{
  OUTLINED_FUNCTION_9_11();
  v0(v3, v1);
  return sub_2519CA540();
}

uint64_t sub_2519BEAB4()
{
  return sub_2519BEDB8();
}

uint64_t sub_2519BEAC0()
{
  return sub_2519BEF84();
}

uint64_t sub_2519BEACC()
{
  OUTLINED_FUNCTION_10_8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2519BEB18(uint64_t a1, uint64_t a2)
{
  return sub_2519BED28(a1, a2, (void (*)(uint64_t))sub_25198643C);
}

uint64_t sub_2519BEB30()
{
  sub_2519CA1E0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2519BEBD0(uint64_t a1, uint64_t a2)
{
  return sub_2519BED28(a1, a2, (void (*)(uint64_t))sub_25198327C);
}

uint64_t sub_2519BEBE8()
{
  return sub_2519CA1E0();
}

uint64_t sub_2519BEBFC(uint64_t a1, uint64_t a2)
{
  return sub_2519BED28(a1, a2, (void (*)(uint64_t))sub_2519B3AF0);
}

uint64_t sub_2519BEC14()
{
  OUTLINED_FUNCTION_10_8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2519BEC60()
{
  OUTLINED_FUNCTION_10_8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2519BECAC(uint64_t a1, uint64_t a2)
{
  return sub_2519BED28(a1, a2, (void (*)(uint64_t))sub_25199BBAC);
}

uint64_t sub_2519BECC4()
{
  OUTLINED_FUNCTION_10_8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2519BED10(uint64_t a1, uint64_t a2)
{
  return sub_2519BED28(a1, a2, (void (*)(uint64_t))sub_251979E88);
}

uint64_t sub_2519BED28(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  OUTLINED_FUNCTION_7_12();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2519BED6C()
{
  SnippetHomeDeviceType.rawValue.getter();
  OUTLINED_FUNCTION_7_12();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2519BEDB8()
{
  return sub_2519CA540();
}

uint64_t sub_2519BEE08(uint64_t a1, uint64_t a2)
{
  return sub_2519BF050(a1, a2, (void (*)(uint64_t))sub_251979E88);
}

uint64_t sub_2519BEE20()
{
  return sub_2519CA540();
}

uint64_t sub_2519BEE88(uint64_t a1, uint64_t a2)
{
  return sub_2519BF050(a1, a2, (void (*)(uint64_t))sub_25199BBAC);
}

uint64_t sub_2519BEEA0(uint64_t a1, uint64_t a2)
{
  return sub_2519BEED0(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2519BEC60);
}

uint64_t sub_2519BEEB8(uint64_t a1, uint64_t a2)
{
  return sub_2519BEED0(a1, a2, (void (*)(unsigned char *, uint64_t))sub_2519BEC14);
}

uint64_t sub_2519BEED0(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *, uint64_t))
{
  sub_2519CA520();
  a3(v6, a2);
  return sub_2519CA540();
}

uint64_t sub_2519BEF1C(uint64_t a1, uint64_t a2)
{
  return sub_2519BF050(a1, a2, (void (*)(uint64_t))sub_2519B3AF0);
}

uint64_t sub_2519BEF34()
{
  return sub_2519CA540();
}

uint64_t sub_2519BEF6C(uint64_t a1, uint64_t a2)
{
  return sub_2519BF050(a1, a2, (void (*)(uint64_t))sub_25198327C);
}

uint64_t sub_2519BEF84()
{
  return sub_2519CA540();
}

uint64_t sub_2519BF038(uint64_t a1, uint64_t a2)
{
  return sub_2519BF050(a1, a2, (void (*)(uint64_t))sub_25198643C);
}

uint64_t sub_2519BF050(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_2519CA540();
}

uint64_t sub_2519BF0A4()
{
  return sub_2519CA540();
}

unint64_t CallToActionSnippetModel.description.getter()
{
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  type metadata accessor for CallToActionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v0 = (void *)sub_2519C9890();
  id v1 = objc_msgSend(v0, sel_description);
  sub_2519CA1A0();

  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA3B0();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  swift_bridgeObjectRelease();
  sub_2519CA210();
  return 0xD000000000000019;
}

uint64_t CallToActionSnippetModel.callToActionButtonLabel.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  return v1;
}

uint64_t CallToActionSnippetModel.callToActionDirectInvocation.getter()
{
  return sub_2519C9890();
}

uint64_t type metadata accessor for CallToActionSnippetModel()
{
  uint64_t result = qword_269B94820;
  if (!qword_269B94820) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CallToActionSnippetModel.init(callToActionButtonLabel:callToActionDirectInvocation:shouldDisplay:)@<X0>(char a1@<W3>, uint64_t a2@<X8>)
{
  *(unsigned char *)(a2 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 24)) = a1;
  sub_2519C9900();
  sub_2519869B8();
  return sub_2519C9870();
}

uint64_t sub_2519BF48C()
{
  return CallToActionSnippetModel.callToActionButtonLabel.setter();
}

uint64_t CallToActionSnippetModel.callToActionButtonLabel.setter()
{
  return sub_2519C9930();
}

uint64_t (*CallToActionSnippetModel.callToActionButtonLabel.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  v2[4] = sub_2519C9910();
  return sub_2519796F0;
}

uint64_t sub_2519BF570(id *a1)
{
  id v1 = *a1;
  return CallToActionSnippetModel.callToActionDirectInvocation.setter();
}

uint64_t CallToActionSnippetModel.callToActionDirectInvocation.setter()
{
  return sub_2519C98A0();
}

uint64_t (*CallToActionSnippetModel.callToActionDirectInvocation.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CallToActionSnippetModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  v2[4] = sub_2519C9880();
  return sub_2519796F0;
}

uint64_t CallToActionSnippetModel.shouldDisplay.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CallToActionSnippetModel() + 24));
}

uint64_t CallToActionSnippetModel.shouldDisplay.setter(char a1)
{
  uint64_t result = type metadata accessor for CallToActionSnippetModel();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*CallToActionSnippetModel.shouldDisplay.modify())()
{
  return nullsub_1;
}

uint64_t sub_2519BF6FC()
{
  unint64_t v0 = sub_2519CA430();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_2519BF74C(char a1)
{
  uint64_t result = 0xD000000000000017;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD00000000000001CLL;
    }
    else {
      return 0x6944646C756F6873;
    }
  }
  return result;
}

uint64_t sub_2519BF7B8(unsigned __int8 *a1, char *a2)
{
  return sub_2519BE568(*a1, *a2);
}

uint64_t sub_2519BF7C4()
{
  return sub_2519BEAC0();
}

uint64_t sub_2519BF7CC()
{
  return sub_2519BEB30();
}

uint64_t sub_2519BF7D4()
{
  return sub_2519BEF84();
}

uint64_t sub_2519BF7DC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519BF6FC();
  *a1 = result;
  return result;
}

uint64_t sub_2519BF80C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519BF74C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2519BF838()
{
  return sub_2519BF74C(*v0);
}

uint64_t sub_2519BF840@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2519BF748();
  *a1 = result;
  return result;
}

uint64_t sub_2519BF868(uint64_t a1)
{
  unint64_t v2 = sub_2519BFC68();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519BF8A4(uint64_t a1)
{
  unint64_t v2 = sub_2519BFC68();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::String __swiftcall CallToActionSnippetModel.responseViewId()()
{
  unint64_t v0 = (void *)0x80000002519CF220;
  uint64_t v1 = 0xD00000000000001BLL;
  result._object = v0;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t CallToActionSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v19 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_5();
  uint64_t v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B947F8);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_5();
  uint64_t v10 = type metadata accessor for CallToActionSnippetModel();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5();
  uint64_t v13 = v12 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519BFC68();
  sub_2519CA550();
  if (v20) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  sub_2519CA460();
  sub_2519C9900();
  sub_251987794(&qword_269B93FE8);
  sub_2519CA480();
  sub_2519C9890();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v8, v3);
  sub_2519869B8();
  sub_2519C9870();
  char v14 = sub_2519CA470();
  uint64_t v15 = OUTLINED_FUNCTION_6_11();
  v16(v15);
  *(unsigned char *)(v13 + *(int *)(v10 + 24)) = v14 & 1;
  sub_2519BFCB4(v13, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_2519AB8CC(v13);
}

unint64_t sub_2519BFC68()
{
  unint64_t result = qword_269B94800;
  if (!qword_269B94800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94800);
  }
  return result;
}

uint64_t sub_2519BFCB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CallToActionSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CallToActionSnippetModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v14 = v3;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5();
  uint64_t v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94808);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519BFC68();
  sub_2519CA560();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  sub_2519C9920();
  sub_2519CA4B0();
  if (v15)
  {
    uint64_t v9 = OUTLINED_FUNCTION_11_7();
    v10(v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for CallToActionSnippetModel();
    sub_2519C9890();
    sub_2519869B8();
    sub_2519C9870();
    sub_251987794(&qword_269B94000);
    sub_2519CA4D0();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v7, v2);
    sub_2519CA4C0();
    uint64_t v12 = OUTLINED_FUNCTION_11_7();
    return v13(v12);
  }
}

uint64_t CallToActionSnippetModel.stringId.getter()
{
  return 0;
}

uint64_t sub_2519BFF84()
{
  return sub_2519BFFEC(&qword_269B94810);
}

uint64_t sub_2519BFFB8()
{
  return sub_2519BFFEC(&qword_269B94818);
}

uint64_t sub_2519BFFEC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CallToActionSnippetModel();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519C0030@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CallToActionSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_2519C0048(void *a1)
{
  return CallToActionSnippetModel.encode(to:)(a1);
}

uint64_t sub_2519C0060@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CallToActionSnippetModel.callToActionButtonLabel.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2519C0090@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CallToActionSnippetModel.callToActionDirectInvocation.getter();
  *a1 = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for CallToActionSnippetModel(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for CallToActionSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(unsigned char *)(a1 + *(int *)(a3 + 24)) = *(unsigned char *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519C05F8);
}

uint64_t sub_2519C05F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v11 + 84) != a2)
    {
      unsigned int v13 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
      if (v13 >= 2) {
        return ((v13 + 2147483646) & 0x7FFFFFFF) + 1;
      }
      else {
        return 0;
      }
    }
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
  }

  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CallToActionSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519C06D8);
}

void sub_2519C06D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
  OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
    OUTLINED_FUNCTION_0_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(unsigned char *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_2519C0790()
{
  sub_251985798();
  if (v0 <= 0x3F)
  {
    sub_2519A9698();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for CallToActionSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519C092CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CallToActionSnippetModel.CodingKeys()
{
  return &type metadata for CallToActionSnippetModel.CodingKeys;
}

unint64_t sub_2519C0968()
{
  unint64_t result = qword_269B94830;
  if (!qword_269B94830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94830);
  }
  return result;
}

unint64_t sub_2519C09B8()
{
  unint64_t result = qword_269B94838;
  if (!qword_269B94838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94838);
  }
  return result;
}

unint64_t sub_2519C0A08()
{
  unint64_t result = qword_269B94840;
  if (!qword_269B94840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94840);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return sub_2519CA500();
}

uint64_t OUTLINED_FUNCTION_4_12()
{
  return sub_2519CA1E0();
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return *(void *)(v0 - 112);
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return sub_2519CA1E0();
}

uint64_t OUTLINED_FUNCTION_8_15()
{
  return sub_2519CA1E0();
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  return sub_2519CA520();
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return sub_2519CA1E0();
}

uint64_t OUTLINED_FUNCTION_11_7()
{
  return v0;
}

unint64_t static HomeAutomationSnippetModels.bundleName.getter()
{
  return 0xD000000000000016;
}

uint64_t HomeAutomationSnippetModels.snippetHidden(for:idiom:)()
{
  uint64_t v3 = sub_2519C9970();
  OUTLINED_FUNCTION_4_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_11_8();
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_6();
  sub_2519C0D04(v0, v2);
  if ((swift_getEnumCaseMultiPayload() | 2) == 2)
  {
    char v8 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v1, *MEMORY[0x263F75620], v3);
    char v8 = sub_2519C9960();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  }
  sub_2519C1118(v2, (void (*)(void))type metadata accessor for HomeAutomationSnippetModels);
  return v8 & 1;
}

uint64_t type metadata accessor for HomeAutomationSnippetModels()
{
  uint64_t result = qword_269B94908;
  if (!qword_269B94908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519C0D04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeAutomationSnippetModels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t HomeAutomationSnippetModels.description.getter()
{
  uint64_t v5 = v0;
  uint64_t v6 = type metadata accessor for TemperatureSnippetModel();
  uint64_t v7 = OUTLINED_FUNCTION_4(v6);
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_5();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = type metadata accessor for CallToActionSnippetModel();
  uint64_t v12 = OUTLINED_FUNCTION_4(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_11_8();
  uint64_t v13 = type metadata accessor for AutomationSnippetModel();
  uint64_t v14 = OUTLINED_FUNCTION_4(v13);
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6_6();
  uint64_t v15 = type metadata accessor for CompletionSnippetModel();
  uint64_t v16 = OUTLINED_FUNCTION_4(v15);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_14_2();
  uint64_t v17 = type metadata accessor for ConfirmationSnippetModel();
  uint64_t v18 = OUTLINED_FUNCTION_4(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_5();
  uint64_t v21 = v20 - v19;
  uint64_t v22 = type metadata accessor for DisambiguationSnippetModel(0);
  uint64_t v23 = OUTLINED_FUNCTION_4(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_5();
  uint64_t v26 = v25 - v24;
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_2_3();
  sub_2519C0D04(v5, v4);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2519C3300(v4, v21, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
      ConfirmationSnippetModel.description.getter();
      OUTLINED_FUNCTION_16_3();
      uint64_t v28 = (void (*)(void))type metadata accessor for ConfirmationSnippetModel;
      uint64_t v29 = v21;
      break;
    case 2u:
      sub_2519C3300(v4, v3, (void (*)(void))type metadata accessor for CompletionSnippetModel);
      CompletionSnippetModel.description.getter();
      OUTLINED_FUNCTION_16_3();
      uint64_t v28 = (void (*)(void))type metadata accessor for CompletionSnippetModel;
      uint64_t v29 = v3;
      break;
    case 3u:
      sub_2519C3300(v4, v2, (void (*)(void))type metadata accessor for AutomationSnippetModel);
      AutomationSnippetModel.description.getter();
      OUTLINED_FUNCTION_16_3();
      uint64_t v28 = (void (*)(void))type metadata accessor for AutomationSnippetModel;
      uint64_t v29 = v2;
      break;
    case 4u:
      sub_2519C3300(v4, v1, (void (*)(void))type metadata accessor for CallToActionSnippetModel);
      CallToActionSnippetModel.description.getter();
      OUTLINED_FUNCTION_16_3();
      uint64_t v28 = (void (*)(void))type metadata accessor for CallToActionSnippetModel;
      uint64_t v29 = v1;
      break;
    case 5u:
      sub_2519C3300(v4, v10, (void (*)(void))type metadata accessor for TemperatureSnippetModel);
      TemperatureSnippetModel.description.getter();
      OUTLINED_FUNCTION_16_3();
      uint64_t v28 = (void (*)(void))type metadata accessor for TemperatureSnippetModel;
      uint64_t v29 = v10;
      break;
    default:
      sub_2519C3300(v4, v26, (void (*)(void))type metadata accessor for DisambiguationSnippetModel);
      sub_2519A0EAC();
      OUTLINED_FUNCTION_16_3();
      uint64_t v28 = (void (*)(void))type metadata accessor for DisambiguationSnippetModel;
      uint64_t v29 = v26;
      break;
  }
  sub_2519C1118(v29, v28);
  return v5;
}

uint64_t sub_2519C1118(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  v3();
  return a1;
}

uint64_t sub_2519C116C()
{
  return sub_2519CA530();
}

uint64_t sub_2519C1194()
{
  return 12383;
}

uint64_t sub_2519C11A0()
{
  return sub_2519C1610();
}

BOOL sub_2519C11C0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2519C11D0()
{
  return sub_2519CA530();
}

uint64_t sub_2519C11F8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x80000002519CF290 || (sub_2519CA500() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002519CF2B0 || (sub_2519CA500() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v5 = a1 == 0x6974656C706D6F63 && a2 == 0xEE00776569566E6FLL;
    if (v5 || (sub_2519CA500() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v6 = a1 == 0x6974616D6F747561 && a2 == 0xEE00776569566E6FLL;
      if (v6 || (sub_2519CA500() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x80000002519CF2D0 || (sub_2519CA500() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0x74617265706D6574 && a2 == 0xEF77656956657275)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        char v8 = sub_2519CA500();
        swift_bridgeObjectRelease();
        if (v8) {
          return 5;
        }
        else {
          return 6;
        }
      }
    }
  }
}

uint64_t sub_2519C147C()
{
  return sub_2519CA540();
}

uint64_t sub_2519C14C4(char a1)
{
  uint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
    case 4:
      uint64_t result = 0xD000000000000010;
      break;
    case 2:
      uint64_t v3 = 0x656C706D6F63;
      goto LABEL_4;
    case 3:
      uint64_t v3 = 0x616D6F747561;
LABEL_4:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6974000000000000;
      break;
    case 5:
      uint64_t result = 0x74617265706D6574;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2519C15A0(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2519CA500();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2519C1610()
{
  return sub_2519CA540();
}

uint64_t sub_2519C1658@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519C15A0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2519C1684(uint64_t a1)
{
  unint64_t v2 = sub_2519C24E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519C16C0(uint64_t a1)
{
  unint64_t v2 = sub_2519C24E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519C16FC(uint64_t a1)
{
  unint64_t v2 = sub_2519C249C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519C1738(uint64_t a1)
{
  unint64_t v2 = sub_2519C249C();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_2519C1774(char *a1, char *a2)
{
  return sub_2519C11C0(*a1, *a2);
}

uint64_t sub_2519C1780()
{
  return sub_2519C147C();
}

uint64_t sub_2519C1788()
{
  return sub_2519C11D0();
}

uint64_t sub_2519C1790()
{
  return sub_2519CA540();
}

uint64_t sub_2519C17D4()
{
  return sub_2519C14C4(*v0);
}

uint64_t sub_2519C17DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519C11F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2519C1804(uint64_t a1)
{
  unint64_t v2 = sub_2519C2404();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519C1840(uint64_t a1)
{
  unint64_t v2 = sub_2519C2404();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519C187C(uint64_t a1)
{
  unint64_t v2 = sub_2519C2534();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519C18B8(uint64_t a1)
{
  unint64_t v2 = sub_2519C2534();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519C18F4(uint64_t a1)
{
  unint64_t v2 = sub_2519C2580();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519C1930(uint64_t a1)
{
  unint64_t v2 = sub_2519C2580();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519C196C(uint64_t a1)
{
  unint64_t v2 = sub_2519C25CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519C19A8(uint64_t a1)
{
  unint64_t v2 = sub_2519C25CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519C19E4()
{
  return sub_2519CA540();
}

uint64_t sub_2519C1A24(uint64_t a1)
{
  unint64_t v2 = sub_2519C2450();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519C1A60(uint64_t a1)
{
  unint64_t v2 = sub_2519C2450();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HomeAutomationSnippetModels.encode(to:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94848);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_12_4(v5, v37);
  type metadata accessor for TemperatureSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_1();
  uint64_t v43 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94850);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_13_5(v9, v38);
  type metadata accessor for CallToActionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v42 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94858);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_1();
  type metadata accessor for AutomationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_1();
  uint64_t v41 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94860);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_1();
  type metadata accessor for CompletionSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1();
  uint64_t v40 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94868);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_1();
  type metadata accessor for ConfirmationSnippetModel();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_1();
  uint64_t v39 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94870);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_5();
  type metadata accessor for DisambiguationSnippetModel(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_14_2();
  type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_2_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B94878);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_6_6();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519C2404();
  sub_2519CA560();
  sub_2519C0D04(v44, v2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v28 = v39;
      sub_2519C3300(v2, v39, (void (*)(void))type metadata accessor for ConfirmationSnippetModel);
      char v46 = 1;
      sub_2519C2580();
      OUTLINED_FUNCTION_4_13((uint64_t)&type metadata for HomeAutomationSnippetModels.ConfirmationViewCodingKeys, (uint64_t)&v46);
      sub_2519C33F0(&qword_269B94010, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_2_10();
      v29();
      uint64_t v30 = type metadata accessor for ConfirmationSnippetModel;
      goto LABEL_8;
    case 2u:
      uint64_t v28 = v40;
      sub_2519C3300(v2, v40, (void (*)(void))type metadata accessor for CompletionSnippetModel);
      char v47 = 2;
      sub_2519C2534();
      OUTLINED_FUNCTION_4_13((uint64_t)&type metadata for HomeAutomationSnippetModels.CompletionViewCodingKeys, (uint64_t)&v47);
      sub_2519C33F0(&qword_269B940F8, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_2_10();
      v31();
      uint64_t v30 = type metadata accessor for CompletionSnippetModel;
      goto LABEL_8;
    case 3u:
      uint64_t v28 = v41;
      sub_2519C3300(v2, v41, (void (*)(void))type metadata accessor for AutomationSnippetModel);
      char v48 = 3;
      sub_2519C24E8();
      OUTLINED_FUNCTION_4_13((uint64_t)&type metadata for HomeAutomationSnippetModels.AutomationViewCodingKeys, (uint64_t)&v48);
      sub_2519C33F0(&qword_269B93C60, (void (*)(uint64_t))type metadata accessor for AutomationSnippetModel);
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_2_10();
      v32();
      uint64_t v30 = type metadata accessor for AutomationSnippetModel;
      goto LABEL_8;
    case 4u:
      uint64_t v28 = v42;
      sub_2519C3300(v2, v42, (void (*)(void))type metadata accessor for CallToActionSnippetModel);
      char v49 = 4;
      sub_2519C249C();
      OUTLINED_FUNCTION_4_13((uint64_t)&type metadata for HomeAutomationSnippetModels.CallToActionViewCodingKeys, (uint64_t)&v49);
      sub_2519C33F0(&qword_269B94818, (void (*)(uint64_t))type metadata accessor for CallToActionSnippetModel);
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_2_10();
      v33();
      uint64_t v30 = type metadata accessor for CallToActionSnippetModel;
      goto LABEL_8;
    case 5u:
      uint64_t v28 = v43;
      sub_2519C3300(v2, v43, (void (*)(void))type metadata accessor for TemperatureSnippetModel);
      char v50 = 5;
      sub_2519C2450();
      OUTLINED_FUNCTION_4_13((uint64_t)&type metadata for HomeAutomationSnippetModels.TemperatureViewCodingKeys, (uint64_t)&v50);
      sub_2519C33F0(&qword_269B93F78, (void (*)(uint64_t))type metadata accessor for TemperatureSnippetModel);
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_2_10();
      v34();
      uint64_t v30 = type metadata accessor for TemperatureSnippetModel;
LABEL_8:
      uint64_t v26 = (uint64_t (*)(uint64_t))v30;
      uint64_t v27 = v28;
      break;
    default:
      sub_2519C3300(v2, v1, (void (*)(void))type metadata accessor for DisambiguationSnippetModel);
      char v45 = 0;
      sub_2519C25CC();
      OUTLINED_FUNCTION_4_13((uint64_t)&type metadata for HomeAutomationSnippetModels.DisambiguationViewCodingKeys, (uint64_t)&v45);
      sub_2519C33F0(&qword_269B94440, (void (*)(uint64_t))type metadata accessor for DisambiguationSnippetModel);
      sub_2519CA4D0();
      OUTLINED_FUNCTION_5_1();
      v25();
      uint64_t v26 = type metadata accessor for DisambiguationSnippetModel;
      uint64_t v27 = v1;
      break;
  }
  sub_2519C1118(v27, (void (*)(void))v26);
  OUTLINED_FUNCTION_5_1();
  return v35();
}

unint64_t sub_2519C2404()
{
  unint64_t result = qword_269B94880;
  if (!qword_269B94880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94880);
  }
  return result;
}

unint64_t sub_2519C2450()
{
  unint64_t result = qword_269B94888;
  if (!qword_269B94888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94888);
  }
  return result;
}

unint64_t sub_2519C249C()
{
  unint64_t result = qword_269B94890;
  if (!qword_269B94890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94890);
  }
  return result;
}

unint64_t sub_2519C24E8()
{
  unint64_t result = qword_269B94898;
  if (!qword_269B94898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94898);
  }
  return result;
}

unint64_t sub_2519C2534()
{
  unint64_t result = qword_269B948A0;
  if (!qword_269B948A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B948A0);
  }
  return result;
}

unint64_t sub_2519C2580()
{
  unint64_t result = qword_269B948A8;
  if (!qword_269B948A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B948A8);
  }
  return result;
}

unint64_t sub_2519C25CC()
{
  unint64_t result = qword_269B948B0;
  if (!qword_269B948B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B948B0);
  }
  return result;
}

uint64_t HomeAutomationSnippetModels.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B948B8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v100 = v4;
  uint64_t v101 = v5;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_1();
  uint64_t v110 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B948C0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v98 = v8;
  uint64_t v99 = v7;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_12_4(v9, v82);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B948C8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v96 = v11;
  uint64_t v97 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1();
  uint64_t v104 = v12;
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B948D0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v95 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_1();
  uint64_t v103 = v15;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B948D8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v93 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_1();
  uint64_t v102 = v18;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B948E0);
  OUTLINED_FUNCTION_4_0();
  uint64_t v91 = v19;
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_13_5(v21, v82);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B948E8);
  OUTLINED_FUNCTION_4_0();
  uint64_t v107 = v23;
  uint64_t v108 = v22;
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_2_3();
  uint64_t v106 = type metadata accessor for HomeAutomationSnippetModels();
  OUTLINED_FUNCTION_0();
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v90 = (char *)&v82 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  long long v89 = (char *)&v82 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  uint64_t v31 = (char *)&v82 - v30;
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = (char *)&v82 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v82 - v36;
  uint64_t v38 = MEMORY[0x270FA5388](v35);
  uint64_t v40 = (char *)&v82 - v39;
  MEMORY[0x270FA5388](v38);
  uint64_t v42 = (char *)&v82 - v41;
  uint64_t v43 = a1[3];
  uint64_t v111 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v43);
  sub_2519C2404();
  uint64_t v44 = v112;
  sub_2519CA550();
  if (!v44)
  {
    uint64_t v84 = v37;
    uint64_t v87 = v34;
    long long v85 = v31;
    uint64_t v86 = v40;
    long long v88 = v42;
    uint64_t v45 = v108;
    uint64_t v112 = v2;
    uint64_t v46 = sub_2519CA490();
    uint64_t v47 = *(void *)(v46 + 16);
    if (v47
      && (uint64_t v83 = 0,
          uint64_t v48 = *(unsigned __int8 *)(v46 + 32),
          sub_2519C3284(1, v47, v46, v46 + 32, 0, (2 * v47) | 1),
          uint64_t v50 = v49,
          unint64_t v52 = v51,
          swift_bridgeObjectRelease(),
          v50 == v52 >> 1))
    {
      uint64_t v53 = v83;
      uint64_t v54 = v105;
      switch(v48)
      {
        case 1:
          char v114 = 1;
          sub_2519C2580();
          OUTLINED_FUNCTION_6_12();
          type metadata accessor for ConfirmationSnippetModel();
          sub_2519C33F0(&qword_269B94008, (void (*)(uint64_t))type metadata accessor for ConfirmationSnippetModel);
          uint64_t v61 = v84;
          OUTLINED_FUNCTION_21_1();
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_2_10();
          v66();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_7_13();
          v67();
          goto LABEL_15;
        case 2:
          char v115 = 2;
          sub_2519C2534();
          OUTLINED_FUNCTION_6_12();
          type metadata accessor for CompletionSnippetModel();
          sub_2519C33F0(&qword_269B940F0, (void (*)(uint64_t))type metadata accessor for CompletionSnippetModel);
          sub_2519CA480();
          OUTLINED_FUNCTION_5_1();
          v76();
          swift_unknownObjectRelease();
          uint64_t v77 = OUTLINED_FUNCTION_19_2();
          v78(v77);
          uint64_t v79 = (uint64_t)v87;
          swift_storeEnumTagMultiPayload();
          uint64_t v75 = v79;
          goto LABEL_16;
        case 3:
          char v116 = 3;
          sub_2519C24E8();
          uint64_t v59 = v112;
          sub_2519CA440();
          if (v53) {
            goto LABEL_7;
          }
          type metadata accessor for AutomationSnippetModel();
          sub_2519C33F0(&qword_269B93C58, (void (*)(uint64_t))type metadata accessor for AutomationSnippetModel);
          uint64_t v62 = (uint64_t)v85;
          sub_2519CA480();
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_2_10();
          v68();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_7_13();
          v69();
          swift_storeEnumTagMultiPayload();
          uint64_t v75 = v62;
          goto LABEL_16;
        case 4:
          uint64_t v63 = v105;
          char v117 = 4;
          sub_2519C249C();
          OUTLINED_FUNCTION_6_12();
          type metadata accessor for CallToActionSnippetModel();
          sub_2519C33F0(&qword_269B94810, (void (*)(uint64_t))type metadata accessor for CallToActionSnippetModel);
          uint64_t v64 = v89;
          sub_2519CA480();
          OUTLINED_FUNCTION_2_10();
          v70();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_5_1();
          v71();
          swift_storeEnumTagMultiPayload();
          uint64_t v75 = (uint64_t)v64;
          uint64_t v54 = v63;
          goto LABEL_16;
        case 5:
          char v118 = 5;
          sub_2519C2450();
          OUTLINED_FUNCTION_6_12();
          type metadata accessor for TemperatureSnippetModel();
          sub_2519C33F0(&qword_269B93F70, (void (*)(uint64_t))type metadata accessor for TemperatureSnippetModel);
          uint64_t v61 = v90;
          OUTLINED_FUNCTION_21_1();
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_2_10();
          v80();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_7_13();
          v81();
LABEL_15:
          swift_storeEnumTagMultiPayload();
          uint64_t v75 = (uint64_t)v61;
          uint64_t v54 = v105;
LABEL_16:
          uint64_t v74 = (uint64_t)v88;
          break;
        default:
          char v113 = 0;
          sub_2519C25CC();
          OUTLINED_FUNCTION_6_12();
          type metadata accessor for DisambiguationSnippetModel(0);
          sub_2519C33F0(&qword_269B94438, (void (*)(uint64_t))type metadata accessor for DisambiguationSnippetModel);
          uint64_t v65 = (uint64_t)v86;
          sub_2519CA480();
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_2_10();
          v72();
          swift_unknownObjectRelease();
          OUTLINED_FUNCTION_7_13();
          v73();
          swift_storeEnumTagMultiPayload();
          uint64_t v74 = (uint64_t)v88;
          uint64_t v75 = v65;
          break;
      }
      sub_2519C3300(v75, v74, (void (*)(void))type metadata accessor for HomeAutomationSnippetModels);
      sub_2519C3300(v74, v54, (void (*)(void))type metadata accessor for HomeAutomationSnippetModels);
    }
    else
    {
      uint64_t v55 = v106;
      uint64_t v56 = sub_2519CA3E0();
      swift_allocError();
      uint64_t v58 = v57;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B948F0);
      *uint64_t v58 = v55;
      uint64_t v59 = v112;
      sub_2519CA450();
      sub_2519CA3D0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v56 - 8) + 104))(v58, *MEMORY[0x263F8DCB0], v56);
      swift_willThrow();
LABEL_7:
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v59, v45);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v111);
}

unint64_t sub_2519C322C()
{
  return 0xD000000000000016;
}

uint64_t sub_2519C3254@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeAutomationSnippetModels.init(from:)(a1, a2);
}

uint64_t sub_2519C326C(void *a1)
{
  return HomeAutomationSnippetModels.encode(to:)(a1);
}

uint64_t sub_2519C3284(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_2519C3300(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_2519C3360()
{
  return sub_2519C33F0(&qword_269B948F8, (void (*)(uint64_t))type metadata accessor for HomeAutomationSnippetModels);
}

uint64_t sub_2519C33A8()
{
  return sub_2519C33F0(&qword_269B94900, (void (*)(uint64_t))type metadata accessor for HomeAutomationSnippetModels);
}

uint64_t sub_2519C33F0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for HomeAutomationSnippetModels(char *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v15 = *((void *)a2 + 1);
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = v15;
        uint64_t v16 = *((void *)a2 + 3);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = v16;
        uint64_t v17 = *((void *)a2 + 5);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = v17;
        uint64_t v18 = (int *)type metadata accessor for ConfirmationSnippetModel();
        uint64_t v19 = v18[7];
        uint64_t v20 = &a1[v19];
        uint64_t v21 = &a2[v19];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
        v23(v20, v21, v22);
        v160 = v23;
        v23(&a1[v18[8]], &a2[v18[8]], v22);
        uint64_t v24 = v18[9];
        uint64_t v25 = &a1[v24];
        uint64_t v26 = &a2[v24];
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
        v28(v25, v26, v27);
        v28(&a1[v18[10]], &a2[v18[10]], v27);
        uint64_t v29 = v18[11];
        __dst = &a1[v29];
        uint64_t v30 = &a2[v29];
        uint64_t v31 = (int *)type metadata accessor for IconConfiguration();
        if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, (uint64_t)v31))
        {
          uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
          memcpy(__dst, v30, *(void *)(*(void *)(v32 - 8) + 64));
        }
        else
        {
          uint64_t v152 = v27;
          v159 = v18;
          v160(__dst, v30, v22);
          uint64_t v98 = v31[5];
          uint64_t v99 = &__dst[v98];
          uint64_t v100 = &v30[v98];
          uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
          uint64_t v157 = *(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 16);
          v157(v99, v100, v101);
          uint64_t v102 = v31[6];
          uint64_t v103 = &__dst[v102];
          uint64_t v104 = &v30[v102];
          uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v105 - 8) + 16))(v103, v104, v105);
          uint64_t v106 = v31[7];
          uint64_t v155 = &__dst[v106];
          uint64_t v107 = &v30[v106];
          uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
          uint64_t v109 = *(void (**)(char *, char *, uint64_t))(*(void *)(v108 - 8) + 16);
          v109(v155, v107, v108);
          v109(&__dst[v31[8]], &v30[v31[8]], v108);
          uint64_t v110 = v31[9];
          uint64_t v111 = &__dst[v110];
          uint64_t v112 = &v30[v110];
          uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v113 - 8) + 16))(v111, v112, v113);
          v157(&__dst[v31[10]], &v30[v31[10]], v101);
          uint64_t v114 = v31[11];
          char v115 = &__dst[v114];
          char v116 = &v30[v114];
          uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v117 - 8) + 16))(v115, v116, v117);
          v157(&__dst[v31[12]], &v30[v31[12]], v101);
          v157(&__dst[v31[13]], &v30[v31[13]], v101);
          uint64_t v118 = v31[14];
          uint64_t v119 = &__dst[v118];
          uint64_t v120 = &v30[v118];
          uint64_t v121 = type metadata accessor for DirectInvocationConfig();
          if (__swift_getEnumTagSinglePayload((uint64_t)v120, 1, v121))
          {
            uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
            memcpy(v119, v120, *(void *)(*(void *)(v122 - 8) + 64));
          }
          else
          {
            v28(v119, v120, v152);
            __swift_storeEnumTagSinglePayload((uint64_t)v119, 0, 1, v121);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, (uint64_t)v31);
          uint64_t v18 = v159;
        }
        a1[v18[12]] = a2[v18[12]];
        break;
      case 2u:
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(a1, a2, v33);
        uint64_t v34 = (int *)type metadata accessor for CompletionSnippetModel();
        uint64_t v35 = v34[5];
        uint64_t v36 = &a1[v35];
        uint64_t v37 = &a2[v35];
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
        uint64_t v39 = v34[6];
        uint64_t v40 = &a1[v39];
        uint64_t v41 = &a2[v39];
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
        uint64_t v43 = v34[7];
        uint64_t v44 = &a1[v43];
        uint64_t v45 = &a2[v43];
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        uint64_t v47 = *(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16);
        v47(v44, v45, v46);
        v47(&a1[v34[8]], &a2[v34[8]], v46);
        uint64_t v48 = v34[9];
        uint64_t v49 = &a1[v48];
        uint64_t v50 = &a2[v48];
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
        uint64_t v52 = v34[10];
        uint64_t v53 = &a1[v52];
        uint64_t v54 = &a2[v52];
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v55 - 8) + 16))(v53, v54, v55);
        v47(&a1[v34[11]], &a2[v34[11]], v46);
        break;
      case 3u:
        uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v57 = *(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 16);
        v57(a1, a2, v56);
        uint64_t v58 = (int *)type metadata accessor for AutomationSnippetModel();
        uint64_t v59 = v58[5];
        uint64_t v60 = &a1[v59];
        uint64_t v61 = &a2[v59];
        uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 16))(v60, v61, v62);
        uint64_t v63 = v58[6];
        uint64_t v64 = &a1[v63];
        uint64_t v65 = &a2[v63];
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(v64, v65, v66);
        v57(&a1[v58[7]], &a2[v58[7]], v56);
        v57(&a1[v58[8]], &a2[v58[8]], v56);
        uint64_t v67 = v58[9];
        uint64_t v68 = &a1[v67];
        uint64_t v69 = &a2[v67];
        uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v70 - 8) + 16))(v68, v69, v70);
        break;
      case 4u:
        uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16))(a1, a2, v71);
        uint64_t v72 = type metadata accessor for CallToActionSnippetModel();
        uint64_t v73 = *(int *)(v72 + 20);
        uint64_t v74 = &a1[v73];
        uint64_t v75 = &a2[v73];
        uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 16))(v74, v75, v76);
        a1[*(int *)(v72 + 24)] = a2[*(int *)(v72 + 24)];
        break;
      case 5u:
        uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16))(a1, a2, v77);
        uint64_t v78 = (int *)type metadata accessor for TemperatureSnippetModel();
        uint64_t v79 = v78[5];
        uint64_t v80 = &a1[v79];
        uint64_t v81 = &a2[v79];
        uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v83 = *(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 16);
        v83(v80, v81, v82);
        v83(&a1[v78[6]], &a2[v78[6]], v82);
        uint64_t v84 = v78[7];
        long long v85 = &a1[v84];
        uint64_t v86 = &a2[v84];
        uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 16))(v85, v86, v87);
        uint64_t v88 = v78[8];
        long long v89 = &a1[v88];
        uint64_t v90 = &a2[v88];
        uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 16))(v89, v90, v91);
        break;
      default:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
        v7(a1, a2, v6);
        uint64_t v8 = type metadata accessor for DisambiguationSnippetModel(0);
        *(void *)&a1[*(int *)(v8 + 20)] = *(void *)&a2[*(int *)(v8 + 20)];
        uint64_t v9 = *(int *)(v8 + 24);
        uint64_t v10 = &a1[v9];
        uint64_t v11 = &a2[v9];
        uint64_t v12 = type metadata accessor for DisambiguationOption(0);
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
        {
          uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
          memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
        }
        else
        {
          uint64_t v92 = *((void *)v11 + 1);
          *(void *)uint64_t v10 = *(void *)v11;
          *((void *)v10 + 1) = v92;
          uint64_t v93 = *((void *)v11 + 3);
          *((void *)v10 + 2) = *((void *)v11 + 2);
          *((void *)v10 + 3) = v93;
          __dsta = (int *)v12;
          uint64_t v164 = (uint64_t)v10;
          uint64_t v94 = *(int *)(v12 + 24);
          v161 = &v10[v94];
          uint64_t v95 = &v11[v94];
          uint64_t v96 = (int *)type metadata accessor for IconConfiguration();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (__swift_getEnumTagSinglePayload((uint64_t)v95, 1, (uint64_t)v96))
          {
            uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
            memcpy(v161, v95, *(void *)(*(void *)(v97 - 8) + 64));
          }
          else
          {
            v7(v161, v95, v6);
            uint64_t v123 = v96[5];
            uint64_t v124 = &v161[v123];
            uint64_t v125 = &v95[v123];
            uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
            uint64_t v158 = *(void (**)(char *, char *, uint64_t))(*(void *)(v156 - 8) + 16);
            v158(v124, v125, v156);
            uint64_t v126 = v96[6];
            uint64_t v127 = &v161[v126];
            uint64_t v128 = &v95[v126];
            uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v129 - 8) + 16))(v127, v128, v129);
            uint64_t v130 = v96[7];
            long long v153 = &v161[v130];
            uint64_t v131 = &v95[v130];
            uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
            uint64_t v133 = *(void (**)(char *, char *, uint64_t))(*(void *)(v132 - 8) + 16);
            v133(v153, v131, v132);
            v133(&v161[v96[8]], &v95[v96[8]], v132);
            uint64_t v134 = v96[9];
            uint64_t v135 = &v161[v134];
            uint64_t v136 = &v95[v134];
            uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 16))(v135, v136, v137);
            v158(&v161[v96[10]], &v95[v96[10]], v156);
            uint64_t v138 = v96[11];
            uint64_t v154 = &v161[v138];
            uint64_t v139 = &v95[v138];
            uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v140 - 8) + 16))(v154, v139, v140);
            v158(&v161[v96[12]], &v95[v96[12]], v156);
            v158(&v161[v96[13]], &v95[v96[13]], v156);
            uint64_t v141 = v96[14];
            uint64_t v142 = &v161[v141];
            uint64_t v143 = &v95[v141];
            uint64_t v144 = type metadata accessor for DirectInvocationConfig();
            if (__swift_getEnumTagSinglePayload((uint64_t)v143, 1, v144))
            {
              uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
              memcpy(v142, v143, *(void *)(*(void *)(v145 - 8) + 64));
            }
            else
            {
              uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
              (*(void (**)(char *, char *, uint64_t))(*(void *)(v146 - 8) + 16))(v142, v143, v146);
              __swift_storeEnumTagSinglePayload((uint64_t)v142, 0, 1, v144);
            }
            __swift_storeEnumTagSinglePayload((uint64_t)v161, 0, 1, (uint64_t)v96);
          }
          uint64_t v147 = __dsta[7];
          uint64_t v148 = v164 + v147;
          long long v149 = &v11[v147];
          uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
          (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v150 - 8) + 16))(v148, v149, v150);
          __swift_storeEnumTagSinglePayload(v164, 0, 1, (uint64_t)__dsta);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HomeAutomationSnippetModels(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      v4(a1, v3);
      uint64_t v5 = type metadata accessor for DisambiguationSnippetModel(0);
      swift_bridgeObjectRelease();
      a1 += *(int *)(v5 + 24);
      uint64_t v6 = type metadata accessor for DisambiguationOption(0);
      uint64_t result = __swift_getEnumTagSinglePayload(a1, 1, v6);
      if (!result)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v7 = a1 + *(int *)(v6 + 24);
        uint64_t v8 = (int *)type metadata accessor for IconConfiguration();
        if (!__swift_getEnumTagSinglePayload(v7, 1, (uint64_t)v8))
        {
          v4(v7, v3);
          uint64_t v9 = v7 + v8[5];
          uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
          uint64_t v79 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
          v79(v9, v10);
          uint64_t v11 = v7 + v8[6];
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
          uint64_t v13 = v7 + v8[7];
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
          uint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
          v15(v13, v14);
          v15(v7 + v8[8], v14);
          uint64_t v16 = v7 + v8[9];
          uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
          v79(v7 + v8[10], v10);
          uint64_t v18 = v7 + v8[11];
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
          v79(v7 + v8[12], v10);
          v79(v7 + v8[13], v10);
          uint64_t v20 = v7 + v8[14];
          uint64_t v21 = type metadata accessor for DirectInvocationConfig();
          if (!__swift_getEnumTagSinglePayload(v20, 1, v21))
          {
            uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v20, v22);
          }
        }
        uint64_t v23 = *(int *)(v6 + 28);
        goto LABEL_14;
      }
      return result;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v24 = (int *)type metadata accessor for ConfirmationSnippetModel();
      uint64_t v25 = a1 + v24[7];
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v27 = *(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8);
      v27(v25, v26);
      v27(a1 + v24[8], v26);
      uint64_t v28 = a1 + v24[9];
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      uint64_t v80 = *(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v80)((void *)(v29 - 8), v28, v29);
      v80(a1 + v24[10], v29);
      uint64_t v30 = a1 + v24[11];
      uint64_t v31 = (int *)type metadata accessor for IconConfiguration();
      uint64_t result = __swift_getEnumTagSinglePayload(v30, 1, (uint64_t)v31);
      if (!result)
      {
        v27(v30, v26);
        uint64_t v32 = v30 + v31[5];
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v34 = *(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8);
        v34(v32, v33);
        uint64_t v35 = v30 + v31[6];
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v36 - 8) + 8))(v35, v36);
        uint64_t v37 = v30 + v31[7];
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        uint64_t v39 = *(void (**)(uint64_t, uint64_t))(*(void *)(v38 - 8) + 8);
        v39(v37, v38);
        v39(v30 + v31[8], v38);
        uint64_t v40 = v30 + v31[9];
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8))(v40, v41);
        v34(v30 + v31[10], v33);
        uint64_t v42 = v30 + v31[11];
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8))(v42, v43);
        v34(v30 + v31[12], v33);
        v34(v30 + v31[13], v33);
        uint64_t v44 = v30 + v31[14];
        uint64_t v45 = type metadata accessor for DirectInvocationConfig();
        uint64_t result = __swift_getEnumTagSinglePayload(v44, 1, v45);
        if (!result)
        {
          uint64_t v58 = v44;
          uint64_t v59 = v29;
          goto LABEL_11;
        }
      }
      return result;
    case 2:
      uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v46 - 8) + 8))(a1, v46);
      uint64_t v47 = (int *)type metadata accessor for CompletionSnippetModel();
      uint64_t v48 = a1 + v47[5];
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v49 - 8) + 8))(v48, v49);
      uint64_t v50 = a1 + v47[6];
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v51 - 8) + 8))(v50, v51);
      uint64_t v52 = a1 + v47[7];
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      uint64_t v80 = *(void (**)(uint64_t, uint64_t))(*(void *)(v53 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v80)((void *)(v53 - 8), v52, v53);
      v80(a1 + v47[8], v53);
      uint64_t v54 = a1 + v47[9];
      uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v55 - 8) + 8))(v54, v55);
      uint64_t v56 = a1 + v47[10];
      uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v57 - 8) + 8))(v56, v57);
      uint64_t v58 = a1 + v47[11];
      uint64_t v59 = v53;
LABEL_11:
      uint64_t v60 = (uint64_t (*)(uint64_t, uint64_t))v80;
      goto LABEL_17;
    case 3:
      uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v62 = *(void (**)(uint64_t, uint64_t))(*(void *)(v61 - 8) + 8);
      v62(a1, v61);
      uint64_t v63 = (int *)type metadata accessor for AutomationSnippetModel();
      uint64_t v64 = a1 + v63[5];
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v65 - 8) + 8))(v64, v65);
      uint64_t v66 = a1 + v63[6];
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v67 - 8) + 8))(v66, v67);
      v62(a1 + v63[7], v61);
      v62(a1 + v63[8], v61);
      uint64_t v68 = a1 + v63[9];
      uint64_t v69 = &qword_269B93C00;
      goto LABEL_16;
    case 4:
      uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v70 - 8) + 8))(a1, v70);
      uint64_t v23 = *(int *)(type metadata accessor for CallToActionSnippetModel() + 20);
LABEL_14:
      uint64_t v68 = a1 + v23;
      uint64_t v69 = &qword_269B93FC0;
      goto LABEL_16;
    case 5:
      uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v71 - 8) + 8))(a1, v71);
      uint64_t v72 = (int *)type metadata accessor for TemperatureSnippetModel();
      uint64_t v73 = a1 + v72[5];
      uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v75 = *(void (**)(uint64_t, uint64_t))(*(void *)(v74 - 8) + 8);
      v75(v73, v74);
      v75(a1 + v72[6], v74);
      uint64_t v76 = a1 + v72[7];
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v77 - 8) + 8))(v76, v77);
      uint64_t v68 = a1 + v72[8];
      uint64_t v69 = &qword_269B93F10;
LABEL_16:
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(v69);
      uint64_t v60 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v78 - 8) + 8);
      uint64_t v59 = v78;
      uint64_t v58 = v68;
LABEL_17:
      uint64_t result = v60(v58, v59);
      break;
    default:
      return result;
  }
  return result;
}

char *initializeWithCopy for HomeAutomationSnippetModels(char *a1, char *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v12 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v12;
      uint64_t v13 = *((void *)a2 + 3);
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *((void *)a1 + 3) = v13;
      uint64_t v14 = *((void *)a2 + 5);
      *((void *)a1 + 4) = *((void *)a2 + 4);
      *((void *)a1 + 5) = v14;
      uint64_t v15 = (int *)type metadata accessor for ConfirmationSnippetModel();
      uint64_t v16 = v15[7];
      uint64_t v17 = &a1[v16];
      uint64_t v18 = &a2[v16];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
      v20(v17, v18, v19);
      __dst = v20;
      v20(&a1[v15[8]], &a2[v15[8]], v19);
      uint64_t v21 = v15[9];
      uint64_t v22 = &a1[v21];
      uint64_t v23 = &a2[v21];
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16);
      v25(v22, v23, v24);
      v25(&a1[v15[10]], &a2[v15[10]], v24);
      v162 = v15;
      uint64_t v26 = v15[11];
      uint64_t v27 = &a1[v26];
      uint64_t v28 = &a2[v26];
      uint64_t v29 = (int *)type metadata accessor for IconConfiguration();
      if (__swift_getEnumTagSinglePayload((uint64_t)v28, 1, (uint64_t)v29))
      {
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
        memcpy(v27, v28, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        uint64_t v152 = v25;
        uint64_t v155 = v24;
        __dst(v27, v28, v19);
        uint64_t v96 = v29[5];
        uint64_t v97 = &v27[v96];
        uint64_t v98 = &v28[v96];
        uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        v159 = *(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 16);
        v159(v97, v98, v99);
        uint64_t v100 = v29[6];
        uint64_t v101 = &v27[v100];
        uint64_t v102 = &v28[v100];
        uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v103 - 8) + 16))(v101, v102, v103);
        uint64_t v104 = v29[7];
        uint64_t v157 = &v27[v104];
        uint64_t v105 = &v28[v104];
        uint64_t v106 = v27;
        uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        uint64_t v108 = *(void (**)(char *, char *, uint64_t))(*(void *)(v107 - 8) + 16);
        v108(v157, v105, v107);
        v108(&v106[v29[8]], &v28[v29[8]], v107);
        uint64_t v109 = v29[9];
        uint64_t v110 = &v106[v109];
        uint64_t v111 = &v28[v109];
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v112 - 8) + 16))(v110, v111, v112);
        v159(&v106[v29[10]], &v28[v29[10]], v99);
        uint64_t v113 = v29[11];
        uint64_t v114 = &v106[v113];
        char v115 = &v28[v113];
        uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v116 - 8) + 16))(v114, v115, v116);
        v159(&v106[v29[12]], &v28[v29[12]], v99);
        v159(&v106[v29[13]], &v28[v29[13]], v99);
        uint64_t v117 = v29[14];
        uint64_t v118 = (uint64_t)v106;
        uint64_t v119 = &v106[v117];
        uint64_t v120 = &v28[v117];
        uint64_t v121 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v120, 1, v121))
        {
          uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
          memcpy(v119, v120, *(void *)(*(void *)(v122 - 8) + 64));
        }
        else
        {
          v152(v119, v120, v155);
          __swift_storeEnumTagSinglePayload((uint64_t)v119, 0, 1, v121);
        }
        __swift_storeEnumTagSinglePayload(v118, 0, 1, (uint64_t)v29);
      }
      a1[v162[12]] = a2[v162[12]];
      break;
    case 2u:
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(a1, a2, v31);
      uint64_t v32 = (int *)type metadata accessor for CompletionSnippetModel();
      uint64_t v33 = v32[5];
      uint64_t v34 = &a1[v33];
      uint64_t v35 = &a2[v33];
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
      uint64_t v37 = v32[6];
      uint64_t v38 = &a1[v37];
      uint64_t v39 = &a2[v37];
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
      uint64_t v41 = v32[7];
      uint64_t v42 = &a1[v41];
      uint64_t v43 = &a2[v41];
      uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      uint64_t v45 = *(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16);
      v45(v42, v43, v44);
      v45(&a1[v32[8]], &a2[v32[8]], v44);
      uint64_t v46 = v32[9];
      uint64_t v47 = &a1[v46];
      uint64_t v48 = &a2[v46];
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16))(v47, v48, v49);
      uint64_t v50 = v32[10];
      uint64_t v51 = &a1[v50];
      uint64_t v52 = &a2[v50];
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16))(v51, v52, v53);
      v45(&a1[v32[11]], &a2[v32[11]], v44);
      break;
    case 3u:
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v55 = *(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 16);
      v55(a1, a2, v54);
      uint64_t v56 = (int *)type metadata accessor for AutomationSnippetModel();
      uint64_t v57 = v56[5];
      uint64_t v58 = &a1[v57];
      uint64_t v59 = &a2[v57];
      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16))(v58, v59, v60);
      uint64_t v61 = v56[6];
      uint64_t v62 = &a1[v61];
      uint64_t v63 = &a2[v61];
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16))(v62, v63, v64);
      v55(&a1[v56[7]], &a2[v56[7]], v54);
      v55(&a1[v56[8]], &a2[v56[8]], v54);
      uint64_t v65 = v56[9];
      uint64_t v66 = &a1[v65];
      uint64_t v67 = &a2[v65];
      uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16))(v66, v67, v68);
      break;
    case 4u:
      uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v69 - 8) + 16))(a1, a2, v69);
      uint64_t v70 = type metadata accessor for CallToActionSnippetModel();
      uint64_t v71 = *(int *)(v70 + 20);
      uint64_t v72 = &a1[v71];
      uint64_t v73 = &a2[v71];
      uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 16))(v72, v73, v74);
      a1[*(int *)(v70 + 24)] = a2[*(int *)(v70 + 24)];
      break;
    case 5u:
      uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16))(a1, a2, v75);
      uint64_t v76 = (int *)type metadata accessor for TemperatureSnippetModel();
      uint64_t v77 = v76[5];
      uint64_t v78 = &a1[v77];
      uint64_t v79 = &a2[v77];
      uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v81 = *(void (**)(char *, char *, uint64_t))(*(void *)(v80 - 8) + 16);
      v81(v78, v79, v80);
      v81(&a1[v76[6]], &a2[v76[6]], v80);
      uint64_t v82 = v76[7];
      uint64_t v83 = &a1[v82];
      uint64_t v84 = &a2[v82];
      uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v85 - 8) + 16))(v83, v84, v85);
      uint64_t v86 = v76[8];
      uint64_t v87 = &a1[v86];
      uint64_t v88 = &a2[v86];
      uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v89 - 8) + 16))(v87, v88, v89);
      break;
    default:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for DisambiguationSnippetModel(0);
      *(void *)&a1[*(int *)(v6 + 20)] = *(void *)&a2[*(int *)(v6 + 20)];
      uint64_t v7 = *(int *)(v6 + 24);
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      uint64_t v10 = type metadata accessor for DisambiguationOption(0);
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        uint64_t v163 = v10;
        uint64_t v90 = *((void *)v9 + 1);
        *(void *)uint64_t v8 = *(void *)v9;
        *((void *)v8 + 1) = v90;
        uint64_t v91 = *((void *)v9 + 3);
        *((void *)v8 + 2) = *((void *)v9 + 2);
        *((void *)v8 + 3) = v91;
        uint64_t v92 = *(int *)(v10 + 24);
        __dsta = &v8[v92];
        uint64_t v93 = &v9[v92];
        uint64_t v94 = (int *)type metadata accessor for IconConfiguration();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v93, 1, (uint64_t)v94))
        {
          uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
          memcpy(__dsta, v93, *(void *)(*(void *)(v95 - 8) + 64));
        }
        else
        {
          v5(__dsta, v93, v4);
          uint64_t v123 = v94[5];
          uint64_t v124 = &__dsta[v123];
          uint64_t v125 = &v93[v123];
          uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
          uint64_t v158 = *(void (**)(char *, char *, uint64_t))(*(void *)(v156 - 8) + 16);
          v158(v124, v125, v156);
          uint64_t v126 = v94[6];
          uint64_t v127 = &__dsta[v126];
          uint64_t v128 = &v93[v126];
          uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v129 - 8) + 16))(v127, v128, v129);
          uint64_t v130 = v94[7];
          long long v153 = &__dsta[v130];
          uint64_t v131 = &v93[v130];
          uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
          uint64_t v133 = *(void (**)(char *, char *, uint64_t))(*(void *)(v132 - 8) + 16);
          v133(v153, v131, v132);
          v133(&__dsta[v94[8]], &v93[v94[8]], v132);
          uint64_t v134 = v94[9];
          uint64_t v135 = &__dsta[v134];
          uint64_t v136 = &v93[v134];
          uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 16))(v135, v136, v137);
          v158(&__dsta[v94[10]], &v93[v94[10]], v156);
          uint64_t v138 = v94[11];
          uint64_t v154 = &__dsta[v138];
          uint64_t v139 = &v93[v138];
          uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v140 - 8) + 16))(v154, v139, v140);
          v158(&__dsta[v94[12]], &v93[v94[12]], v156);
          v158(&__dsta[v94[13]], &v93[v94[13]], v156);
          uint64_t v141 = v94[14];
          uint64_t v142 = &__dsta[v141];
          uint64_t v143 = &v93[v141];
          uint64_t v144 = type metadata accessor for DirectInvocationConfig();
          if (__swift_getEnumTagSinglePayload((uint64_t)v143, 1, v144))
          {
            uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
            memcpy(v142, v143, *(void *)(*(void *)(v145 - 8) + 64));
          }
          else
          {
            uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v146 - 8) + 16))(v142, v143, v146);
            __swift_storeEnumTagSinglePayload((uint64_t)v142, 0, 1, v144);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)__dsta, 0, 1, (uint64_t)v94);
        }
        uint64_t v147 = *(int *)(v163 + 28);
        uint64_t v148 = &v8[v147];
        long long v149 = &v9[v147];
        uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v150 - 8) + 16))(v148, v149, v150);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v163);
      }
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithCopy for HomeAutomationSnippetModels(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_2519C1118((uint64_t)a1, (void (*)(void))type metadata accessor for HomeAutomationSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *(void *)a1 = *(void *)a2;
        *((void *)a1 + 1) = *((void *)a2 + 1);
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        *((void *)a1 + 4) = *((void *)a2 + 4);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        uint64_t v12 = (int *)type metadata accessor for ConfirmationSnippetModel();
        uint64_t v13 = v12[7];
        uint64_t v14 = &a1[v13];
        uint64_t v15 = &a2[v13];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16);
        v17(v14, v15, v16);
        __dst = v17;
        v17(&a1[v12[8]], &a2[v12[8]], v16);
        uint64_t v18 = v12[9];
        uint64_t v19 = &a1[v18];
        uint64_t v20 = &a2[v18];
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
        v22(v19, v20, v21);
        v22(&a1[v12[10]], &a2[v12[10]], v21);
        uint64_t v158 = v12;
        uint64_t v23 = v12[11];
        uint64_t v24 = &a1[v23];
        uint64_t v25 = &a2[v23];
        uint64_t v26 = (int *)type metadata accessor for IconConfiguration();
        if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, (uint64_t)v26))
        {
          uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
          memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          long long v149 = v22;
          uint64_t v151 = v21;
          __dst(v24, v25, v16);
          uint64_t v91 = v26[5];
          uint64_t v92 = &v24[v91];
          uint64_t v93 = &v25[v91];
          uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
          uint64_t v154 = *(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 16);
          v154(v92, v93, v94);
          uint64_t v95 = v26[6];
          uint64_t v96 = &v24[v95];
          uint64_t v97 = &v25[v95];
          uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v98 - 8) + 16))(v96, v97, v98);
          uint64_t v99 = v26[7];
          long long v153 = &v24[v99];
          uint64_t v100 = &v25[v99];
          uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
          uint64_t v102 = v24;
          uint64_t v103 = *(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 16);
          v103(v153, v100, v101);
          v103(&v102[v26[8]], &v25[v26[8]], v101);
          uint64_t v104 = v26[9];
          uint64_t v105 = &v102[v104];
          uint64_t v106 = &v25[v104];
          uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v107 - 8) + 16))(v105, v106, v107);
          v154(&v102[v26[10]], &v25[v26[10]], v94);
          uint64_t v108 = v26[11];
          uint64_t v109 = &v102[v108];
          uint64_t v110 = &v25[v108];
          uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v111 - 8) + 16))(v109, v110, v111);
          v154(&v102[v26[12]], &v25[v26[12]], v94);
          v154(&v102[v26[13]], &v25[v26[13]], v94);
          uint64_t v112 = v26[14];
          uint64_t v113 = (uint64_t)v102;
          uint64_t v114 = &v102[v112];
          char v115 = &v25[v112];
          uint64_t v116 = type metadata accessor for DirectInvocationConfig();
          if (__swift_getEnumTagSinglePayload((uint64_t)v115, 1, v116))
          {
            uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
            memcpy(v114, v115, *(void *)(*(void *)(v117 - 8) + 64));
          }
          else
          {
            v149(v114, v115, v151);
            __swift_storeEnumTagSinglePayload((uint64_t)v114, 0, 1, v116);
          }
          __swift_storeEnumTagSinglePayload(v113, 0, 1, (uint64_t)v26);
        }
        a1[v158[12]] = a2[v158[12]];
        break;
      case 2u:
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(a1, a2, v28);
        uint64_t v29 = (int *)type metadata accessor for CompletionSnippetModel();
        uint64_t v30 = v29[5];
        uint64_t v31 = &a1[v30];
        uint64_t v32 = &a2[v30];
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
        uint64_t v34 = v29[6];
        uint64_t v35 = &a1[v34];
        uint64_t v36 = &a2[v34];
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
        uint64_t v38 = v29[7];
        uint64_t v39 = &a1[v38];
        uint64_t v40 = &a2[v38];
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        uint64_t v42 = *(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16);
        v42(v39, v40, v41);
        v42(&a1[v29[8]], &a2[v29[8]], v41);
        uint64_t v43 = v29[9];
        uint64_t v44 = &a1[v43];
        uint64_t v45 = &a2[v43];
        uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
        uint64_t v47 = v29[10];
        uint64_t v48 = &a1[v47];
        uint64_t v49 = &a2[v47];
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
        v42(&a1[v29[11]], &a2[v29[11]], v41);
        break;
      case 3u:
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v52 = *(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16);
        v52(a1, a2, v51);
        uint64_t v53 = (int *)type metadata accessor for AutomationSnippetModel();
        uint64_t v54 = v53[5];
        uint64_t v55 = &a1[v54];
        uint64_t v56 = &a2[v54];
        uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(v55, v56, v57);
        uint64_t v58 = v53[6];
        uint64_t v59 = &a1[v58];
        uint64_t v60 = &a2[v58];
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
        v52(&a1[v53[7]], &a2[v53[7]], v51);
        v52(&a1[v53[8]], &a2[v53[8]], v51);
        uint64_t v62 = v53[9];
        uint64_t v63 = &a1[v62];
        uint64_t v64 = &a2[v62];
        uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v65 - 8) + 16))(v63, v64, v65);
        break;
      case 4u:
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(a1, a2, v66);
        uint64_t v67 = type metadata accessor for CallToActionSnippetModel();
        uint64_t v68 = *(int *)(v67 + 20);
        uint64_t v69 = &a1[v68];
        uint64_t v70 = &a2[v68];
        uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16))(v69, v70, v71);
        a1[*(int *)(v67 + 24)] = a2[*(int *)(v67 + 24)];
        break;
      case 5u:
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 16))(a1, a2, v72);
        uint64_t v73 = (int *)type metadata accessor for TemperatureSnippetModel();
        uint64_t v74 = v73[5];
        uint64_t v75 = &a1[v74];
        uint64_t v76 = &a2[v74];
        uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v78 = *(void (**)(char *, char *, uint64_t))(*(void *)(v77 - 8) + 16);
        v78(v75, v76, v77);
        v78(&a1[v73[6]], &a2[v73[6]], v77);
        uint64_t v79 = v73[7];
        uint64_t v80 = &a1[v79];
        uint64_t v81 = &a2[v79];
        uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 16))(v80, v81, v82);
        uint64_t v83 = v73[8];
        uint64_t v84 = &a1[v83];
        uint64_t v85 = &a2[v83];
        uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v86 - 8) + 16))(v84, v85, v86);
        break;
      default:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 16);
        v5(a1, a2, v4);
        uint64_t v6 = type metadata accessor for DisambiguationSnippetModel(0);
        *(void *)&a1[*(int *)(v6 + 20)] = *(void *)&a2[*(int *)(v6 + 20)];
        uint64_t v7 = *(int *)(v6 + 24);
        uint64_t v8 = &a1[v7];
        uint64_t v9 = &a2[v7];
        uint64_t v10 = type metadata accessor for DisambiguationOption(0);
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
        {
          uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
          memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          uint64_t v159 = v10;
          *(void *)uint64_t v8 = *(void *)v9;
          *((void *)v8 + 1) = *((void *)v9 + 1);
          *((void *)v8 + 2) = *((void *)v9 + 2);
          *((void *)v8 + 3) = *((void *)v9 + 3);
          uint64_t v87 = *(int *)(v10 + 24);
          __dsta = &v8[v87];
          uint64_t v88 = &v9[v87];
          uint64_t v89 = (int *)type metadata accessor for IconConfiguration();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (__swift_getEnumTagSinglePayload((uint64_t)v88, 1, (uint64_t)v89))
          {
            uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
            memcpy(__dsta, v88, *(void *)(*(void *)(v90 - 8) + 64));
          }
          else
          {
            uint64_t v155 = v8;
            v5(__dsta, v88, v4);
            uint64_t v118 = v89[5];
            uint64_t v119 = &__dsta[v118];
            uint64_t v120 = &v88[v118];
            uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
            uint64_t v152 = *(void (**)(char *, char *, uint64_t))(*(void *)(v150 - 8) + 16);
            v152(v119, v120, v150);
            uint64_t v121 = v89[6];
            uint64_t v122 = &__dsta[v121];
            uint64_t v123 = &v88[v121];
            uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v124 - 8) + 16))(v122, v123, v124);
            uint64_t v125 = v89[7];
            uint64_t v126 = &__dsta[v125];
            uint64_t v127 = &v88[v125];
            uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
            uint64_t v129 = *(void (**)(char *, char *, uint64_t))(*(void *)(v128 - 8) + 16);
            v129(v126, v127, v128);
            v129(&__dsta[v89[8]], &v88[v89[8]], v128);
            uint64_t v130 = v89[9];
            uint64_t v131 = &__dsta[v130];
            uint64_t v132 = &v88[v130];
            uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v133 - 8) + 16))(v131, v132, v133);
            v152(&__dsta[v89[10]], &v88[v89[10]], v150);
            uint64_t v134 = v89[11];
            uint64_t v135 = &__dsta[v134];
            uint64_t v136 = &v88[v134];
            uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 16))(v135, v136, v137);
            v152(&__dsta[v89[12]], &v88[v89[12]], v150);
            v152(&__dsta[v89[13]], &v88[v89[13]], v150);
            uint64_t v138 = v89[14];
            uint64_t v139 = &__dsta[v138];
            uint64_t v140 = &v88[v138];
            uint64_t v141 = type metadata accessor for DirectInvocationConfig();
            if (__swift_getEnumTagSinglePayload((uint64_t)v140, 1, v141))
            {
              uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
              memcpy(v139, v140, *(void *)(*(void *)(v142 - 8) + 64));
            }
            else
            {
              uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
              (*(void (**)(char *, char *, uint64_t))(*(void *)(v143 - 8) + 16))(v139, v140, v143);
              __swift_storeEnumTagSinglePayload((uint64_t)v139, 0, 1, v141);
            }
            __swift_storeEnumTagSinglePayload((uint64_t)__dsta, 0, 1, (uint64_t)v89);
            uint64_t v8 = v155;
          }
          uint64_t v144 = *(int *)(v159 + 28);
          uint64_t v145 = &v8[v144];
          uint64_t v146 = &v9[v144];
          uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v147 - 8) + 16))(v145, v146, v147);
          __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v159);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for HomeAutomationSnippetModels(char *a1, char *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      long long v12 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v12;
      *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
      uint64_t v13 = (int *)type metadata accessor for ConfirmationSnippetModel();
      uint64_t v14 = v13[7];
      uint64_t v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32);
      v18(v15, v16, v17);
      v18(&a1[v13[8]], &a2[v13[8]], v17);
      uint64_t v19 = v13[9];
      uint64_t v20 = &a1[v19];
      uint64_t v21 = &a2[v19];
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32);
      v23(v20, v21, v22);
      v23(&a1[v13[10]], &a2[v13[10]], v22);
      uint64_t v155 = v13;
      uint64_t v24 = v13[11];
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      uint64_t v27 = (int *)type metadata accessor for IconConfiguration();
      if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, (uint64_t)v27))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
        memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        uint64_t v146 = v23;
        uint64_t v147 = v22;
        v18(v25, v26, v17);
        uint64_t v94 = v27[5];
        uint64_t v95 = &v25[v94];
        uint64_t v96 = &v26[v94];
        uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        long long v153 = *(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 32);
        v153(v95, v96, v97);
        uint64_t v98 = v27[6];
        uint64_t v99 = &v25[v98];
        uint64_t v100 = &v26[v98];
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 32))(v99, v100, v101);
        uint64_t v102 = v27[7];
        uint64_t v150 = &v25[v102];
        uint64_t v103 = &v26[v102];
        uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
        uint64_t v105 = *(void (**)(char *, char *, uint64_t))(*(void *)(v104 - 8) + 32);
        v105(v150, v103, v104);
        v105(&v25[v27[8]], &v26[v27[8]], v104);
        uint64_t v106 = v27[9];
        uint64_t v107 = &v25[v106];
        uint64_t v108 = &v26[v106];
        uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v109 - 8) + 32))(v107, v108, v109);
        v153(&v25[v27[10]], &v26[v27[10]], v97);
        uint64_t v110 = v27[11];
        uint64_t v111 = &v25[v110];
        uint64_t v112 = &v26[v110];
        uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v113 - 8) + 32))(v111, v112, v113);
        v153(&v25[v27[12]], &v26[v27[12]], v97);
        v153(&v25[v27[13]], &v26[v27[13]], v97);
        uint64_t v114 = v27[14];
        char v115 = &v25[v114];
        uint64_t v116 = &v26[v114];
        uint64_t v117 = type metadata accessor for DirectInvocationConfig();
        if (__swift_getEnumTagSinglePayload((uint64_t)v116, 1, v117))
        {
          uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
          memcpy(v115, v116, *(void *)(*(void *)(v118 - 8) + 64));
        }
        else
        {
          v146(v115, v116, v147);
          __swift_storeEnumTagSinglePayload((uint64_t)v115, 0, 1, v117);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, (uint64_t)v27);
      }
      a1[v155[12]] = a2[v155[12]];
      break;
    case 2u:
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(a1, a2, v29);
      uint64_t v30 = (int *)type metadata accessor for CompletionSnippetModel();
      uint64_t v31 = v30[5];
      uint64_t v32 = &a1[v31];
      uint64_t v33 = &a2[v31];
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
      uint64_t v35 = v30[6];
      uint64_t v36 = &a1[v35];
      uint64_t v37 = &a2[v35];
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
      uint64_t v39 = v30[7];
      uint64_t v40 = &a1[v39];
      uint64_t v41 = &a2[v39];
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32);
      v43(v40, v41, v42);
      v43(&a1[v30[8]], &a2[v30[8]], v42);
      uint64_t v44 = v30[9];
      uint64_t v45 = &a1[v44];
      uint64_t v46 = &a2[v44];
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
      uint64_t v48 = v30[10];
      uint64_t v49 = &a1[v48];
      uint64_t v50 = &a2[v48];
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v49, v50, v51);
      v43(&a1[v30[11]], &a2[v30[11]], v42);
      break;
    case 3u:
      uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v53 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32);
      v53(a1, a2, v52);
      uint64_t v54 = (int *)type metadata accessor for AutomationSnippetModel();
      uint64_t v55 = v54[5];
      uint64_t v56 = &a1[v55];
      uint64_t v57 = &a2[v55];
      uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32))(v56, v57, v58);
      uint64_t v59 = v54[6];
      uint64_t v60 = &a1[v59];
      uint64_t v61 = &a2[v59];
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32))(v60, v61, v62);
      v53(&a1[v54[7]], &a2[v54[7]], v52);
      v53(&a1[v54[8]], &a2[v54[8]], v52);
      uint64_t v63 = v54[9];
      uint64_t v64 = &a1[v63];
      uint64_t v65 = &a2[v63];
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v64, v65, v66);
      break;
    case 4u:
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 32))(a1, a2, v67);
      uint64_t v68 = type metadata accessor for CallToActionSnippetModel();
      uint64_t v69 = *(int *)(v68 + 20);
      uint64_t v70 = &a1[v69];
      uint64_t v71 = &a2[v69];
      uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 32))(v70, v71, v72);
      a1[*(int *)(v68 + 24)] = a2[*(int *)(v68 + 24)];
      break;
    case 5u:
      uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 32))(a1, a2, v73);
      uint64_t v74 = (int *)type metadata accessor for TemperatureSnippetModel();
      uint64_t v75 = v74[5];
      uint64_t v76 = &a1[v75];
      uint64_t v77 = &a2[v75];
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
      uint64_t v79 = *(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 32);
      v79(v76, v77, v78);
      v79(&a1[v74[6]], &a2[v74[6]], v78);
      uint64_t v80 = v74[7];
      uint64_t v81 = &a1[v80];
      uint64_t v82 = &a2[v80];
      uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v81, v82, v83);
      uint64_t v84 = v74[8];
      uint64_t v85 = &a1[v84];
      uint64_t v86 = &a2[v84];
      uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 32))(v85, v86, v87);
      break;
    default:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
      uint64_t v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for DisambiguationSnippetModel(0);
      *(void *)&a1[*(int *)(v6 + 20)] = *(void *)&a2[*(int *)(v6 + 20)];
      uint64_t v7 = *(int *)(v6 + 24);
      uint64_t v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      uint64_t v10 = type metadata accessor for DisambiguationOption(0);
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        long long v88 = *((_OWORD *)v9 + 1);
        *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
        *((_OWORD *)v8 + 1) = v88;
        uint64_t v89 = *(int *)(v10 + 24);
        uint64_t v90 = &v8[v89];
        uint64_t v91 = &v9[v89];
        uint64_t v92 = (int *)type metadata accessor for IconConfiguration();
        if (__swift_getEnumTagSinglePayload((uint64_t)v91, 1, (uint64_t)v92))
        {
          uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
          memcpy(v90, v91, *(void *)(*(void *)(v93 - 8) + 64));
        }
        else
        {
          v5(v90, v91, v4);
          uint64_t v119 = v92[5];
          uint64_t v120 = &v90[v119];
          uint64_t v121 = &v91[v119];
          uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
          uint64_t v156 = *(void (**)(char *, char *, uint64_t))(*(void *)(v154 - 8) + 32);
          v156(v120, v121, v154);
          uint64_t v122 = v92[6];
          uint64_t v123 = &v90[v122];
          uint64_t v124 = &v91[v122];
          uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v125 - 8) + 32))(v123, v124, v125);
          uint64_t v126 = v92[7];
          uint64_t v148 = &v91[v126];
          uint64_t v151 = &v90[v126];
          uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
          uint64_t v128 = *(void (**)(char *, char *, uint64_t))(*(void *)(v127 - 8) + 32);
          v128(v151, v148, v127);
          v128(&v90[v92[8]], &v91[v92[8]], v127);
          uint64_t v129 = v92[9];
          uint64_t v130 = &v90[v129];
          uint64_t v131 = &v91[v129];
          uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v132 - 8) + 32))(v130, v131, v132);
          v156(&v90[v92[10]], &v91[v92[10]], v154);
          uint64_t v133 = v92[11];
          long long v149 = &v91[v133];
          uint64_t v152 = &v90[v133];
          uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v134 - 8) + 32))(v152, v149, v134);
          v156(&v90[v92[12]], &v91[v92[12]], v154);
          v156(&v90[v92[13]], &v91[v92[13]], v154);
          uint64_t v135 = v92[14];
          uint64_t v136 = &v90[v135];
          uint64_t v137 = &v91[v135];
          uint64_t v138 = type metadata accessor for DirectInvocationConfig();
          if (__swift_getEnumTagSinglePayload((uint64_t)v137, 1, v138))
          {
            uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
            memcpy(v136, v137, *(void *)(*(void *)(v139 - 8) + 64));
          }
          else
          {
            uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v140 - 8) + 32))(v136, v137, v140);
            __swift_storeEnumTagSinglePayload((uint64_t)v136, 0, 1, v138);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v90, 0, 1, (uint64_t)v92);
        }
        uint64_t v141 = *(int *)(v10 + 28);
        uint64_t v142 = &v8[v141];
        uint64_t v143 = &v9[v141];
        uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 32))(v142, v143, v144);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      }
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *assignWithTake for HomeAutomationSnippetModels(char *a1, char *a2)
{
  if (a1 != a2)
  {
    sub_2519C1118((uint64_t)a1, (void (*)(void))type metadata accessor for HomeAutomationSnippetModels);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        long long v12 = *((_OWORD *)a2 + 1);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((_OWORD *)a1 + 1) = v12;
        *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
        uint64_t v13 = (int *)type metadata accessor for ConfirmationSnippetModel();
        uint64_t v14 = v13[7];
        uint64_t v15 = &a1[v14];
        uint64_t v16 = &a2[v14];
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32);
        v18(v15, v16, v17);
        uint64_t v155 = v18;
        v18(&a1[v13[8]], &a2[v13[8]], v17);
        uint64_t v19 = v13[9];
        uint64_t v20 = &a1[v19];
        uint64_t v21 = &a2[v19];
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32);
        v23(v20, v21, v22);
        v23(&a1[v13[10]], &a2[v13[10]], v22);
        uint64_t v157 = v13;
        uint64_t v24 = v13[11];
        uint64_t v25 = &a1[v24];
        uint64_t v26 = &a2[v24];
        uint64_t v27 = (int *)type metadata accessor for IconConfiguration();
        if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, (uint64_t)v27))
        {
          uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
          memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64));
        }
        else
        {
          long long v149 = v23;
          uint64_t v150 = v22;
          v155(v25, v26, v17);
          uint64_t v94 = v27[5];
          uint64_t v95 = &v25[v94];
          uint64_t v96 = &v26[v94];
          uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
          uint64_t v154 = *(void (**)(char *, char *, uint64_t))(*(void *)(v97 - 8) + 32);
          v154(v95, v96, v97);
          uint64_t v98 = v27[6];
          uint64_t v99 = &v25[v98];
          uint64_t v100 = &v26[v98];
          uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v101 - 8) + 32))(v99, v100, v101);
          uint64_t v102 = v27[7];
          uint64_t v152 = &v25[v102];
          uint64_t v103 = &v26[v102];
          uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
          uint64_t v105 = *(void (**)(char *, char *, uint64_t))(*(void *)(v104 - 8) + 32);
          v105(v152, v103, v104);
          v105(&v25[v27[8]], &v26[v27[8]], v104);
          uint64_t v106 = v27[9];
          uint64_t v107 = &v25[v106];
          uint64_t v108 = &v26[v106];
          uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v109 - 8) + 32))(v107, v108, v109);
          v154(&v25[v27[10]], &v26[v27[10]], v97);
          uint64_t v110 = v27[11];
          uint64_t v111 = &v25[v110];
          uint64_t v112 = &v26[v110];
          uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v113 - 8) + 32))(v111, v112, v113);
          v154(&v25[v27[12]], &v26[v27[12]], v97);
          v154(&v25[v27[13]], &v26[v27[13]], v97);
          uint64_t v114 = v27[14];
          char v115 = &v25[v114];
          uint64_t v116 = &v26[v114];
          uint64_t v117 = type metadata accessor for DirectInvocationConfig();
          if (__swift_getEnumTagSinglePayload((uint64_t)v116, 1, v117))
          {
            uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
            memcpy(v115, v116, *(void *)(*(void *)(v118 - 8) + 64));
          }
          else
          {
            v149(v115, v116, v150);
            __swift_storeEnumTagSinglePayload((uint64_t)v115, 0, 1, v117);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, (uint64_t)v27);
        }
        a1[v157[12]] = a2[v157[12]];
        break;
      case 2u:
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(a1, a2, v29);
        uint64_t v30 = (int *)type metadata accessor for CompletionSnippetModel();
        uint64_t v31 = v30[5];
        uint64_t v32 = &a1[v31];
        uint64_t v33 = &a2[v31];
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
        uint64_t v35 = v30[6];
        uint64_t v36 = &a1[v35];
        uint64_t v37 = &a2[v35];
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 32))(v36, v37, v38);
        uint64_t v39 = v30[7];
        uint64_t v40 = &a1[v39];
        uint64_t v41 = &a2[v39];
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        uint64_t v43 = *(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32);
        v43(v40, v41, v42);
        v43(&a1[v30[8]], &a2[v30[8]], v42);
        uint64_t v44 = v30[9];
        uint64_t v45 = &a1[v44];
        uint64_t v46 = &a2[v44];
        uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94148);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v45, v46, v47);
        uint64_t v48 = v30[10];
        uint64_t v49 = &a1[v48];
        uint64_t v50 = &a2[v48];
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 32))(v49, v50, v51);
        v43(&a1[v30[11]], &a2[v30[11]], v42);
        break;
      case 3u:
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v53 = *(void (**)(char *, char *, uint64_t))(*(void *)(v52 - 8) + 32);
        v53(a1, a2, v52);
        uint64_t v54 = (int *)type metadata accessor for AutomationSnippetModel();
        uint64_t v55 = v54[5];
        uint64_t v56 = &a1[v55];
        uint64_t v57 = &a2[v55];
        uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32))(v56, v57, v58);
        uint64_t v59 = v54[6];
        uint64_t v60 = &a1[v59];
        uint64_t v61 = &a2[v59];
        uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BF8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v62 - 8) + 32))(v60, v61, v62);
        v53(&a1[v54[7]], &a2[v54[7]], v52);
        v53(&a1[v54[8]], &a2[v54[8]], v52);
        uint64_t v63 = v54[9];
        uint64_t v64 = &a1[v63];
        uint64_t v65 = &a2[v63];
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v64, v65, v66);
        break;
      case 4u:
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v67 - 8) + 32))(a1, a2, v67);
        uint64_t v68 = type metadata accessor for CallToActionSnippetModel();
        uint64_t v69 = *(int *)(v68 + 20);
        uint64_t v70 = &a1[v69];
        uint64_t v71 = &a2[v69];
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v72 - 8) + 32))(v70, v71, v72);
        a1[*(int *)(v68 + 24)] = a2[*(int *)(v68 + 24)];
        break;
      case 5u:
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 32))(a1, a2, v73);
        uint64_t v74 = (int *)type metadata accessor for TemperatureSnippetModel();
        uint64_t v75 = v74[5];
        uint64_t v76 = &a1[v75];
        uint64_t v77 = &a2[v75];
        uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
        uint64_t v79 = *(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 32);
        v79(v76, v77, v78);
        v79(&a1[v74[6]], &a2[v74[6]], v78);
        uint64_t v80 = v74[7];
        uint64_t v81 = &a1[v80];
        uint64_t v82 = &a2[v80];
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v83 - 8) + 32))(v81, v82, v83);
        uint64_t v84 = v74[8];
        uint64_t v85 = &a1[v84];
        uint64_t v86 = &a2[v84];
        uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93F10);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v87 - 8) + 32))(v85, v86, v87);
        break;
      default:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93BE8);
        uint64_t v5 = *(void (**)(char *, char *, uint64_t))(*(void *)(v4 - 8) + 32);
        v5(a1, a2, v4);
        uint64_t v6 = type metadata accessor for DisambiguationSnippetModel(0);
        *(void *)&a1[*(int *)(v6 + 20)] = *(void *)&a2[*(int *)(v6 + 20)];
        uint64_t v7 = *(int *)(v6 + 24);
        uint64_t v8 = &a1[v7];
        uint64_t v9 = &a2[v7];
        uint64_t v10 = type metadata accessor for DisambiguationOption(0);
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
        {
          uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B943E8);
          memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          long long v88 = *((_OWORD *)v9 + 1);
          *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
          *((_OWORD *)v8 + 1) = v88;
          uint64_t v158 = v10;
          uint64_t v89 = *(int *)(v10 + 24);
          uint64_t v90 = &v8[v89];
          uint64_t v91 = &v9[v89];
          uint64_t v92 = (int *)type metadata accessor for IconConfiguration();
          if (__swift_getEnumTagSinglePayload((uint64_t)v91, 1, (uint64_t)v92))
          {
            uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC8);
            memcpy(v90, v91, *(void *)(*(void *)(v93 - 8) + 64));
          }
          else
          {
            v5(v90, v91, v4);
            uint64_t v119 = v92[5];
            uint64_t v120 = &v90[v119];
            uint64_t v121 = &v91[v119];
            uint64_t v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93D98);
            uint64_t v122 = *(void (**)(char *, char *, uint64_t))(*(void *)(v156 - 8) + 32);
            v122(v120, v121, v156);
            uint64_t v123 = v92[6];
            uint64_t v124 = &v90[v123];
            uint64_t v125 = &v91[v123];
            uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93C00);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v126 - 8) + 32))(v124, v125, v126);
            uint64_t v127 = v92[7];
            uint64_t v151 = &v91[v127];
            long long v153 = &v90[v127];
            uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94018);
            uint64_t v129 = *(void (**)(char *, char *, uint64_t))(*(void *)(v128 - 8) + 32);
            v129(v153, v151, v128);
            v129(&v90[v92[8]], &v91[v92[8]], v128);
            uint64_t v130 = v92[9];
            uint64_t v131 = &v90[v130];
            uint64_t v132 = &v91[v130];
            uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94020);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v133 - 8) + 32))(v131, v132, v133);
            v122(&v90[v92[10]], &v91[v92[10]], v156);
            uint64_t v134 = v92[11];
            uint64_t v135 = &v90[v134];
            uint64_t v136 = &v91[v134];
            uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94028);
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 32))(v135, v136, v137);
            v122(&v90[v92[12]], &v91[v92[12]], v156);
            v122(&v90[v92[13]], &v91[v92[13]], v156);
            uint64_t v138 = v92[14];
            uint64_t v139 = &v90[v138];
            uint64_t v140 = &v91[v138];
            uint64_t v141 = type metadata accessor for DirectInvocationConfig();
            if (__swift_getEnumTagSinglePayload((uint64_t)v140, 1, v141))
            {
              uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B94030);
              memcpy(v139, v140, *(void *)(*(void *)(v142 - 8) + 64));
            }
            else
            {
              uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
              (*(void (**)(char *, char *, uint64_t))(*(void *)(v143 - 8) + 32))(v139, v140, v143);
              __swift_storeEnumTagSinglePayload((uint64_t)v139, 0, 1, v141);
            }
            __swift_storeEnumTagSinglePayload((uint64_t)v90, 0, 1, (uint64_t)v92);
          }
          uint64_t v144 = *(int *)(v158 + 28);
          uint64_t v145 = &v8[v144];
          uint64_t v146 = &v9[v144];
          uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B93FC0);
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v147 - 8) + 32))(v145, v146, v147);
          __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v158);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2519C8C04()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2519C8C14()
{
  uint64_t result = type metadata accessor for DisambiguationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ConfirmationSnippetModel();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for CompletionSnippetModel();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for AutomationSnippetModel();
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for CallToActionSnippetModel();
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for TemperatureSnippetModel();
            if (v6 <= 0x3F)
            {
              swift_initEnumMetadataMultiPayload();
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for HomeAutomationSnippetModels.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2519C8E94);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.CodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.CodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.DisambiguationViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.DisambiguationViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.ConfirmationViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.ConfirmationViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.CompletionViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.CompletionViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.AutomationViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.AutomationViewCodingKeys;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.CallToActionViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.CallToActionViewCodingKeys;
}

unsigned char *_s25HomeAutomationUIFramework27HomeAutomationSnippetModelsO28DisambiguationViewCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2519C8FC0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeAutomationSnippetModels.TemperatureViewCodingKeys()
{
  return &type metadata for HomeAutomationSnippetModels.TemperatureViewCodingKeys;
}

unint64_t sub_2519C8FFC()
{
  unint64_t result = qword_269B94918;
  if (!qword_269B94918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94918);
  }
  return result;
}

unint64_t sub_2519C904C()
{
  unint64_t result = qword_269B94920;
  if (!qword_269B94920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94920);
  }
  return result;
}

unint64_t sub_2519C909C()
{
  unint64_t result = qword_269B94928;
  if (!qword_269B94928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94928);
  }
  return result;
}

unint64_t sub_2519C90EC()
{
  unint64_t result = qword_269B94930;
  if (!qword_269B94930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94930);
  }
  return result;
}

unint64_t sub_2519C913C()
{
  unint64_t result = qword_269B94938;
  if (!qword_269B94938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94938);
  }
  return result;
}

unint64_t sub_2519C918C()
{
  unint64_t result = qword_269B94940;
  if (!qword_269B94940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94940);
  }
  return result;
}

unint64_t sub_2519C91DC()
{
  unint64_t result = qword_269B94948;
  if (!qword_269B94948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94948);
  }
  return result;
}

unint64_t sub_2519C922C()
{
  unint64_t result = qword_269B94950;
  if (!qword_269B94950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94950);
  }
  return result;
}

unint64_t sub_2519C927C()
{
  unint64_t result = qword_269B94958;
  if (!qword_269B94958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94958);
  }
  return result;
}

unint64_t sub_2519C92CC()
{
  unint64_t result = qword_269B94960;
  if (!qword_269B94960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94960);
  }
  return result;
}

unint64_t sub_2519C931C()
{
  unint64_t result = qword_269B94968;
  if (!qword_269B94968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94968);
  }
  return result;
}

unint64_t sub_2519C936C()
{
  unint64_t result = qword_269B94970;
  if (!qword_269B94970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94970);
  }
  return result;
}

unint64_t sub_2519C93BC()
{
  unint64_t result = qword_269B94978;
  if (!qword_269B94978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94978);
  }
  return result;
}

unint64_t sub_2519C940C()
{
  unint64_t result = qword_269B94980;
  if (!qword_269B94980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94980);
  }
  return result;
}

unint64_t sub_2519C945C()
{
  unint64_t result = qword_269B94988;
  if (!qword_269B94988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94988);
  }
  return result;
}

unint64_t sub_2519C94AC()
{
  unint64_t result = qword_269B94990;
  if (!qword_269B94990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94990);
  }
  return result;
}

unint64_t sub_2519C94FC()
{
  unint64_t result = qword_269B94998;
  if (!qword_269B94998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B94998);
  }
  return result;
}

unint64_t sub_2519C954C()
{
  unint64_t result = qword_269B949A0;
  if (!qword_269B949A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B949A0);
  }
  return result;
}

unint64_t sub_2519C959C()
{
  unint64_t result = qword_269B949A8;
  if (!qword_269B949A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B949A8);
  }
  return result;
}

unint64_t sub_2519C95EC()
{
  unint64_t result = qword_269B949B0;
  if (!qword_269B949B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B949B0);
  }
  return result;
}

unint64_t sub_2519C963C()
{
  unint64_t result = qword_269B949B8;
  if (!qword_269B949B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B949B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_13(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 - 112);
  return MEMORY[0x270F9F390](a1, a2, v4, a1);
}

uint64_t OUTLINED_FUNCTION_6_12()
{
  return sub_2519CA440();
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  return 0;
}

void OUTLINED_FUNCTION_12_4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_13_5(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 192) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_2519CA4D0();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_2519CA480();
}

uint64_t sub_2519C97E0()
{
  return MEMORY[0x270EEFBB8]();
}

uint64_t sub_2519C97F0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2519C9800()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2519C9810()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_2519C9820()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2519C9830()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2519C9840()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2519C9850()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2519C9860()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_2519C9870()
{
  return MEMORY[0x270F74438]();
}

uint64_t sub_2519C9880()
{
  return MEMORY[0x270F74440]();
}

uint64_t sub_2519C9890()
{
  return MEMORY[0x270F74448]();
}

uint64_t sub_2519C98A0()
{
  return MEMORY[0x270F74450]();
}

uint64_t sub_2519C98B0()
{
  return MEMORY[0x270F74458]();
}

uint64_t sub_2519C98C0()
{
  return MEMORY[0x270F74E00]();
}

uint64_t sub_2519C98D0()
{
  return MEMORY[0x270F74E08]();
}

uint64_t sub_2519C98E0()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_2519C98F0()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_2519C9900()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_2519C9910()
{
  return MEMORY[0x270F756A8]();
}

uint64_t sub_2519C9920()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_2519C9930()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_2519C9940()
{
  return MEMORY[0x270F756C0]();
}

uint64_t sub_2519C9950()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_2519C9960()
{
  return MEMORY[0x270F729D8]();
}

uint64_t sub_2519C9970()
{
  return MEMORY[0x270F729E8]();
}

uint64_t sub_2519C9980()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_2519C9990()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_2519C99A0()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2519C99B0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2519C99C0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2519C99D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2519C99E0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_2519C99F0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2519C9A00()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2519C9A10()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2519C9A20()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2519C9A30()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2519C9A40()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2519C9A50()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2519C9A60()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2519C9A70()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_2519C9A80()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_2519C9A90()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_2519C9AA0()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_2519C9AB0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_2519C9AC0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_2519C9AD0()
{
  return MEMORY[0x270F758D0]();
}

uint64_t sub_2519C9AE0()
{
  return MEMORY[0x270F758D8]();
}

uint64_t sub_2519C9AF0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2519C9B00()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_2519C9B10()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2519C9B20()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2519C9B30()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_2519C9B40()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_2519C9B50()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2519C9B60()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2519C9B70()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2519C9B80()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2519C9B90()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_2519C9BA0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_2519C9BB0()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_2519C9BC0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_2519C9BD0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2519C9BE0()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_2519C9BF0()
{
  return MEMORY[0x270F015E0]();
}

uint64_t sub_2519C9C00()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_2519C9C10()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_2519C9C20()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_2519C9C30()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2519C9C40()
{
  return MEMORY[0x270F75928]();
}

uint64_t sub_2519C9C50()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2519C9C60()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2519C9C70()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2519C9C80()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2519C9C90()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_2519C9CA0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2519C9CB0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_2519C9CC0()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_2519C9CD0()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_2519C9CE0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2519C9CF0()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_2519C9D00()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2519C9D10()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2519C9D20()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2519C9D30()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_2519C9D40()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_2519C9D50()
{
  return MEMORY[0x270F759B8]();
}

uint64_t sub_2519C9D60()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_2519C9D70()
{
  return MEMORY[0x270F75A30]();
}

uint64_t sub_2519C9D80()
{
  return MEMORY[0x270F75A48]();
}

uint64_t sub_2519C9D90()
{
  return MEMORY[0x270F75A58]();
}

uint64_t sub_2519C9DA0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2519C9DB0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2519C9DC0()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_2519C9DD0()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_2519C9DE0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2519C9DF0()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_2519C9E00()
{
  return MEMORY[0x270F75AC0]();
}

uint64_t sub_2519C9E10()
{
  return MEMORY[0x270F04398]();
}

uint64_t sub_2519C9E20()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_2519C9E30()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2519C9E40()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2519C9E50()
{
  return MEMORY[0x270F04408]();
}

uint64_t sub_2519C9E60()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2519C9E70()
{
  return MEMORY[0x270F04438]();
}

uint64_t sub_2519C9E80()
{
  return MEMORY[0x270F04440]();
}

uint64_t sub_2519C9E90()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_2519C9EA0()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_2519C9EB0()
{
  return MEMORY[0x270F04468]();
}

uint64_t sub_2519C9EC0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2519C9ED0()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_2519C9EE0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2519C9EF0()
{
  return MEMORY[0x270F044A8]();
}

uint64_t sub_2519C9F00()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_2519C9F10()
{
  return MEMORY[0x270F044C8]();
}

uint64_t sub_2519C9F20()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_2519C9F30()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_2519C9F40()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2519C9F50()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2519C9F60()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_2519C9F70()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2519C9F80()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_2519C9F90()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2519C9FA0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2519C9FB0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2519C9FC0()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_2519C9FD0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2519C9FE0()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2519C9FF0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2519CA000()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_2519CA010()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_2519CA020()
{
  return MEMORY[0x270F75BF8]();
}

uint64_t sub_2519CA030()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_2519CA040()
{
  return MEMORY[0x270F75C40]();
}

uint64_t sub_2519CA050()
{
  return MEMORY[0x270F75C50]();
}

uint64_t sub_2519CA060()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_2519CA070()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_2519CA080()
{
  return MEMORY[0x270F75D90]();
}

uint64_t sub_2519CA090()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_2519CA0A0()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_2519CA0B0()
{
  return MEMORY[0x270F75E08]();
}

uint64_t sub_2519CA0C0()
{
  return MEMORY[0x270F75E18]();
}

uint64_t sub_2519CA0D0()
{
  return MEMORY[0x270F75E58]();
}

uint64_t sub_2519CA0E0()
{
  return MEMORY[0x270F75E70]();
}

uint64_t sub_2519CA0F0()
{
  return MEMORY[0x270F75E80]();
}

uint64_t sub_2519CA100()
{
  return MEMORY[0x270F75E88]();
}

uint64_t sub_2519CA110()
{
  return MEMORY[0x270F75EA0]();
}

uint64_t sub_2519CA120()
{
  return MEMORY[0x270F75FC8]();
}

uint64_t sub_2519CA130()
{
  return MEMORY[0x270F75FE0]();
}

uint64_t sub_2519CA140()
{
  return MEMORY[0x270F76198]();
}

uint64_t sub_2519CA150()
{
  return MEMORY[0x270F76248]();
}

uint64_t sub_2519CA160()
{
  return MEMORY[0x270F76270]();
}

uint64_t sub_2519CA170()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_2519CA180()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2519CA190()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2519CA1A0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2519CA1B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2519CA1C0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2519CA1D0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2519CA1E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2519CA1F0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_2519CA210()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2519CA230()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2519CA240()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2519CA250()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_2519CA260()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2519CA280()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2519CA290()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2519CA2A0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2519CA2B0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2519CA2C0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2519CA2D0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2519CA2E0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2519CA2F0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2519CA300()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2519CA310()
{
  return MEMORY[0x270F762D8]();
}

uint64_t sub_2519CA320()
{
  return MEMORY[0x270F762E0]();
}

uint64_t sub_2519CA330()
{
  return MEMORY[0x270F762E8]();
}

uint64_t sub_2519CA340()
{
  return MEMORY[0x270F762F8]();
}

uint64_t sub_2519CA350()
{
  return MEMORY[0x270F76300]();
}

uint64_t sub_2519CA360()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2519CA370()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2519CA380()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2519CA390()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2519CA3A0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2519CA3B0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2519CA3C0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2519CA3D0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2519CA3E0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2519CA3F0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2519CA400()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2519CA410()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2519CA420()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2519CA430()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2519CA440()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2519CA450()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2519CA460()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2519CA470()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2519CA480()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2519CA490()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2519CA4B0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2519CA4C0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2519CA4D0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2519CA4E0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2519CA4F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2519CA500()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2519CA510()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2519CA520()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2519CA530()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2519CA540()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2519CA550()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2519CA560()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}