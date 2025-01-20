ValueMetadata *type metadata accessor for DisappearSymbolEffect()
{
  return &type metadata for DisappearSymbolEffect;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions()
{
  return &type metadata for SymbolEffectOptions;
}

ValueMetadata *type metadata accessor for ReplaceSymbolEffect()
{
  return &type metadata for ReplaceSymbolEffect;
}

ValueMetadata *type metadata accessor for AppearSymbolEffect()
{
  return &type metadata for AppearSymbolEffect;
}

uint64_t symbols_fall_2024_os_versions()
{
  return 0x7E80000FFFFFFFFLL;
}

uint64_t SymbolEffectConfiguration.Effect.hash(into:)()
{
  uint64_t v1 = *v0;
  switch(*((unsigned char *)v0 + 10))
  {
    case 1:
    case 3:
    case 4:
    case 5:
    case 9:
      sub_246312AC0();
      if (v1 != 2) {
        sub_246312AD0();
      }
      goto LABEL_13;
    case 2:
      sub_246312AC0();
      return VariableColorSymbolEffect.hash(into:)();
    case 6:
    case 0xB:
      sub_246312AC0();
      if (v1 == 3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    case 7:
      return sub_246312AC0();
    case 8:
      __int16 v3 = *((_WORD *)v0 + 4);
      int v4 = ~*((unsigned char *)v0 + 8);
      sub_246312AC0();
      sub_246312AD0();
      if (v4) {
        WiggleSymbolEffect.WiggleStyle.hash(into:)();
      }
      if ((v3 & 0xFF00) != 0x200) {
        goto LABEL_16;
      }
      return sub_246312AD0();
    case 0xA:
      sub_246312AC0();
      if (v1 == 2)
      {
LABEL_13:
        sub_246312AD0();
      }
      else
      {
LABEL_19:
        sub_246312AD0();
        sub_246312AC0();
      }
      if ((v1 & 0xFF00) == 0x200) {
        return sub_246312AD0();
      }
      goto LABEL_16;
    default:
      sub_246312AC0();
      if (v1 != 2) {
LABEL_16:
      }
        sub_246312AD0();
      return sub_246312AD0();
  }
}

uint64_t static PulseSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 == 2)
  {
    if (v3 == 2) {
      return 1;
    }
  }
  else
  {
    BOOL v5 = (v2 & 1) == 0;
    if (v3 != 2 && ((v5 ^ v3) & 1) != 0) {
      return 1;
    }
  }
  return 0;
}

uint64_t static BounceSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24630FC78(a1, a2) & 1;
}

uint64_t static ScaleSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24630FC78(a1, a2) & 1;
}

uint64_t static AppearSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24630FC78(a1, a2) & 1;
}

uint64_t static DisappearSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24630FC78(a1, a2) & 1;
}

uint64_t static AutomaticSymbolEffect.== infix(_:_:)()
{
  return 1;
}

uint64_t static RotateSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24630FC78(a1, a2) & 1;
}

uint64_t static MagicReplaceSymbolEffect.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(a1, a2) & 1;
}

uint64_t SymbolEffectConfiguration.Effect.hashValue.getter()
{
  return sub_246312AF0();
}

uint64_t sub_24630B320()
{
  return sub_246312AF0();
}

uint64_t sub_24630B380()
{
  return sub_246312AF0();
}

void SymbolEffectConfiguration.effect.getter(uint64_t a1@<X8>)
{
  __int16 v2 = *(_WORD *)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 10);
  *(void *)a1 = *(void *)v1;
  *(_WORD *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 10) = v3;
}

uint64_t SymbolEffectConfiguration.effect.setter(uint64_t result)
{
  __int16 v2 = *(_WORD *)(result + 8);
  char v3 = *(unsigned char *)(result + 10);
  *(void *)uint64_t v1 = *(void *)result;
  *(_WORD *)(v1 + 8) = v2;
  *(unsigned char *)(v1 + 10) = v3;
  return result;
}

uint64_t (*SymbolEffectConfiguration.effect.modify())()
{
  return nullsub_1;
}

uint64_t SymbolEffectConfiguration.init(effect:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  __int16 v2 = *(_WORD *)(result + 8);
  char v3 = *(unsigned char *)(result + 10);
  *(void *)a2 = *(void *)result;
  *(_WORD *)(a2 + 8) = v2;
  *(unsigned char *)(a2 + 10) = v3;
  return result;
}

uint64_t SymbolEffectConfiguration.hash(into:)()
{
  return SymbolEffectConfiguration.Effect.hash(into:)();
}

uint64_t static SymbolEffectConfiguration.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  __int16 v2 = *((_WORD *)a1 + 4);
  char v3 = *((unsigned char *)a1 + 10);
  uint64_t v4 = *a2;
  __int16 v5 = *((_WORD *)a2 + 4);
  char v6 = *((unsigned char *)a2 + 10);
  uint64_t v11 = *a1;
  __int16 v12 = v2;
  char v13 = v3;
  uint64_t v8 = v4;
  __int16 v9 = v5;
  char v10 = v6;
  return _s7Symbols25SymbolEffectConfigurationV0C0O2eeoiySbAE_AEtFZ_0((uint64_t)&v11, (uint64_t)&v8) & 1;
}

uint64_t SymbolEffectConfiguration.hashValue.getter()
{
  return sub_246312AF0();
}

uint64_t sub_24630B558()
{
  return sub_246312AF0();
}

uint64_t sub_24630B5BC()
{
  return SymbolEffectConfiguration.Effect.hash(into:)();
}

uint64_t sub_24630B600()
{
  return sub_246312AF0();
}

uint64_t sub_24630B660(uint64_t *a1, uint64_t *a2)
{
  __int16 v2 = *((_WORD *)a1 + 4);
  char v3 = *((unsigned char *)a1 + 10);
  uint64_t v4 = *a2;
  __int16 v5 = *((_WORD *)a2 + 4);
  char v6 = *((unsigned char *)a2 + 10);
  uint64_t v11 = *a1;
  __int16 v12 = v2;
  char v13 = v3;
  uint64_t v8 = v4;
  __int16 v9 = v5;
  char v10 = v6;
  return _s7Symbols25SymbolEffectConfigurationV0C0O2eeoiySbAE_AEtFZ_0((uint64_t)&v11, (uint64_t)&v8) & 1;
}

unint64_t SymbolEffectConfiguration.rbAnimation.getter()
{
  unsigned __int8 v1 = 1;
  uint64_t v2 = 0;
  switch(*(unsigned char *)(v0 + 10))
  {
    case 1:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 3;
      break;
    case 2:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 1;
      break;
    case 3:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 4;
      break;
    case 4:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 5;
      break;
    case 5:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 9;
      break;
    case 6:
    case 0xB:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 6;
      break;
    case 7:
      return v2 | ((unint64_t)v1 << 32);
    case 8:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 10;
      break;
    case 9:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 11;
      break;
    case 0xA:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 12;
      break;
    default:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 2;
      break;
  }
  return v2 | ((unint64_t)v1 << 32);
}

unint64_t SymbolEffectConfiguration.rbOptions(with:)(uint64_t a1)
{
  double v2 = *(double *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  char v5 = *(unsigned char *)(a1 + 17);
  int v6 = *(unsigned __int8 *)(a1 + 18);
  double v7 = *(double *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  __int16 v9 = *(_WORD *)(v1 + 8);
  int v10 = *(unsigned __int8 *)(v1 + 10);
  *(void *)&long long v40 = *(void *)v1;
  WORD4(v40) = v9;
  BYTE10(v40) = v10;
  unint64_t v11 = SymbolEffectConfiguration.rbOptions.getter();
  __int16 v12 = (void *)*MEMORY[0x263F639C0];
  float v13 = v2;
  uint64_t v14 = MEMORY[0x263F8D5C8];
  *((void *)&v41 + 1) = MEMORY[0x263F8D5C8];
  *(float *)&long long v40 = v13;
  sub_24630FD6C(&v40, v39);
  id v15 = v12;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24630F43C(v39, v15, isUniquelyReferenced_nonNull_native);
  unint64_t v17 = v11;

  swift_bridgeObjectRelease();
  if (v5)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = (void *)*MEMORY[0x263F639A0];
    *((void *)&v41 + 1) = v14;
    if (v4) {
      LODWORD(v40) = 2139095040;
    }
    else {
      *(float *)&long long v40 = (float)v3;
    }
    sub_24630FD6C(&v40, v39);
    id v19 = v18;
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    sub_24630F43C(v39, v19, v20);

    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_3:
      if (!v6) {
        return v17;
      }
      goto LABEL_10;
    }
  }
  v21 = (void *)*MEMORY[0x263F639A8];
  float v22 = v7;
  *((void *)&v41 + 1) = v14;
  *(float *)&long long v40 = v22;
  sub_24630FD6C(&v40, v39);
  id v23 = v21;
  char v24 = swift_isUniquelyReferenced_nonNull_native();
  sub_24630F43C(v39, v23, v24);

  swift_bridgeObjectRelease();
  if (!v6) {
    return v17;
  }
LABEL_10:
  switch(v10)
  {
    case 1:
      v30 = (id *)MEMORY[0x263F63970];
      if (!*(void *)(v17 + 16))
      {
LABEL_20:
        long long v40 = 0u;
        long long v41 = 0u;
        goto LABEL_25;
      }
LABEL_17:
      id v31 = *v30;
      unint64_t v32 = sub_24630EEF4((uint64_t)v31);
      if (v33)
      {
        sub_24630FE20(*(void *)(v17 + 56) + 32 * v32, (uint64_t)&v40);
      }
      else
      {
        long long v40 = 0u;
        long long v41 = 0u;
      }

      if (*((void *)&v41 + 1))
      {
        if (swift_dynamicCast())
        {
          int v34 = LODWORD(v39[0]) | 0x10;
LABEL_27:
          id v35 = *v30;
          *((void *)&v41 + 1) = MEMORY[0x263F8E8F8];
LABEL_36:
          LODWORD(v40) = v34;
          sub_24630FD6C(&v40, v39);
          id v36 = v35;
          char v37 = swift_isUniquelyReferenced_nonNull_native();
          sub_24630F43C(v39, v36, v37);

          swift_bridgeObjectRelease();
          return v17;
        }
LABEL_26:
        int v34 = 16;
        goto LABEL_27;
      }
LABEL_25:
      sub_24630FD7C((uint64_t)&v40);
      goto LABEL_26;
    case 9:
      v30 = (id *)MEMORY[0x263F639B8];
      if (!*(void *)(v17 + 16)) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 8:
      v25 = (id *)MEMORY[0x263F639E0];
      uint64_t v26 = MEMORY[0x263F8E8F8];
      if (*(void *)(v17 + 16))
      {
        id v27 = (id)*MEMORY[0x263F639E0];
        unint64_t v28 = sub_24630EEF4((uint64_t)v27);
        if (v29)
        {
          sub_24630FE20(*(void *)(v17 + 56) + 32 * v28, (uint64_t)&v40);
        }
        else
        {
          long long v40 = 0u;
          long long v41 = 0u;
        }

        if (*((void *)&v41 + 1))
        {
          if (swift_dynamicCast())
          {
            int v34 = LODWORD(v39[0]) | 0x100;
LABEL_35:
            id v35 = *v25;
            *((void *)&v41 + 1) = v26;
            goto LABEL_36;
          }
LABEL_34:
          int v34 = 256;
          goto LABEL_35;
        }
      }
      else
      {
        long long v40 = 0u;
        long long v41 = 0u;
      }
      sub_24630FD7C((uint64_t)&v40);
      goto LABEL_34;
  }
  return v17;
}

unint64_t SymbolEffectConfiguration.rbOptions.getter()
{
  double v1 = *(double *)v0;
  __int16 v2 = *(_WORD *)(v0 + 8);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 10);
  unint64_t v4 = sub_24630C2AC(MEMORY[0x263F8EE78]);
  switch(v3)
  {
    case 1:
      if ((LOWORD(v1) & 0xFF00) != 0x200)
      {
        int v6 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = BYTE1(v1) & 1;
        sub_24630FD6C(v50, v49);
        id v7 = v6;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v7, isUniquelyReferenced_nonNull_native);

        swift_bridgeObjectRelease();
      }
      if (LOBYTE(v1)) {
        int v9 = 1;
      }
      else {
        int v9 = 2;
      }
      BOOL v10 = LOBYTE(v1) == 2;
      unint64_t v11 = (void **)MEMORY[0x263F63970];
      goto LABEL_47;
    case 2:
      if (LOBYTE(v1) == 2) {
        int v12 = 0;
      }
      else {
        int v12 = 8 * (LOBYTE(v1) & 1);
      }
      unsigned int v13 = v12 & 0xFFFFFFFE | (LODWORD(v1) >> 8) & 1;
      if ((*(void *)&v1 & 0xFF0000) == 0x20000) {
        unsigned int v14 = 0;
      }
      else {
        unsigned int v14 = (LODWORD(v1) >> 15) & 2;
      }
      int v15 = v13 | v14;
      char v5 = (void *)*MEMORY[0x263F639D0];
      goto LABEL_74;
    case 3:
      if ((LOWORD(v1) & 0xFF00) == 0x200) {
        return v4;
      }
      char v5 = (void *)*MEMORY[0x263F63980];
      uint64_t v51 = MEMORY[0x263F8D4F8];
      LOBYTE(v50[0]) = BYTE1(v1) & 1;
      goto LABEL_75;
    case 4:
      if ((LOWORD(v1) & 0xFF00) != 0x200)
      {
        v16 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = BYTE1(v1) & 1;
        sub_24630FD6C(v50, v49);
        id v17 = v16;
        char v18 = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v17, v18);

        swift_bridgeObjectRelease();
      }
      uint64_t v19 = LOBYTE(v1);
      if (LOBYTE(v1)) {
        int v9 = 2;
      }
      else {
        int v9 = 3;
      }
      goto LABEL_29;
    case 5:
      if ((LOWORD(v1) & 0xFF00) != 0x200)
      {
        char v20 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = BYTE1(v1) & 1;
        sub_24630FD6C(v50, v49);
        id v21 = v20;
        char v22 = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v21, v22);

        swift_bridgeObjectRelease();
      }
      uint64_t v19 = LOBYTE(v1);
      if (LOBYTE(v1)) {
        int v9 = 3;
      }
      else {
        int v9 = 2;
      }
LABEL_29:
      BOOL v10 = v19 == 2;
      unint64_t v11 = (void **)MEMORY[0x263F63968];
      goto LABEL_47;
    case 6:
      if ((LOWORD(v1) & 0xFF00) != 0x200)
      {
        id v23 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = BYTE1(v1) & 1;
        sub_24630FD6C(v50, v49);
        id v24 = v23;
        char v25 = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v24, v25);

        swift_bridgeObjectRelease();
      }
      int v15 = 98;
      switch(LOBYTE(v1))
      {
        case 1:
          int v15 = 99;
          break;
        case 2:
          int v15 = 100;
          break;
        case 3:
          symbols_fall_2024_os_versions();
          if (dyld_program_sdk_at_least()) {
            int v15 = 0;
          }
          else {
            int v15 = 96;
          }
          break;
        default:
          goto LABEL_61;
      }
      goto LABEL_61;
    case 7:
      return v4;
    case 8:
      int v26 = v2;
      if ((v2 & 0xFF00) != 0x200)
      {
        id v27 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = HIBYTE(v2) & 1;
        sub_24630FD6C(v50, v49);
        id v28 = v27;
        char v29 = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v28, v29);

        swift_bridgeObjectRelease();
      }
      if (v26 > 1) {
        goto LABEL_71;
      }
      if (v26)
      {
        objc_msgSend(self, sel__normalizeAngle_, v1);
        if (v41 == 0.0)
        {
          int v15 = 17;
        }
        else if (v41 == 90.0)
        {
          int v15 = 18;
        }
        else if (v41 == -90.0)
        {
          int v15 = 34;
        }
        else if (v41 == 180.0)
        {
          int v15 = 33;
        }
        else
        {
          v42 = (void *)*MEMORY[0x263F639D8];
          float v43 = v41 * 0.0174532925;
          uint64_t v51 = MEMORY[0x263F8D5C8];
          v50[0] = v43;
          sub_24630FD6C(v50, v49);
          id v44 = v42;
          char v45 = swift_isUniquelyReferenced_nonNull_native();
          sub_24630F43C(v49, v44, v45);

          swift_bridgeObjectRelease();
LABEL_71:
          int v15 = 0;
        }
      }
      else if (LOBYTE(v1))
      {
        int v15 = 19;
      }
      else
      {
        int v15 = 35;
      }
      long long v40 = (void **)MEMORY[0x263F639E0];
      goto LABEL_73;
    case 9:
      if ((LOWORD(v1) & 0xFF00) != 0x200)
      {
        v30 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = BYTE1(v1) & 1;
        sub_24630FD6C(v50, v49);
        id v31 = v30;
        char v32 = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v31, v32);

        swift_bridgeObjectRelease();
      }
      if (LOBYTE(v1)) {
        int v9 = 1;
      }
      else {
        int v9 = 2;
      }
      BOOL v10 = LOBYTE(v1) == 2;
      unint64_t v11 = (void **)MEMORY[0x263F639B8];
LABEL_47:
      char v5 = *v11;
      uint64_t v33 = MEMORY[0x263F8E8F8];
      if (v10) {
        int v9 = 0;
      }
      goto LABEL_53;
    case 10:
      if ((LOWORD(v1) & 0xFF00) != 0x200)
      {
        int v34 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = BYTE1(v1) & 1;
        sub_24630FD6C(v50, v49);
        id v35 = v34;
        char v36 = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v35, v36);

        swift_bridgeObjectRelease();
      }
      int v9 = LOBYTE(v1) & 1;
      char v5 = (void *)*MEMORY[0x263F63978];
      uint64_t v33 = MEMORY[0x263F8E8F8];
LABEL_53:
      uint64_t v51 = v33;
      LODWORD(v50[0]) = v9;
      goto LABEL_75;
    case 11:
      if ((LOWORD(v1) & 0xFF00) != 0x200)
      {
        char v37 = (void *)*MEMORY[0x263F63980];
        uint64_t v51 = MEMORY[0x263F8D4F8];
        LOBYTE(v50[0]) = BYTE1(v1) & 1;
        sub_24630FD6C(v50, v49);
        id v38 = v37;
        char v39 = swift_isUniquelyReferenced_nonNull_native();
        sub_24630F43C(v49, v38, v39);

        swift_bridgeObjectRelease();
      }
      int v15 = dword_246314710[SLOBYTE(v1)];
LABEL_61:
      long long v40 = (void **)MEMORY[0x263F639B0];
LABEL_73:
      char v5 = *v40;
LABEL_74:
      uint64_t v51 = MEMORY[0x263F8E8F8];
      LODWORD(v50[0]) = v15;
      goto LABEL_75;
    default:
      if (LOBYTE(v1) == 2) {
        return v4;
      }
      char v5 = (void *)*MEMORY[0x263F63980];
      uint64_t v51 = MEMORY[0x263F8D4F8];
      LOBYTE(v50[0]) = LOBYTE(v1) & 1;
LABEL_75:
      sub_24630FD6C(v50, v49);
      id v46 = v5;
      char v47 = swift_isUniquelyReferenced_nonNull_native();
      sub_24630F43C(v49, v46, v47);

      swift_bridgeObjectRelease();
      return v4;
  }
}

unint64_t sub_24630C2AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F739B8);
  uint64_t v2 = sub_246312A70();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_246311988(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_24630EEF4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_24630FD6C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Symbols::PulseSymbolEffect __swiftcall PulseSymbolEffect.init()()
{
  unsigned char *v0 = 2;
  return result;
}

uint64_t PulseSymbolEffect.isLayered.getter()
{
  return *v0;
}

uint64_t PulseSymbolEffect.isLayered.setter(uint64_t result)
{
  *double v1 = result;
  return result;
}

uint64_t (*PulseSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void PulseSymbolEffect.byLayer.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void PulseSymbolEffect.wholeSymbol.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void PulseSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 0;
}

uint64_t PulseSymbolEffect.hash(into:)()
{
  if (*v0 != 2) {
    sub_246312AD0();
  }
  return sub_246312AD0();
}

uint64_t PulseSymbolEffect.hashValue.getter()
{
  int v1 = *v0;
  sub_246312AB0();
  if (v1 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  return sub_246312AF0();
}

void sub_24630C4E0(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 0;
}

uint64_t sub_24630C4F4()
{
  int v1 = *v0;
  sub_246312AB0();
  if (v1 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  return sub_246312AF0();
}

uint64_t sub_24630C55C()
{
  if (*v0 != 2) {
    sub_246312AD0();
  }
  return sub_246312AD0();
}

uint64_t sub_24630C5A8()
{
  int v1 = *v0;
  sub_246312AB0();
  if (v1 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  return sub_246312AF0();
}

BOOL sub_24630C60C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = *a2;
  if (v2 != 2)
  {
    BOOL v4 = (v2 & 1) == 0;
    return v3 != 2 && ((v4 ^ v3) & 1) != 0;
  }
  return v3 == 2;
}

uint64_t BounceSymbolEffect.isUp.getter()
{
  return *v0;
}

uint64_t (*BounceSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t (*BounceSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t BounceSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(1, a1);
}

void sub_24630C6A8(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 1;
}

uint64_t sub_24630C6CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24630FC78(a1, a2) & 1;
}

Symbols::VariableColorSymbolEffect __swiftcall VariableColorSymbolEffect.init()()
{
  *(_WORD *)uint64_t v0 = 514;
  *(unsigned char *)(v0 + 2) = 2;
  return result;
}

uint64_t VariableColorSymbolEffect.isReversing.getter()
{
  return *v0;
}

uint64_t VariableColorSymbolEffect.isReversing.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*VariableColorSymbolEffect.isReversing.modify())()
{
  return nullsub_1;
}

uint64_t VariableColorSymbolEffect.isIterative.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t VariableColorSymbolEffect.isIterative.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*VariableColorSymbolEffect.isIterative.modify())()
{
  return nullsub_1;
}

uint64_t VariableColorSymbolEffect.hasReveal.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t VariableColorSymbolEffect.hasReveal.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*VariableColorSymbolEffect.hasReveal.modify())()
{
  return nullsub_1;
}

void VariableColorSymbolEffect.reversing.getter(uint64_t a1@<X8>)
{
  __int16 v2 = *(_WORD *)(v1 + 1);
  *(unsigned char *)a1 = 1;
  *(_WORD *)(a1 + 1) = v2;
}

void VariableColorSymbolEffect.nonReversing.getter(uint64_t a1@<X8>)
{
  __int16 v2 = *(_WORD *)(v1 + 1);
  *(unsigned char *)a1 = 0;
  *(_WORD *)(a1 + 1) = v2;
}

void VariableColorSymbolEffect.cumulative.getter(uint64_t a1@<X8>)
{
  unsigned __int8 v2 = v1[2];
  *(_WORD *)a1 = *v1;
  *(unsigned char *)(a1 + 2) = v2;
}

void VariableColorSymbolEffect.iterative.getter(unsigned char *a1@<X8>)
{
  char v2 = v1[2];
  *a1 = *v1;
  a1[1] = 1;
  a1[2] = v2;
}

void VariableColorSymbolEffect.hideInactiveLayers.getter(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = *v1;
  *(unsigned char *)(a1 + 2) = 1;
}

void VariableColorSymbolEffect.dimInactiveLayers.getter(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = *v1;
  *(unsigned char *)(a1 + 2) = 0;
}

void VariableColorSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 2) << 16);
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 2;
}

uint64_t VariableColorSymbolEffect.hash(into:)()
{
  int v1 = v0[1];
  int v2 = v0[2];
  if (*v0 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  if (v1 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  if (v2 != 2) {
    sub_246312AD0();
  }
  return sub_246312AD0();
}

uint64_t VariableColorSymbolEffect.hashValue.getter()
{
  return sub_246312AF0();
}

void sub_24630C920(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 2) << 16);
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 2;
}

uint64_t sub_24630C940()
{
  return sub_246312AF0();
}

uint64_t sub_24630C998()
{
  return sub_246312AF0();
}

Symbols::ScaleSymbolEffect __swiftcall ScaleSymbolEffect.init()()
{
  _WORD *v0 = 514;
  return result;
}

uint64_t ScaleSymbolEffect.isUp.getter()
{
  return *v0;
}

uint64_t ScaleSymbolEffect.isUp.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*ScaleSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t ScaleSymbolEffect.isLayered.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ScaleSymbolEffect.isLayered.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*ScaleSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void ScaleSymbolEffect.up.getter(unsigned char *a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 1);
  *a1 = 1;
  a1[1] = v2;
}

void ScaleSymbolEffect.down.getter(unsigned char *a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 1);
  *a1 = 0;
  a1[1] = v2;
}

void ScaleSymbolEffect.byLayer.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 1;
}

void ScaleSymbolEffect.wholeSymbol.getter(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ScaleSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(3, a1);
}

void sub_24630CAB0(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 3;
}

uint64_t AppearSymbolEffect.isUp.getter()
{
  return *v0;
}

uint64_t (*AppearSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t (*AppearSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t AppearSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(4, a1);
}

void sub_24630CB20(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 4;
}

uint64_t DisappearSymbolEffect.isUp.getter()
{
  return *v0;
}

uint64_t (*DisappearSymbolEffect.isUp.modify())()
{
  return nullsub_1;
}

uint64_t (*DisappearSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t DisappearSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(5, a1);
}

void sub_24630CB90(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 5;
}

Symbols::ReplaceSymbolEffect __swiftcall ReplaceSymbolEffect.init()()
{
  _WORD *v0 = 515;
  return result;
}

BOOL static ReplaceSymbolEffect.ReplaceStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ReplaceSymbolEffect.ReplaceStyle.hash(into:)()
{
  return sub_246312AC0();
}

uint64_t ReplaceSymbolEffect.ReplaceStyle.hashValue.getter()
{
  return sub_246312AF0();
}

BOOL sub_24630CC3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24630CC50()
{
  return sub_246312AF0();
}

uint64_t sub_24630CC98()
{
  return sub_246312AC0();
}

uint64_t sub_24630CCC4()
{
  return sub_246312AF0();
}

uint64_t (*ReplaceSymbolEffect.style.modify())()
{
  return nullsub_1;
}

uint64_t (*ReplaceSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void ReplaceSymbolEffect.offUp.getter(unsigned char *a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 1);
  *a1 = 2;
  a1[1] = v2;
}

uint64_t ReplaceSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(6, a1);
}

uint64_t ReplaceSymbolEffect.hash(into:)()
{
  int v1 = v0[1];
  if (*v0 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v1 == 2) {
      return sub_246312AD0();
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v1 != 2) {
LABEL_3:
  }
    sub_246312AD0();
  return sub_246312AD0();
}

uint64_t ReplaceSymbolEffect.hashValue.getter()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v2 == 2) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v2 != 2) {
LABEL_3:
  }
    sub_246312AD0();
LABEL_5:
  sub_246312AD0();
  return sub_246312AF0();
}

void sub_24630CE88(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 6;
}

uint64_t sub_24630CEA4()
{
  int v1 = v0[1];
  if (*v0 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v1 == 2) {
      return sub_246312AD0();
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v1 != 2) {
LABEL_3:
  }
    sub_246312AD0();
  return sub_246312AD0();
}

uint64_t sub_24630CF24()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v2 == 2) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v2 != 2) {
LABEL_3:
  }
    sub_246312AD0();
LABEL_5:
  sub_246312AD0();
  return sub_246312AF0();
}

void AutomaticSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 7;
}

uint64_t AutomaticSymbolEffect.hashValue.getter()
{
  return sub_246312AF0();
}

void sub_24630D01C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 7;
}

uint64_t sub_24630D030()
{
  return sub_246312AF0();
}

uint64_t sub_24630D068()
{
  return sub_246312AF0();
}

uint64_t sub_24630D09C()
{
  return 1;
}

void WiggleSymbolEffect.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 767;
}

uint64_t WiggleSymbolEffect.WiggleStyle.hash(into:)()
{
  if (*(unsigned char *)(v0 + 8) && *(unsigned char *)(v0 + 8) == 1)
  {
    sub_246312AC0();
    return sub_246312AE0();
  }
  else
  {
    sub_246312AC0();
    return sub_246312AD0();
  }
}

uint64_t WiggleSymbolEffect.WiggleStyle.hashValue.getter()
{
  return sub_246312AF0();
}

uint64_t sub_24630D174()
{
  return sub_246312AF0();
}

uint64_t sub_24630D1CC()
{
  return sub_246312AF0();
}

void WiggleSymbolEffect.style.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t WiggleSymbolEffect.style.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = v2;
  return result;
}

uint64_t (*WiggleSymbolEffect.style.modify())()
{
  return nullsub_1;
}

uint64_t WiggleSymbolEffect.isLayered.getter()
{
  return *(unsigned __int8 *)(v0 + 9);
}

uint64_t WiggleSymbolEffect.isLayered.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 9) = result;
  return result;
}

uint64_t (*WiggleSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

void WiggleSymbolEffect.clockwise.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 1;
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.counterClockwise.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.left.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 0x4066800000000000;
  *(unsigned char *)(a1 + 8) = 1;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.right.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.up.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 0xC056800000000000;
  *(unsigned char *)(a1 + 8) = 1;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.down.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 0x4056800000000000;
  *(unsigned char *)(a1 + 8) = 1;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.forward.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 1;
  *(unsigned char *)(a1 + 8) = 2;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.backward.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 9);
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 2;
  *(unsigned char *)(a1 + 9) = v2;
}

void WiggleSymbolEffect.custom(angle:)(uint64_t a1@<X8>, double a2@<D0>)
{
  char v3 = *(unsigned char *)(v2 + 9);
  *(double *)a1 = a2;
  *(unsigned char *)(a1 + 8) = 1;
  *(unsigned char *)(a1 + 9) = v3;
}

void WiggleSymbolEffect.byLayer.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 9) = 1;
}

void WiggleSymbolEffect.wholeSymbol.getter(uint64_t a1@<X8>)
{
  unsigned __int8 v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(_WORD *)(a1 + 8) = v2;
}

void WiggleSymbolEffect.configuration.getter(uint64_t a1@<X8>)
{
  __int16 v2 = *(_WORD *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(_WORD *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 10) = 8;
}

uint64_t WiggleSymbolEffect.hash(into:)()
{
  int v1 = *(unsigned __int8 *)(v0 + 9);
  if (*(unsigned __int8 *)(v0 + 8) == 255)
  {
    sub_246312AD0();
    if (v1 == 2) {
      return sub_246312AD0();
    }
  }
  else
  {
    sub_246312AD0();
    WiggleSymbolEffect.WiggleStyle.hash(into:)();
    if (v1 == 2) {
      return sub_246312AD0();
    }
  }
  sub_246312AD0();
  return sub_246312AD0();
}

uint64_t WiggleSymbolEffect.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  int v2 = *(unsigned __int8 *)(v0 + 9);
  sub_246312AB0();
  if (v1 == 255)
  {
    sub_246312AD0();
    if (v2 == 2) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_246312AD0();
    WiggleSymbolEffect.WiggleStyle.hash(into:)();
    if (v2 == 2) {
      goto LABEL_6;
    }
  }
  sub_246312AD0();
LABEL_6:
  sub_246312AD0();
  return sub_246312AF0();
}

void sub_24630D530(uint64_t a1@<X8>)
{
  __int16 v2 = *(_WORD *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(_WORD *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 10) = 8;
}

uint64_t sub_24630D554()
{
  int v1 = *(unsigned __int8 *)(v0 + 8);
  int v2 = *(unsigned __int8 *)(v0 + 9);
  sub_246312AB0();
  if (v1 == 255)
  {
    sub_246312AD0();
    if (v2 == 2) {
      goto LABEL_6;
    }
  }
  else
  {
    sub_246312AD0();
    WiggleSymbolEffect.WiggleStyle.hash(into:)();
    if (v2 == 2) {
      goto LABEL_6;
    }
  }
  sub_246312AD0();
LABEL_6:
  sub_246312AD0();
  return sub_246312AF0();
}

uint64_t RotateSymbolEffect.isClockwise.getter()
{
  return *v0;
}

uint64_t (*RotateSymbolEffect.isClockwise.modify())()
{
  return nullsub_1;
}

uint64_t (*RotateSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t RotateSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(9, a1);
}

uint64_t _s7Symbols18BounceSymbolEffectV4hash4intoys6HasherVz_tF_0()
{
  int v1 = v0[1];
  if (*v0 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  if (v1 != 2) {
    sub_246312AD0();
  }
  return sub_246312AD0();
}

uint64_t _s7Symbols18BounceSymbolEffectV9hashValueSivg_0()
{
  int v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  if (v2 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  return sub_246312AF0();
}

void sub_24630D77C(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 9;
}

uint64_t sub_24630D794()
{
  int v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  if (v2 != 2) {
    sub_246312AD0();
  }
  sub_246312AD0();
  return sub_246312AF0();
}

BOOL static BreatheSymbolEffect.BreatheStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t BreatheSymbolEffect.BreatheStyle.hash(into:)()
{
  return sub_246312AC0();
}

uint64_t BreatheSymbolEffect.BreatheStyle.hashValue.getter()
{
  return sub_246312AF0();
}

BOOL sub_24630D8BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void BreatheSymbolEffect.style.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *BreatheSymbolEffect.style.setter(unsigned char *result)
{
  *int v1 = *result;
  return result;
}

uint64_t (*BreatheSymbolEffect.style.modify())()
{
  return nullsub_1;
}

uint64_t (*BreatheSymbolEffect.isLayered.modify())()
{
  return nullsub_1;
}

uint64_t BreatheSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(10, a1);
}

uint64_t BreatheSymbolEffect.hash(into:)()
{
  int v1 = v0[1];
  if (*v0 != 2)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v1 == 2) {
      return sub_246312AD0();
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v1 != 2) {
LABEL_3:
  }
    sub_246312AD0();
  return sub_246312AD0();
}

uint64_t BreatheSymbolEffect.hashValue.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 2)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v2 == 2) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v2 != 2) {
LABEL_3:
  }
    sub_246312AD0();
LABEL_5:
  sub_246312AD0();
  return sub_246312AF0();
}

void sub_24630DA64(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 10;
}

uint64_t sub_24630DA84()
{
  int v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 2)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v2 == 2) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v2 != 2) {
LABEL_3:
  }
    sub_246312AD0();
LABEL_5:
  sub_246312AD0();
  return sub_246312AF0();
}

uint64_t (*MagicReplaceSymbolEffect.fallback.modify())()
{
  return nullsub_1;
}

void static MagicReplaceSymbolEffect.replace.getter(_WORD *a1@<X8>)
{
  *a1 = 515;
}

uint64_t MagicReplaceSymbolEffect.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(11, a1);
}

uint64_t MagicReplaceSymbolEffect.hash(into:)()
{
  int v1 = v0[1];
  if (*v0 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v1 == 2) {
      return sub_246312AD0();
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v1 != 2) {
LABEL_3:
  }
    sub_246312AD0();
  return sub_246312AD0();
}

uint64_t MagicReplaceSymbolEffect.hashValue.getter()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v2 == 2) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v2 != 2) {
LABEL_3:
  }
    sub_246312AD0();
LABEL_5:
  sub_246312AD0();
  return sub_246312AF0();
}

uint64_t sub_24630DC94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(a1, a2) & 1;
}

void ReplaceSymbolEffect.MagicReplace.fallback.getter(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

_WORD *sub_24630DCBC@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_WORD *sub_24630DCC8(_WORD *result, _WORD *a2)
{
  *a2 = *result;
  return result;
}

_WORD *ReplaceSymbolEffect.MagicReplace.fallback.setter(_WORD *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*ReplaceSymbolEffect.MagicReplace.fallback.modify(uint64_t a1))(uint64_t result)
{
  *(void *)a1 = v1;
  *(_WORD *)(a1 + 8) = *v1;
  return sub_24630DD0C;
}

uint64_t sub_24630DD0C(uint64_t result)
{
  **(_WORD **)Symbols::ReplaceSymbolEffect result = *(_WORD *)(result + 8);
  return result;
}

uint64_t ReplaceSymbolEffect.MagicReplace.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24630DD24(11, a1);
}

uint64_t sub_24630DD24@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *v2;
  *(_WORD *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 10) = result;
  return result;
}

uint64_t ReplaceSymbolEffect.MagicReplace.hash(into:)()
{
  int v1 = v0[1];
  if (*v0 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v1 == 2) {
      return sub_246312AD0();
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v1 != 2) {
LABEL_3:
  }
    sub_246312AD0();
  return sub_246312AD0();
}

uint64_t static ReplaceSymbolEffect.MagicReplace.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(a1, a2) & 1;
}

uint64_t ReplaceSymbolEffect.MagicReplace.hashValue.getter()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  sub_246312AB0();
  if (v1 != 3)
  {
    sub_246312AD0();
    sub_246312AC0();
    if (v2 == 2) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_246312AD0();
  if (v2 != 2) {
LABEL_3:
  }
    sub_246312AD0();
LABEL_5:
  sub_246312AD0();
  return sub_246312AF0();
}

void sub_24630DE78(uint64_t a1@<X8>)
{
  *(void *)a1 = *v1;
  *(_WORD *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 10) = 11;
}

Symbols::MagicReplaceSymbolEffect __swiftcall ReplaceSymbolEffect.magic(fallback:)(Symbols::MagicReplaceSymbolEffect fallback)
{
  *uint64_t v1 = **(_WORD **)&fallback.fallback.style.value;
  return fallback;
}

Symbols::ReplaceSymbolEffect::MagicReplace __swiftcall ReplaceSymbolEffect.magic(fallback:)(Symbols::ReplaceSymbolEffect::MagicReplace fallback)
{
  *uint64_t v1 = **(_WORD **)&fallback._backing.fallback.style.value;
  return fallback;
}

void static ReplaceSymbolEffect.downUp.getter(_WORD *a1@<X8>)
{
  *a1 = 512;
}

void static ReplaceSymbolEffect.upUp.getter(_WORD *a1@<X8>)
{
  *a1 = 513;
}

void static ReplaceSymbolEffect.offUp.getter(_WORD *a1@<X8>)
{
  *a1 = 514;
}

id sub_24630DED4(uint64_t *a1)
{
  id v1 = 0;
  uint64_t v2 = *a1;
  switch(*((unsigned char *)a1 + 10))
  {
    case 0:
      int v3 = *a1;
      id v4 = objc_msgSend(self, sel_effect);
      id v1 = v4;
      BOOL v5 = (v2 & 1) == 0;
      goto LABEL_15;
    case 1:
      id v1 = BounceSymbolEffect.objcRepresentation.getter();
      break;
    case 2:
      id v1 = VariableColorSymbolEffect.objcRepresentation.getter();
      break;
    case 3:
      id v1 = ScaleSymbolEffect.objcRepresentation.getter();
      break;
    case 4:
      id v1 = AppearSymbolEffect.objcRepresentation.getter();
      break;
    case 5:
      id v1 = DisappearSymbolEffect.objcRepresentation.getter();
      break;
    case 8:
      id v1 = WiggleSymbolEffect.objcRepresentation.getter();
      break;
    case 9:
      id v1 = RotateSymbolEffect.objcRepresentation.getter();
      break;
    case 0xA:
      int v3 = BYTE1(v2);
      if (*a1 == 2)
      {
        uint64_t v6 = self;
        uint64_t v7 = &selRef_effect;
      }
      else
      {
        uint64_t v6 = self;
        uint64_t v7 = &selRef_breatheByScalingEffect;
        if ((v2 & 1) == 0) {
          uint64_t v7 = &selRef_breatheByDimmingEffect;
        }
      }
      id v4 = [v6 *v7];
      id v1 = v4;
      BOOL v5 = (v2 & 0x100) == 0;
LABEL_15:
      uint64_t v8 = 1;
      if (v5) {
        uint64_t v8 = 2;
      }
      if (v3 == 2) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v8;
      }
      objc_msgSend(v4, sel_set_layerBehavior_, v9);
      break;
    default:
      return v1;
  }
  return v1;
}

id BounceSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  if (v1 == 2)
  {
    int v3 = self;
    id v4 = &selRef_effect;
  }
  else
  {
    int v3 = self;
    id v4 = &selRef_bounceUpEffect;
    if ((v1 & 1) == 0) {
      id v4 = &selRef_bounceDownEffect;
    }
  }
  id v5 = [v3 *v4];
  id v6 = v5;
  uint64_t v7 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v7 = 2;
  }
  if (v2 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id PulseSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  id v2 = objc_msgSend(self, sel_effect);
  id v3 = v2;
  uint64_t v4 = 1;
  if ((v1 & 1) == 0) {
    uint64_t v4 = 2;
  }
  if (v1 == 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  objc_msgSend(v2, sel_set_layerBehavior_, v5);
  return v3;
}

id ScaleSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  if (v1 == 2)
  {
    id v3 = self;
    uint64_t v4 = &selRef_effect;
  }
  else
  {
    id v3 = self;
    uint64_t v4 = &selRef_scaleUpEffect;
    if ((v1 & 1) == 0) {
      uint64_t v4 = &selRef_scaleDownEffect;
    }
  }
  id v5 = [v3 *v4];
  id v6 = v5;
  uint64_t v7 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v7 = 2;
  }
  if (v2 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

void *VariableColorSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  int v3 = v0[2];
  id v4 = objc_msgSend(self, sel_effect);
  id v5 = v4;
  if (v2 == 2)
  {
    if (v1 == 2) {
      goto LABEL_3;
    }
  }
  else
  {
    if (v2) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    objc_msgSend(v4, sel_set_fillStyle_, v8);
    if (v1 == 2)
    {
LABEL_3:
      if (v3 == 2) {
        return v5;
      }
      goto LABEL_4;
    }
  }
  if (v1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  objc_msgSend(v5, sel_set_playbackStyle_, v9);
  if (v3 != 2)
  {
LABEL_4:
    if (v3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    objc_msgSend(v5, sel_set_inactiveStyle_, v6);
  }
  return v5;
}

id AppearSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  if (v1 == 2)
  {
    int v3 = self;
    id v4 = &selRef_effect;
  }
  else
  {
    int v3 = self;
    id v4 = &selRef_appearUpEffect;
    if ((v1 & 1) == 0) {
      id v4 = &selRef_appearDownEffect;
    }
  }
  id v5 = [v3 *v4];
  id v6 = v5;
  uint64_t v7 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v7 = 2;
  }
  if (v2 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id DisappearSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  if (v1 == 2)
  {
    int v3 = self;
    id v4 = &selRef_effect;
  }
  else
  {
    int v3 = self;
    id v4 = &selRef_disappearUpEffect;
    if ((v1 & 1) == 0) {
      id v4 = &selRef_disappearDownEffect;
    }
  }
  id v5 = [v3 *v4];
  id v6 = v5;
  uint64_t v7 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v7 = 2;
  }
  if (v2 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id WiggleSymbolEffect.objcRepresentation.getter()
{
  double v1 = *(double *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  int v3 = *(unsigned __int8 *)(v0 + 9);
  if (v2 > 1)
  {
    if (v2 == 2)
    {
      id v6 = self;
      if (LOBYTE(v1)) {
        id v5 = objc_msgSend(v6, sel_wiggleForwardEffect);
      }
      else {
        id v5 = objc_msgSend(v6, sel_wiggleBackwardEffect);
      }
    }
    else
    {
      id v5 = objc_msgSend(self, sel_effect);
    }
  }
  else
  {
    if (v2)
    {
      double v7 = v1;
      id v8 = objc_msgSend(self, sel_effect);
      objc_msgSend(v8, sel_set_style_, 3);
      objc_msgSend(v8, sel_set_angle_, v7);

      goto LABEL_13;
    }
    id v4 = self;
    if (LOBYTE(v1)) {
      id v5 = objc_msgSend(v4, sel_wiggleClockwiseEffect);
    }
    else {
      id v5 = objc_msgSend(v4, sel_wiggleCounterClockwiseEffect);
    }
  }
  id v8 = v5;
LABEL_13:
  uint64_t v9 = 1;
  if ((v3 & 1) == 0) {
    uint64_t v9 = 2;
  }
  if (v3 == 2) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v9;
  }
  objc_msgSend(v8, sel_set_layerBehavior_, v10);
  return v8;
}

id RotateSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  if (v1 == 2)
  {
    int v3 = self;
    id v4 = &selRef_effect;
  }
  else
  {
    int v3 = self;
    id v4 = &selRef_rotateClockwiseEffect;
    if ((v1 & 1) == 0) {
      id v4 = &selRef_rotateCounterClockwiseEffect;
    }
  }
  id v5 = [v3 *v4];
  id v6 = v5;
  uint64_t v7 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v7 = 2;
  }
  if (v2 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id BreatheSymbolEffect.objcRepresentation.getter()
{
  int v1 = *v0;
  int v2 = v0[1];
  if (v1 == 2)
  {
    int v3 = self;
    id v4 = &selRef_effect;
  }
  else
  {
    int v3 = self;
    id v4 = &selRef_breatheByScalingEffect;
    if ((v1 & 1) == 0) {
      id v4 = &selRef_breatheByDimmingEffect;
    }
  }
  id v5 = [v3 *v4];
  id v6 = v5;
  uint64_t v7 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v7 = 2;
  }
  if (v2 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v5, sel_set_layerBehavior_, v8);
  return v6;
}

id sub_24630E700(unint64_t *a1)
{
  unint64_t v1 = *a1;
  int v2 = *((unsigned __int8 *)a1 + 10);
  switch(v2)
  {
    case 11:
      unint64_t v7 = v1 >> 8;
      int v8 = BYTE1(v1);
      uint64_t v9 = self;
      id v10 = objc_msgSend(v9, *off_2651D9D38[(char)v1]);
      BOOL v11 = v10;
      uint64_t v12 = 1;
      if ((v7 & 1) == 0) {
        uint64_t v12 = 2;
      }
      if (v8 == 2) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12;
      }
      objc_msgSend(v10, sel_set_layerBehavior_, v13);
      id v4 = objc_msgSend(v9, sel_magicTransitionWithFallback_, v11);

      break;
    case 7:
      return objc_msgSend(self, sel_transition);
    case 6:
      id v3 = objc_msgSend(self, *off_2651D9D38[(char)v1]);
      id v4 = v3;
      uint64_t v5 = 1;
      if (((v1 >> 8) & 1) == 0) {
        uint64_t v5 = 2;
      }
      if (BYTE1(v1) == 2) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v5;
      }
      objc_msgSend(v3, sel_set_layerBehavior_, v6);
      break;
    default:
      return 0;
  }
  return v4;
}

id ReplaceSymbolEffect.objcRepresentation.getter()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  id v3 = objc_msgSend(self, *off_2651D9D38[v1]);
  id v4 = v3;
  uint64_t v5 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v5 = 2;
  }
  if (v2 == 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  objc_msgSend(v3, sel_set_layerBehavior_, v6);
  return v4;
}

id MagicReplaceSymbolEffect.objcRepresentation.getter()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  id v3 = self;
  id v4 = objc_msgSend(v3, *off_2651D9D38[v1]);
  uint64_t v5 = v4;
  uint64_t v6 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v6 = 2;
  }
  if (v2 == 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  objc_msgSend(v4, sel_set_layerBehavior_, v7);
  id v8 = objc_msgSend(v3, sel_magicTransitionWithFallback_, v5);

  return v8;
}

id AutomaticSymbolEffect.objcRepresentation.getter()
{
  id v0 = objc_msgSend(self, sel_transition);

  return v0;
}

uint64_t SymbolEffect.objcEffect.getter(uint64_t a1, uint64_t a2)
{
  return sub_24630E9DC(a1, a2, (uint64_t (*)(uint64_t *))sub_24630DED4);
}

uint64_t SymbolEffect.objcTransition.getter(uint64_t a1, uint64_t a2)
{
  return sub_24630E9DC(a1, a2, (uint64_t (*)(uint64_t *))sub_24630E700);
}

uint64_t sub_24630E9DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *))
{
  (*(void (**)(uint64_t *__return_ptr))(a2 + 16))(&v8);
  uint64_t v5 = v8;
  __int16 v6 = v9;
  char v7 = v10;
  return a3(&v5);
}

id ReplaceSymbolEffect.MagicReplace.objcRepresentation.getter()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  id v3 = self;
  id v4 = objc_msgSend(v3, *off_2651D9D38[v1]);
  uint64_t v5 = v4;
  uint64_t v6 = 1;
  if ((v2 & 1) == 0) {
    uint64_t v6 = 2;
  }
  if (v2 == 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  objc_msgSend(v4, sel_set_layerBehavior_, v7);
  id v8 = objc_msgSend(v3, sel_magicTransitionWithFallback_, v5);

  return v8;
}

uint64_t sub_24630EAE4(uint64_t a1, uint64_t a2)
{
  return sub_24630EC50(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24630EAFC(uint64_t a1, id *a2)
{
  uint64_t result = sub_246312A00();
  *a2 = 0;
  return result;
}

uint64_t sub_24630EB74(uint64_t a1, id *a2)
{
  char v3 = sub_246312A10();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24630EBF4@<X0>(uint64_t *a1@<X8>)
{
  sub_246312A20();
  uint64_t v2 = sub_2463129F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24630EC38(uint64_t a1, uint64_t a2)
{
  return sub_24630EC50(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24630EC50(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_246312A20();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24630EC94()
{
  sub_246312A20();
  sub_246312A30();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24630ECE8()
{
  sub_246312A20();
  sub_246312AB0();
  sub_246312A30();
  uint64_t v0 = sub_246312AF0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24630ED5C()
{
  uint64_t v0 = sub_246312A20();
  uint64_t v2 = v1;
  if (v0 == sub_246312A20() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_246312A90();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24630EDE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2463129F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24630EE30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_246312A20();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24630EE5C(uint64_t a1)
{
  uint64_t v2 = sub_246311B18(&qword_268F739F0);
  uint64_t v3 = sub_246311B18(&qword_268F739F8);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

unint64_t sub_24630EEF4(uint64_t a1)
{
  sub_246312A20();
  sub_246312AB0();
  sub_246312A30();
  uint64_t v2 = sub_246312AF0();
  swift_bridgeObjectRelease();

  return sub_24630EF88(a1, v2);
}

unint64_t sub_24630EF88(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_246312A20();
    uint64_t v8 = v7;
    if (v6 == sub_246312A20() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_246312A90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_246312A20();
          uint64_t v15 = v14;
          if (v13 == sub_246312A20() && v15 == v16) {
            break;
          }
          char v18 = sub_246312A90();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_24630F100(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F739B8);
  char v35 = a2;
  uint64_t v6 = sub_246312A60();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    char v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
            ++v20;
            if (v19) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v20;
      }
    }
LABEL_21:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    id v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    char v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_24630FD6C(v22, v36);
    }
    else
    {
      sub_24630FE20((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    sub_246312A20();
    sub_246312AB0();
    sub_246312A30();
    uint64_t v24 = sub_246312AF0();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_24630FD6C(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_24630F43C(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_24630EEF4((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_24630F5E8();
      goto LABEL_7;
    }
    sub_24630F100(v12, a3 & 1);
    unint64_t v18 = sub_24630EEF4((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for OptionKey(0);
    uint64_t result = (_OWORD *)sub_246312AA0();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    unint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_24630FD6C(a1, v16);
  }
LABEL_13:
  sub_24630F580(v9, (uint64_t)a2, a1, v15);

  return a2;
}

_OWORD *sub_24630F580(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_24630FD6C(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id sub_24630F5E8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F739B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246312A50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_24630FE20(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_24630FD6C(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t _s7Symbols25VariableColorSymbolEffectV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = a1[2];
  int v5 = *a2;
  int v6 = a2[1];
  int v7 = a2[2];
  if (v2 == 2)
  {
    if (v5 != 2) {
      return 0;
    }
  }
  else
  {
    uint64_t result = 0;
    BOOL v9 = (v2 & 1) == 0;
    if (v5 == 2 || ((v9 ^ v5) & 1) == 0) {
      return result;
    }
  }
  if (v3 == 2)
  {
    if (v6 != 2) {
      return 0;
    }
LABEL_11:
    if (v4 == 2)
    {
      if (v7 == 2) {
        return 1;
      }
    }
    else
    {
      BOOL v11 = (v4 & 1) == 0;
      if (v7 != 2 && ((v11 ^ v7) & 1) != 0) {
        return 1;
      }
    }
    return 0;
  }
  uint64_t result = 0;
  BOOL v10 = (v3 & 1) == 0;
  if (v6 != 2 && ((v10 ^ v6) & 1) != 0) {
    goto LABEL_11;
  }
  return result;
}

uint64_t _s7Symbols25SymbolEffectConfigurationV0C0O2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  unint64_t v3 = *(unint64_t *)a2;
  unsigned int v4 = *(unsigned __int16 *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 10);
  switch(*(unsigned char *)(a1 + 10))
  {
    case 1:
      if (v5 == 1) {
        goto LABEL_21;
      }
      goto LABEL_69;
    case 2:
      if (v5 != 2) {
        goto LABEL_69;
      }
      __int16 v20 = *(void *)a1;
      char v21 = BYTE2(v2);
      __int16 v18 = v3;
      char v19 = BYTE2(v3);
      char v8 = _s7Symbols25VariableColorSymbolEffectV2eeoiySbAC_ACtFZ_0((unsigned __int8 *)&v20, (unsigned __int8 *)&v18);
      return v8 & 1;
    case 3:
      if (v5 != 3) {
        goto LABEL_69;
      }
      goto LABEL_21;
    case 4:
      if (v5 != 4) {
        goto LABEL_69;
      }
      goto LABEL_21;
    case 5:
      if (v5 == 5) {
        goto LABEL_21;
      }
      goto LABEL_69;
    case 6:
      if (v5 == 6) {
        goto LABEL_28;
      }
      goto LABEL_69;
    case 7:
      if (v5 != 7) {
        goto LABEL_69;
      }
      goto LABEL_53;
    case 8:
      if (v5 != 8) {
        goto LABEL_69;
      }
      __int16 v11 = *(_WORD *)(a1 + 8);
      int v12 = *(_WORD *)(a2 + 8);
      if (v11 == 255)
      {
        if (v12 != 255) {
          goto LABEL_69;
        }
        goto LABEL_64;
      }
      if (v12 == 255) {
        goto LABEL_69;
      }
      if (*(_WORD *)(a1 + 8))
      {
        if (v11 == 1)
        {
          if (v12 != 1 || v2 != *(double *)&v3) {
            goto LABEL_69;
          }
LABEL_64:
          unsigned int v16 = v4 >> 8;
          if ((v11 & 0xFF00) == 0x200)
          {
            if (v16 == 2) {
              goto LABEL_53;
            }
          }
          else if (v16 != 2 && ((((v11 & 0x100) == 0) ^ ((unsigned __int16)(v4 & 0x100) >> 8)) & 1) != 0)
          {
            goto LABEL_53;
          }
          goto LABEL_69;
        }
        BOOL v15 = (*(void *)a1 & 1) == 0;
        if (v12 != 2) {
          goto LABEL_69;
        }
      }
      else
      {
        BOOL v15 = (*(void *)a1 & 1) == 0;
        if (*(_WORD *)(a2 + 8)) {
          goto LABEL_69;
        }
      }
      if (((v15 ^ v3) & 1) == 0) {
        goto LABEL_69;
      }
      goto LABEL_64;
    case 9:
      if (v5 != 9) {
        goto LABEL_69;
      }
LABEL_21:
      int v9 = *(void *)a2;
      if (*(void *)a1 == 2) {
        goto LABEL_22;
      }
      if (v9 == 2 || ((((*(void *)a1 & 1) == 0) ^ v3) & 1) == 0) {
        goto LABEL_69;
      }
      goto LABEL_47;
    case 0xA:
      if (v5 != 10) {
        goto LABEL_69;
      }
      int v9 = *(void *)a2;
      if (*(void *)a1 == 2)
      {
LABEL_22:
        if (v9 == 2) {
          goto LABEL_47;
        }
      }
      else if (v9 != 2 && ((v3 ^ LOBYTE(v2)) & 1) == 0)
      {
        goto LABEL_47;
      }
      goto LABEL_69;
    case 0xB:
      if (v5 != 11) {
        goto LABEL_69;
      }
LABEL_28:
      uint64_t v10 = *(void *)a2;
      if (*(void *)a1 == 3)
      {
        if (v10 != 3) {
          goto LABEL_69;
        }
      }
      else if (v10 == 3 || (v3 ^ LOBYTE(v2)) != 0)
      {
        goto LABEL_69;
      }
LABEL_47:
      int v6 = BYTE1(v3);
      if ((*(void *)a1 & 0xFF00) == 0x200)
      {
LABEL_48:
        if (v6 != 2) {
          goto LABEL_69;
        }
        goto LABEL_53;
      }
      BOOL v7 = (*(void *)a1 & 0x100) == 0;
      if (BYTE1(v3) != 2)
      {
        unint64_t v3 = (v3 >> 8) & 1;
LABEL_52:
        if ((v7 ^ v3))
        {
LABEL_53:
          char v8 = 1;
          return v8 & 1;
        }
      }
LABEL_69:
      char v8 = 0;
      return v8 & 1;
    default:
      if (*(unsigned char *)(a2 + 10)) {
        goto LABEL_69;
      }
      int v6 = *(void *)a2;
      if (*(void *)a1 == 2) {
        goto LABEL_48;
      }
      BOOL v7 = (*(void *)a1 & 1) == 0;
      if (v6 == 2) {
        goto LABEL_69;
      }
      goto LABEL_52;
  }
}

uint64_t _s7Symbols19ReplaceSymbolEffectV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = *a2;
  int v5 = a2[1];
  if (v2 != 3)
  {
    if (v4 == 3 || v2 != v4) {
      return 0;
    }
LABEL_9:
    if (v3 == 2)
    {
      if (v5 != 2) {
        return 0;
      }
    }
    else
    {
      BOOL v7 = (v3 & 1) == 0;
      if (v5 == 2 || ((v7 ^ v5) & 1) == 0) {
        return 0;
      }
    }
    return 1;
  }
  if (v4 == 3) {
    goto LABEL_9;
  }
  return 0;
}

uint64_t _s7Symbols18WiggleSymbolEffectV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(a1 + 9);
  int v4 = *(unsigned __int8 *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 9);
  if (v2 == 255)
  {
    if (v4 != 255) {
      return 0;
    }
  }
  else
  {
    if (v4 == 255) {
      return 0;
    }
    double v6 = *(double *)a1;
    double v7 = *(double *)a2;
    if (*(unsigned char *)(a1 + 8))
    {
      if (v2 == 1)
      {
        uint64_t result = 0;
        if (v4 != 1 || v6 != v7) {
          return result;
        }
        goto LABEL_14;
      }
      uint64_t result = 0;
      BOOL v9 = (LOBYTE(v6) & 1) == 0;
      if (v4 != 2) {
        return result;
      }
    }
    else
    {
      uint64_t result = 0;
      BOOL v9 = (LOBYTE(v6) & 1) == 0;
      if (*(unsigned char *)(a2 + 8)) {
        return result;
      }
    }
    if (((v9 ^ LODWORD(v7)) & 1) == 0) {
      return result;
    }
  }
LABEL_14:
  if (v3 == 2)
  {
    if (v5 != 2) {
      return 0;
    }
  }
  else
  {
    BOOL v10 = (v3 & 1) == 0;
    if (v5 == 2 || ((v10 ^ v5) & 1) == 0) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_24630FC78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = *a2;
  int v5 = a2[1];
  if (v2 == 2)
  {
    if (v4 != 2) {
      return 0;
    }
LABEL_6:
    if (v3 == 2)
    {
      if (v5 == 2) {
        return 1;
      }
    }
    else
    {
      BOOL v8 = (v3 & 1) == 0;
      if (v5 != 2 && ((v8 ^ v5) & 1) != 0) {
        return 1;
      }
    }
    return 0;
  }
  uint64_t result = 0;
  BOOL v7 = (v2 & 1) == 0;
  if (v4 != 2 && ((v7 ^ v4) & 1) != 0) {
    goto LABEL_6;
  }
  return result;
}

uint64_t _s7Symbols19BreatheSymbolEffectV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = *a2;
  int v5 = a2[1];
  if (v2 != 2)
  {
    int v6 = (v4 ^ v2) & 1;
    if (v4 == 2 || v6 != 0) {
      return 0;
    }
LABEL_9:
    if (v3 == 2)
    {
      if (v5 != 2) {
        return 0;
      }
    }
    else
    {
      BOOL v8 = (v3 & 1) == 0;
      if (v5 == 2 || ((v8 ^ v5) & 1) == 0) {
        return 0;
      }
    }
    return 1;
  }
  if (v4 == 2) {
    goto LABEL_9;
  }
  return 0;
}

_OWORD *sub_24630FD6C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24630FD7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F738C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_24630FE20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t _s7Symbols18WiggleSymbolEffectV0B5StyleO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a2;
  int v3 = *(unsigned __int8 *)(a2 + 8);
  char v4 = ((*(void *)a1 & 1) == 0) ^ *(void *)a2;
  if (*(unsigned char *)(a2 + 8)) {
    char v4 = 0;
  }
  BOOL v5 = *(double *)a1 == v2;
  if (v3 != 1) {
    BOOL v5 = 0;
  }
  char v6 = ((*(void *)a1 & 1) == 0) ^ LOBYTE(v2);
  if (v3 != 2) {
    char v6 = 0;
  }
  if (*(unsigned char *)(a1 + 8) == 1) {
    char v6 = v5;
  }
  if (!*(unsigned char *)(a1 + 8)) {
    char v6 = v4;
  }
  return v6 & 1;
}

unint64_t sub_24630FEEC()
{
  unint64_t result = qword_268F738D0;
  if (!qword_268F738D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F738D0);
  }
  return result;
}

unint64_t sub_24630FF44()
{
  unint64_t result = qword_268F738D8;
  if (!qword_268F738D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F738D8);
  }
  return result;
}

unint64_t sub_24630FF98(uint64_t a1)
{
  unint64_t result = sub_24630FFC0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24630FFC0()
{
  unint64_t result = qword_268F738E0;
  if (!qword_268F738E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F738E0);
  }
  return result;
}

unint64_t sub_246310018()
{
  unint64_t result = qword_268F738E8;
  if (!qword_268F738E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F738E8);
  }
  return result;
}

unint64_t sub_24631006C(uint64_t a1)
{
  unint64_t result = sub_246310094();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246310094()
{
  unint64_t result = qword_268F738F0;
  if (!qword_268F738F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F738F0);
  }
  return result;
}

unint64_t sub_2463100EC()
{
  unint64_t result = qword_268F738F8;
  if (!qword_268F738F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F738F8);
  }
  return result;
}

unint64_t sub_246310140(uint64_t a1)
{
  unint64_t result = sub_246310168();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246310168()
{
  unint64_t result = qword_268F73900;
  if (!qword_268F73900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73900);
  }
  return result;
}

unint64_t sub_2463101C0()
{
  unint64_t result = qword_268F73908;
  if (!qword_268F73908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73908);
  }
  return result;
}

unint64_t sub_246310214(uint64_t a1)
{
  unint64_t result = sub_24631023C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24631023C()
{
  unint64_t result = qword_268F73910;
  if (!qword_268F73910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73910);
  }
  return result;
}

unint64_t sub_246310294()
{
  unint64_t result = qword_268F73918;
  if (!qword_268F73918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73918);
  }
  return result;
}

unint64_t sub_2463102E8(uint64_t a1)
{
  unint64_t result = sub_246310310();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246310310()
{
  unint64_t result = qword_268F73920;
  if (!qword_268F73920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73920);
  }
  return result;
}

unint64_t sub_246310368()
{
  unint64_t result = qword_268F73928;
  if (!qword_268F73928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73928);
  }
  return result;
}

unint64_t sub_2463103BC(uint64_t a1)
{
  unint64_t result = sub_2463103E4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2463103E4()
{
  unint64_t result = qword_268F73930;
  if (!qword_268F73930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73930);
  }
  return result;
}

unint64_t sub_24631043C()
{
  unint64_t result = qword_268F73938;
  if (!qword_268F73938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73938);
  }
  return result;
}

unint64_t sub_246310494()
{
  unint64_t result = qword_268F73940;
  if (!qword_268F73940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73940);
  }
  return result;
}

unint64_t sub_2463104E8(uint64_t a1)
{
  unint64_t result = sub_246310510();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246310510()
{
  unint64_t result = qword_268F73948;
  if (!qword_268F73948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73948);
  }
  return result;
}

unint64_t sub_246310568()
{
  unint64_t result = qword_268F73950;
  if (!qword_268F73950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73950);
  }
  return result;
}

unint64_t sub_2463105BC(uint64_t a1)
{
  unint64_t result = sub_2463105E4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2463105E4()
{
  unint64_t result = qword_26B111DE0;
  if (!qword_26B111DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B111DE0);
  }
  return result;
}

unint64_t sub_24631063C()
{
  unint64_t result = qword_26B111DE8;
  if (!qword_26B111DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B111DE8);
  }
  return result;
}

unint64_t sub_246310694()
{
  unint64_t result = qword_268F73958;
  if (!qword_268F73958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73958);
  }
  return result;
}

unint64_t sub_2463106E8(uint64_t a1)
{
  unint64_t result = sub_246310710();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246310710()
{
  unint64_t result = qword_268F73960;
  if (!qword_268F73960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73960);
  }
  return result;
}

unint64_t sub_246310768()
{
  unint64_t result = qword_268F73968;
  if (!qword_268F73968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73968);
  }
  return result;
}

unint64_t sub_2463107BC(uint64_t a1)
{
  unint64_t result = sub_2463107E4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2463107E4()
{
  unint64_t result = qword_268F73970;
  if (!qword_268F73970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73970);
  }
  return result;
}

unint64_t sub_24631083C()
{
  unint64_t result = qword_268F73978;
  if (!qword_268F73978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73978);
  }
  return result;
}

unint64_t sub_246310894()
{
  unint64_t result = qword_268F73980;
  if (!qword_268F73980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73980);
  }
  return result;
}

unint64_t sub_2463108E8(uint64_t a1)
{
  unint64_t result = sub_246310910();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246310910()
{
  unint64_t result = qword_268F73988;
  if (!qword_268F73988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73988);
  }
  return result;
}

unint64_t sub_246310968()
{
  unint64_t result = qword_268F73990;
  if (!qword_268F73990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73990);
  }
  return result;
}

unint64_t sub_2463109BC(uint64_t a1)
{
  unint64_t result = sub_2463109E4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2463109E4()
{
  unint64_t result = qword_268F73998;
  if (!qword_268F73998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73998);
  }
  return result;
}

unint64_t sub_246310A3C()
{
  unint64_t result = qword_268F739A0;
  if (!qword_268F739A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F739A0);
  }
  return result;
}

unint64_t sub_246310A90(uint64_t a1)
{
  unint64_t result = sub_246310AB8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_246310AB8()
{
  unint64_t result = qword_268F739A8;
  if (!qword_268F739A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F739A8);
  }
  return result;
}

unint64_t sub_246310B10()
{
  unint64_t result = qword_268F739B0;
  if (!qword_268F739B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F739B0);
  }
  return result;
}

uint64_t dispatch thunk of SymbolEffect.configuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t __swift_memcpy11_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 7) = *(_DWORD *)((char *)a2 + 7);
  *(void *)unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectConfiguration()
{
  return &type metadata for SymbolEffectConfiguration;
}

uint64_t _s7Symbols25SymbolEffectConfigurationV6EffectOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF5 && *(unsigned char *)(a1 + 11)) {
    return (*(_DWORD *)a1 + 245);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 <= 0xB) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s7Symbols25SymbolEffectConfigurationV6EffectOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(unsigned char *)(result + 10) = 0;
    *(_WORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 245;
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 11) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF5) {
      *(unsigned char *)(result + 11) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 10) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_246310C38(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 10);
}

uint64_t sub_246310C40(uint64_t result, char a2)
{
  *(unsigned char *)(result + 10) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectConfiguration.Effect()
{
  return &type metadata for SymbolEffectConfiguration.Effect;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PulseSymbolEffect(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  if (v6 >= 2) {
    int v7 = ((v6 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v7 = -2;
  }
  if (v7 < 0) {
    int v7 = -1;
  }
  return (v7 + 1);
}

unsigned char *storeEnumTagSinglePayload for PulseSymbolEffect(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246310DDCLL);
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

ValueMetadata *type metadata accessor for PulseSymbolEffect()
{
  return &type metadata for PulseSymbolEffect;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for BounceSymbolEffect()
{
  return &type metadata for BounceSymbolEffect;
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for VariableColorSymbolEffect(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE)
  {
    if ((a2 + 33554178) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
      }
    }
  }
  unsigned int v4 = *(unsigned __int8 *)a1;
  if (v4 >= 2) {
    int v5 = ((v4 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v5 = -2;
  }
  if (v5 < 0) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for VariableColorSymbolEffect(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554178) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFD) {
    int v3 = 0;
  }
  if (a2 > 0xFD)
  {
    *(_WORD *)unint64_t result = a2 - 254;
    *(unsigned char *)(result + 2) = (a2 - 254) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 254) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)unint64_t result = a2 + 2;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VariableColorSymbolEffect()
{
  return &type metadata for VariableColorSymbolEffect;
}

ValueMetadata *type metadata accessor for ScaleSymbolEffect()
{
  return &type metadata for ScaleSymbolEffect;
}

uint64_t getEnumTagSinglePayload for ReplaceSymbolEffect.ReplaceStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ReplaceSymbolEffect.ReplaceStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2463110E8);
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

uint64_t sub_246311110(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_246311118(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ReplaceSymbolEffect.ReplaceStyle()
{
  return &type metadata for ReplaceSymbolEffect.ReplaceStyle;
}

ValueMetadata *type metadata accessor for AutomaticSymbolEffect()
{
  return &type metadata for AutomaticSymbolEffect;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for WiggleSymbolEffect(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 9);
  if (v3 >= 2) {
    int v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v4 = -2;
  }
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiggleSymbolEffect(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 9) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WiggleSymbolEffect()
{
  return &type metadata for WiggleSymbolEffect;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for WiggleSymbolEffect.WiggleStyle(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiggleSymbolEffect.WiggleStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2463112A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2463112B0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for WiggleSymbolEffect.WiggleStyle()
{
  return &type metadata for WiggleSymbolEffect.WiggleStyle;
}

uint64_t _s7Symbols18BounceSymbolEffectVwet_0(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 65282 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65282 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65282;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  if (v6 >= 2) {
    int v7 = ((v6 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v7 = -2;
  }
  if (v7 < 0) {
    int v7 = -1;
  }
  return (v7 + 1);
}

uint64_t _s7Symbols18BounceSymbolEffectVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65282 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65282 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 254) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 254;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x246311444);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RotateSymbolEffect()
{
  return &type metadata for RotateSymbolEffect;
}

uint64_t getEnumTagSinglePayload for BreatheSymbolEffect(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 65282 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65282 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65282;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
LABEL_17:
  if (*(unsigned __int8 *)a1 <= 2u) {
    int v6 = 2;
  }
  else {
    int v6 = *(unsigned __int8 *)a1;
  }
  int v7 = v6 - 3;
  if (*(unsigned __int8 *)a1 < 2u) {
    int v8 = -1;
  }
  else {
    int v8 = v7;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BreatheSymbolEffect(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65282 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65282 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 254) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 254;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2463115ECLL);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BreatheSymbolEffect()
{
  return &type metadata for BreatheSymbolEffect;
}

uint64_t getEnumTagSinglePayload for BreatheSymbolEffect.BreatheStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BreatheSymbolEffect.BreatheStyle(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x246311780);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_2463117A8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BreatheSymbolEffect.BreatheStyle()
{
  return &type metadata for BreatheSymbolEffect.BreatheStyle;
}

ValueMetadata *type metadata accessor for MagicReplaceSymbolEffect()
{
  return &type metadata for MagicReplaceSymbolEffect;
}

uint64_t _s7Symbols19ReplaceSymbolEffectVwet_0(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 65282 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65282 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65282;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65282;
    }
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  if (v6 >= 2) {
    int v7 = ((v6 + 2147483646) & 0x7FFFFFFF) - 1;
  }
  else {
    int v7 = -2;
  }
  if (v7 < 0) {
    int v7 = -1;
  }
  return (v7 + 1);
}

uint64_t _s7Symbols19ReplaceSymbolEffectVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65282 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65282 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 254) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 254;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x246311950);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)(result + 1) = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplaceSymbolEffect.MagicReplace()
{
  return &type metadata for ReplaceSymbolEffect.MagicReplace;
}

uint64_t sub_246311988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F739C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for OptionKey(uint64_t a1)
{
}

void type metadata accessor for RBSymbolAnimation(uint64_t a1)
{
}

void sub_246311A68(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_246311AB0()
{
  return sub_246311B18(&qword_268F739D8);
}

uint64_t sub_246311AE4()
{
  return sub_246311B18(&qword_268F739E0);
}

uint64_t sub_246311B18(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OptionKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246311B5C()
{
  return sub_246311B18(&qword_268F739E8);
}

uint64_t SymbolEffectOptions.RepeatOption.hash(into:)()
{
  if ((*(unsigned char *)(v0 + 8) & 1) == 0) {
    sub_246312AC0();
  }
  return sub_246312AC0();
}

BOOL static SymbolEffectOptions.RepeatOption.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8) == 1) {
    return (*(unsigned char *)(a2 + 8) & 1) != 0;
  }
  if (*(unsigned char *)(a2 + 8)) {
    return 0;
  }
  return *(void *)a1 == *(void *)a2;
}

uint64_t SymbolEffectOptions.RepeatOption.hashValue.getter()
{
  char v1 = *(unsigned char *)(v0 + 8);
  sub_246312AB0();
  if ((v1 & 1) == 0) {
    sub_246312AC0();
  }
  sub_246312AC0();
  return sub_246312AF0();
}

uint64_t sub_246311D40()
{
  char v1 = *(unsigned char *)(v0 + 8);
  sub_246312AB0();
  if ((v1 & 1) == 0) {
    sub_246312AC0();
  }
  sub_246312AC0();
  return sub_246312AF0();
}

uint64_t sub_246311DA0()
{
  if ((*(unsigned char *)(v0 + 8) & 1) == 0) {
    sub_246312AC0();
  }
  return sub_246312AC0();
}

uint64_t sub_246311DE8()
{
  char v1 = *(unsigned char *)(v0 + 8);
  sub_246312AB0();
  if ((v1 & 1) == 0) {
    sub_246312AC0();
  }
  sub_246312AC0();
  return sub_246312AF0();
}

BOOL sub_246311E48(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8) == 1) {
    return (*(unsigned char *)(a2 + 8) & 1) != 0;
  }
  if (*(unsigned char *)(a2 + 8)) {
    return 0;
  }
  return *(void *)a1 == *(void *)a2;
}

double SymbolEffectOptions.speed.getter()
{
  return *(double *)v0;
}

void SymbolEffectOptions.speed.setter(double a1)
{
  *char v1 = a1;
}

uint64_t (*SymbolEffectOptions.speed.modify())()
{
  return nullsub_1;
}

void SymbolEffectOptions.repeat.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 16);
  char v3 = *(unsigned char *)(v1 + 17);
  *(void *)a1 = *(void *)(v1 + 8);
  *(unsigned char *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 9) = v3;
}

uint64_t SymbolEffectOptions.repeat.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  char v3 = *(unsigned char *)(result + 9);
  *(void *)(v1 + 8) = *(void *)result;
  *(unsigned char *)(v1 + 16) = v2;
  *(unsigned char *)(v1 + 17) = v3;
  return result;
}

uint64_t (*SymbolEffectOptions.repeat.modify())()
{
  return nullsub_1;
}

uint64_t SymbolEffectOptions.prefersContinuous.getter()
{
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t SymbolEffectOptions.prefersContinuous.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 18) = result;
  return result;
}

uint64_t (*SymbolEffectOptions.prefersContinuous.modify())()
{
  return nullsub_1;
}

uint64_t SymbolEffectOptions.repeatDelay.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t SymbolEffectOptions.repeatDelay.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 24) = result;
  *(unsigned char *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*SymbolEffectOptions.repeatDelay.modify())()
{
  return nullsub_1;
}

void static SymbolEffectOptions.default.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x3FF0000000000000;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 256;
  *(unsigned char *)(a1 + 18) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

void static SymbolEffectOptions.speed(_:)(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 256;
  *(unsigned char *)(a1 + 18) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

void SymbolEffectOptions.speed(_:)(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v3 = *(void *)(v2 + 8);
  char v4 = *(unsigned char *)(v2 + 16);
  char v5 = *(unsigned char *)(v2 + 17);
  char v6 = *(unsigned char *)(v2 + 18);
  uint64_t v7 = *(void *)(v2 + 24);
  char v8 = *(unsigned char *)(v2 + 32);
  *(double *)a1 = a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 17) = v5;
  *(unsigned char *)(a1 + 18) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
}

uint64_t static SymbolEffectOptions.repeat(_:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = result;
  }
  *(void *)a3 = 0x3FF0000000000000;
  *(void *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 17) = a2 & 1;
  *(unsigned char *)(a3 + 18) = 0;
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 1;
  return result;
}

uint64_t SymbolEffectOptions.repeat(_:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)a3 = *v3;
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = result;
  }
  *(void *)(a3 + 8) = v4;
  *(unsigned char *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 17) = a2 & 1;
  *(unsigned char *)(a3 + 18) = 0;
  *(void *)(a3 + 24) = 0;
  *(unsigned char *)(a3 + 32) = 1;
  return result;
}

void static SymbolEffectOptions.repeating.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x3FF0000000000000;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(unsigned char *)(a1 + 18) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

double SymbolEffectOptions.repeating.getter@<D0>(uint64_t a1@<X8>)
{
  double result = *v1;
  *(double *)a1 = *v1;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(unsigned char *)(a1 + 18) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

void static SymbolEffectOptions.nonRepeating.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0x3FF0000000000000;
  *(void *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 18) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

double SymbolEffectOptions.nonRepeating.getter@<D0>(uint64_t a1@<X8>)
{
  double result = *v1;
  *(double *)a1 = *v1;
  *(void *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 18) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

uint64_t SymbolEffectOptions.hash(into:)()
{
  char v1 = v0[16];
  int v2 = v0[17];
  char v3 = v0[32];
  sub_246312AE0();
  if (v2 == 1)
  {
    sub_246312AD0();
  }
  else
  {
    sub_246312AD0();
    if ((v1 & 1) == 0) {
      sub_246312AC0();
    }
    sub_246312AC0();
  }
  sub_246312AD0();
  if (v3) {
    return sub_246312AD0();
  }
  sub_246312AD0();
  return sub_246312AE0();
}

uint64_t SymbolEffectOptions.hashValue.getter()
{
  return sub_246312AF0();
}

uint64_t sub_246312220()
{
  return sub_246312AF0();
}

uint64_t sub_2463122A0()
{
  return sub_246312AF0();
}

void static SymbolEffectOptions.repeating(delay:)(uint64_t a1@<X8>, double a2@<D0>)
{
  *(void *)a1 = 0x3FF0000000000000;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(unsigned char *)(a1 + 18) = 0;
  *(double *)(a1 + 24) = a2;
  *(unsigned char *)(a1 + 32) = 0;
}

void SymbolEffectOptions.repeating(delay:)(uint64_t a1@<X8>, double a2@<D0>)
{
  *(void *)a1 = *v2;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(unsigned char *)(a1 + 18) = 0;
  *(double *)(a1 + 24) = a2;
  *(unsigned char *)(a1 + 32) = 0;
}

uint64_t static SymbolEffectOptions.repeat(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = result;
  }
  *(void *)a3 = 0x3FF0000000000000;
  *(void *)(a3 + 8) = v4;
  *(unsigned char *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 17) = a2 & 1;
  *(unsigned char *)(a3 + 18) = 0;
  *(double *)(a3 + 24) = a4;
  *(unsigned char *)(a3 + 32) = 0;
  return result;
}

uint64_t SymbolEffectOptions.repeat(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(void *)a3 = *v4;
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = result;
  }
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 17) = a2 & 1;
  *(unsigned char *)(a3 + 18) = 0;
  *(double *)(a3 + 24) = a4;
  *(unsigned char *)(a3 + 32) = 0;
  return result;
}

void static SymbolEffectOptions._RepeatStyle.periodic.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

uint64_t static SymbolEffectOptions._RepeatStyle.periodic(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = 0;
  *(void *)(a5 + 8) = a3;
  *(unsigned char *)(a5 + 16) = a4 & 1;
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = result;
  }
  *(void *)(a5 + 24) = v5;
  *(unsigned char *)(a5 + 32) = a2 & 1;
  return result;
}

void static SymbolEffectOptions._RepeatStyle.continuous.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

id SymbolEffectOptions.objcRepresentation.getter()
{
  double v1 = *(double *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  char v4 = *(unsigned char *)(v0 + 17);
  uint64_t v5 = *(unsigned __int8 *)(v0 + 18);
  char v6 = *(unsigned char *)(v0 + 32);
  id v7 = objc_msgSend(self, sel_options);
  objc_msgSend(v7, sel_set_speed_, v1);
  if (v4)
  {
    objc_msgSend(v7, sel_set_repeatBehavior_, 0);
    if (v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v7, sel_set_repeatBehavior_, 2);
    objc_msgSend(v7, sel_set_repeatCount_, v2);
    if (v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_msgSend(v7, sel_set_repeatBehavior_, 1);
  if ((v6 & 1) == 0)
  {
LABEL_8:
    sub_2463126B8();
    char v8 = (void *)sub_246312A40();
    objc_msgSend(v7, sel_set_repeatDelay_, v8);
  }
LABEL_9:
  objc_msgSend(v7, sel_set_prefersContinuous_, v5);
  return v7;
}

void static SymbolEffectOptions.RepeatBehavior.periodic.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

uint64_t static SymbolEffectOptions.RepeatBehavior.periodic(_:delay:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(unsigned char *)a5 = 0;
  *(void *)(a5 + 8) = a3;
  *(unsigned char *)(a5 + 16) = a4 & 1;
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = result;
  }
  *(void *)(a5 + 24) = v5;
  *(unsigned char *)(a5 + 32) = a2 & 1;
  return result;
}

void static SymbolEffectOptions.RepeatBehavior.continuous.getter(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = 1;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
}

double _s7Symbols19SymbolEffectOptionsV7_repeatyA2C12_RepeatStyleVF_0@<D0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3 = *a1;
  uint64_t v4 = *((void *)a1 + 1);
  char v5 = a1[16];
  uint64_t v6 = *((void *)a1 + 3);
  unsigned __int8 v7 = a1[32];
  double result = *v2;
  *(double *)a2 = *v2;
  *(void *)(a2 + 8) = v6;
  *(_WORD *)(a2 + 16) = v7;
  *(unsigned char *)(a2 + 18) = v3;
  *(void *)(a2 + 24) = v4;
  *(unsigned char *)(a2 + 32) = v5;
  return result;
}

char *_s7Symbols19SymbolEffectOptionsV7_repeatyA2C12_RepeatStyleVFZ_0@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *result;
  uint64_t v3 = *((void *)result + 1);
  char v4 = result[16];
  uint64_t v5 = *((void *)result + 3);
  unsigned __int8 v6 = result[32];
  *(void *)a2 = 0x3FF0000000000000;
  *(void *)(a2 + 8) = v5;
  *(_WORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 18) = v2;
  *(void *)(a2 + 24) = v3;
  *(unsigned char *)(a2 + 32) = v4;
  return result;
}

uint64_t _s7Symbols19SymbolEffectOptionsV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 != *(double *)a2) {
    return 0;
  }
  int v3 = *(unsigned __int8 *)(a1 + 18);
  double v4 = *(double *)(a1 + 24);
  char v5 = *(unsigned char *)(a1 + 32);
  if (*(unsigned char *)(a1 + 17))
  {
    uint64_t result = 0;
    if (!*(unsigned char *)(a2 + 17)) {
      return result;
    }
  }
  else
  {
    if (*(unsigned char *)(a2 + 17)) {
      return 0;
    }
    if (*(unsigned char *)(a1 + 16))
    {
      uint64_t result = 0;
      if ((*(unsigned char *)(a2 + 16) & 1) == 0) {
        return result;
      }
    }
    else
    {
      if (*(unsigned char *)(a2 + 16)) {
        return 0;
      }
      uint64_t result = 0;
      if (*(void *)(a1 + 8) != *(void *)(a2 + 8)) {
        return result;
      }
    }
  }
  if ((v3 ^ *(unsigned __int8 *)(a2 + 18))) {
    return result;
  }
  if (v5)
  {
    if (*(unsigned char *)(a2 + 32)) {
      return 1;
    }
  }
  else
  {
    if (v4 == *(double *)(a2 + 24)) {
      char v7 = *(unsigned char *)(a2 + 32);
    }
    else {
      char v7 = 1;
    }
    if ((v7 & 1) == 0) {
      return 1;
    }
  }
  return 0;
}

unint64_t sub_2463126B8()
{
  unint64_t result = qword_268F73A00;
  if (!qword_268F73A00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268F73A00);
  }
  return result;
}

unint64_t sub_2463126FC()
{
  unint64_t result = qword_268F73A08;
  if (!qword_268F73A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73A08);
  }
  return result;
}

unint64_t sub_246312754()
{
  unint64_t result = qword_268F73A10;
  if (!qword_268F73A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F73A10);
  }
  return result;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SymbolEffectOptions(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 18);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SymbolEffectOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 18) = a2 + 1;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SymbolEffectOptions.RepeatOption(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SymbolEffectOptions.RepeatOption(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_2463128A8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2463128C4(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions.RepeatOption()
{
  return &type metadata for SymbolEffectOptions.RepeatOption;
}

uint64_t initializeBufferWithCopyOfBuffer for SymbolEffectOptions._RepeatStyle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions._RepeatStyle()
{
  return &type metadata for SymbolEffectOptions._RepeatStyle;
}

uint64_t _s7Symbols19SymbolEffectOptionsV12_RepeatStyleVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[33]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t _s7Symbols19SymbolEffectOptionsV12_RepeatStyleVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SymbolEffectOptions.RepeatBehavior()
{
  return &type metadata for SymbolEffectOptions.RepeatBehavior;
}

uint64_t sub_2463129F0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246312A00()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_246312A10()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_246312A20()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_246312A30()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_246312A40()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_246312A50()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_246312A60()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_246312A70()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_246312A90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_246312AA0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_246312AB0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246312AC0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_246312AD0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_246312AE0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_246312AF0()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}