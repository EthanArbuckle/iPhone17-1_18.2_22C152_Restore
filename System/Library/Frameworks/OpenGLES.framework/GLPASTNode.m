@interface GLPASTNode
@end

@implementation GLPASTNode

uint64_t __deserialize_GLPASTNode_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(v2 + 260);
  unint64_t v4 = *(unsigned int *)(v2 + 256);
  if (v3 >= v4) {
    goto LABEL_103;
  }
  uint64_t v5 = *(void *)(v2 + 248);
  int v6 = *(char *)(v5 + v3);
  unint64_t v7 = *(unsigned __int8 *)(v5 + v3);
  uint64_t v8 = v3 + 1;
  *(_DWORD *)(v2 + 260) = v3 + 1;
  if (v6 < 0)
  {
    uint64_t v9 = (v7 >> 1) & 7;
    switch(v9)
    {
      case 1:
        if (v3 + 3 > v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(unsigned __int16 *)(v5 + v8);
        unsigned int v11 = v3 + 3;
        break;
      case 2:
        unsigned int v11 = v3 + 4;
        if (v11 > v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(unsigned __int16 *)(v5 + v8) | ((unint64_t)*(unsigned __int8 *)(v5 + v8 + 2) << 16);
        break;
      case 3:
        if (v3 + 5 > v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(unsigned int *)(v5 + v8);
        unsigned int v11 = v3 + 5;
        break;
      case 4:
        if (v3 + 5 > v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(unsigned int *)(v5 + v8);
        *(_DWORD *)(v2 + 260) = v3 + 5;
        if ((int)v3 + 5 >= v4) {
          goto LABEL_103;
        }
        unsigned int v11 = v3 + 6;
        break;
      case 5:
        if (v3 + 5 > v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(unsigned int *)(v5 + v8);
        uint64_t v12 = (v3 + 5);
        *(_DWORD *)(v2 + 260) = v12;
        if (v12 + 2 > v4) {
          goto LABEL_103;
        }
        unsigned int v11 = v3 + 7;
        break;
      case 6:
        if (v3 + 5 > v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(unsigned int *)(v5 + v8);
        *(_DWORD *)(v2 + 260) = v3 + 5;
        unsigned int v11 = v3 + 8;
        if (v11 > v4) {
          goto LABEL_103;
        }
        break;
      case 7:
        if (v3 + 9 > v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(void *)(v5 + v8);
        unsigned int v11 = v3 + 9;
        break;
      default:
        if (v8 >= v4) {
          goto LABEL_103;
        }
        unint64_t v10 = *(unsigned __int8 *)(v5 + v8);
        unsigned int v11 = v3 + 2;
        break;
    }
    *(_DWORD *)(v2 + 260) = v11;
    if (v6) {
      uint64_t v13 = -256 << (8 * v9);
    }
    else {
      uint64_t v13 = 0;
    }
    unint64_t v7 = v10 | v13;
  }
  unsigned int v14 = glp_serialized_integer32_control(v7);
  uint64_t v15 = *(void *)(a1 + 32);
  *(_DWORD *)(v15 + 260) += ~((((v14 >> 1) & 7) + 1) & ((char)v14 >> 7));
  v16 = *(uint64_t **)(v15 + 240);
  uint64_t v17 = *v16;
  v18 = (uint64_t (*)(uint64_t, uint64_t, const char *))v16[1];
  uint64_t v19 = glpBaseSizeOfNodeKind(v7);
  uint64_t v20 = v18(v17, v19, "Deserialized");
  switch((int)v7)
  {
    case 0:
      deserializeTypeConversionFields(*(void *)(a1 + 32), v20);
      break;
    case 1:
      deserializeVariableIdentifierFields(*(void *)(a1 + 32), v20);
      break;
    case 2:
      deserializeTypeIdentifierFields(*(void *)(a1 + 32), v20);
      break;
    case 3:
      deserializeConstantFields(*(void **)(a1 + 32), v20);
      break;
    case 4:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 48:
    case 51:
    case 52:
    case 54:
    case 65:
    case 67:
    case 68:
    case 69:
    case 72:
    case 73:
    case 74:
    case 77:
    case 82:
      v21.n128_f64[0] = deserializeASTFields(*(void *)(a1 + 32), v20);
      break;
    case 5:
      deserializeFieldAccessFields(*(void *)(a1 + 32), v20);
      break;
    case 6:
    case 10:
      deserializeCallFields(*(void *)(a1 + 32), v20);
      break;
    case 7:
      deserializeFunctionCallFields(*(void **)(a1 + 32), (void *)v20);
      break;
    case 8:
      deserializeSubroutineArrayCallFields(*(void *)(a1 + 32), v20);
      break;
    case 9:
      deserializeMethodCallFields(*(void *)(a1 + 32), v20);
      break;
    case 30:
      deserializeEqualFields(*(void *)(a1 + 32), v20);
      break;
    case 31:
      deserializeNotEqualFields(*(void *)(a1 + 32), v20);
      break;
    case 39:
      deserializeAssignFields(*(void *)(a1 + 32), v20);
      break;
    case 40:
      deserializeASTFields(*(void *)(a1 + 32), v20);
      abort();
    case 41:
      deserializeReadInputFields(*(void **)(a1 + 32), v20);
      break;
    case 42:
      deserializeWriteOutputFields(*(void **)(a1 + 32), v20);
      break;
    case 43:
      deserializeCommaExprFields(*(void *)(a1 + 32), v20);
      break;
    case 44:
      deserializeParameterDeclarationFields(*(void **)(a1 + 32), (void *)v20);
      break;
    case 45:
      deserializeFunctionPrototypeFields(*(void *)(a1 + 32), v20);
      break;
    case 46:
      deserializeVariableDeclarationFields(*(void *)(a1 + 32), v20);
      break;
    case 47:
      deserializeVariableDeclarationGroupFields(*(void *)(a1 + 32), v20);
      break;
    case 49:
      deserializeQualifiedDeclarationFields(*(void *)(a1 + 32), v20);
      break;
    case 50:
      deserializeQualifiedDeclarationGroupFields(*(void *)(a1 + 32), v20);
      break;
    case 53:
      deserializePrimitiveTypeFields(*(void *)(a1 + 32), v20);
      break;
    case 55:
      deserializeFieldDeclarationFields(*(void *)(a1 + 32), v20);
      break;
    case 56:
      deserializeStructTypeFields(*(void *)(a1 + 32), v20);
      break;
    case 57:
      deserializeInterfaceBlockFields(*(void *)(a1 + 32), v20);
      break;
    case 58:
      deserializeLayoutTypeFields(*(void *)(a1 + 32), v20);
      break;
    case 59:
      deserializeKeywordQualifierFields(*(void *)(a1 + 32), v20);
      break;
    case 60:
      deserializeLayoutQualifierFields(*(void *)(a1 + 32), v20);
      break;
    case 61:
      deserializeSubroutineTypeListFields(*(void *)(a1 + 32), v20);
      break;
    case 62:
      deserializeQualifierListFields(*(void *)(a1 + 32), v20);
      break;
    case 63:
      deserializeGlobalTypeQualifierFields(*(void **)(a1 + 32), v20);
      break;
    case 64:
      deserializeLayoutPairFields(*(void *)(a1 + 32), v20);
      break;
    case 66:
      deserializeBlockFields(*(void *)(a1 + 32), v20);
      break;
    case 70:
      deserializeCaseStatementFields(*(void *)(a1 + 32), v20);
      break;
    case 71:
      deserializeDefaultStatementFields(*(void *)(a1 + 32), v20);
      break;
    case 75:
      deserializeReturnStatementFields(*(void **)(a1 + 32), v20);
      break;
    case 76:
      deserializeTopLevelFields(*(void *)(a1 + 32), v20);
      break;
    case 78:
      deserializeRawCallFields(*(void **)(a1 + 32), (void *)v20);
      break;
    case 79:
      deserializeSubroutineRawCallFields(*(void **)(a1 + 32), v20);
      break;
    case 80:
      deserializeOffsetFields(*(void *)(a1 + 32), v20);
      break;
    case 81:
      deserializeLValueFields(*(void *)(a1 + 32), v20);
      break;
    case 83:
      deserializeIBPartialDerefFields(*(void **)(a1 + 32), v20);
      break;
    case 84:
      deserializePPStreamOpFields(*(void *)(a1 + 32), (_DWORD *)v20);
      break;
    case 85:
      deserializeSubroutineUniformFields(*(void **)(a1 + 32), v20);
      break;
    default:
      glpDeserialError(*(void *)(a1 + 32), 9u);
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v22 = *(unsigned int *)(v2 + 260);
  unint64_t v23 = *(unsigned int *)(v2 + 256);
  if (v22 >= v23) {
LABEL_103:
  }
    glpDeserialError(v2, 1u);
  uint64_t v24 = *(void *)(v2 + 248);
  int v25 = *(char *)(v24 + v22);
  unint64_t v26 = *(unsigned __int8 *)(v24 + v22);
  uint64_t v27 = v22 + 1;
  *(_DWORD *)(v2 + 260) = v22 + 1;
  if (v25 < 0)
  {
    uint64_t v28 = (v26 >> 1) & 7;
    switch(v28)
    {
      case 1:
        if (v22 + 3 > v23) {
          goto LABEL_103;
        }
        LODWORD(v24) = *(unsigned __int16 *)(v24 + v27);
        unsigned int v29 = v22 + 3;
        break;
      case 2:
        unsigned int v29 = v22 + 4;
        if (v29 > v23) {
          goto LABEL_103;
        }
        LODWORD(v24) = *(unsigned __int16 *)(v24 + v27) | (*(unsigned __int8 *)(v24 + v27 + 2) << 16);
        break;
      case 3:
        if (v22 + 5 > v23) {
          goto LABEL_103;
        }
        LODWORD(v24) = *(_DWORD *)(v24 + v27);
        unsigned int v29 = v22 + 5;
        break;
      case 4:
        if (v22 + 5 > v23) {
          goto LABEL_103;
        }
        LODWORD(v24) = *(_DWORD *)(v24 + v27);
        *(_DWORD *)(v2 + 260) = v22 + 5;
        if ((int)v22 + 5 >= v23) {
          goto LABEL_103;
        }
        unsigned int v29 = v22 + 6;
        break;
      case 5:
        if (v22 + 5 > v23) {
          goto LABEL_103;
        }
        LODWORD(v24) = *(_DWORD *)(v24 + v27);
        uint64_t v30 = (v22 + 5);
        *(_DWORD *)(v2 + 260) = v30;
        if (v30 + 2 > v23) {
          goto LABEL_103;
        }
        unsigned int v29 = v22 + 7;
        break;
      case 6:
        if (v22 + 5 > v23) {
          goto LABEL_103;
        }
        LODWORD(v24) = *(_DWORD *)(v24 + v27);
        *(_DWORD *)(v2 + 260) = v22 + 5;
        unsigned int v29 = v22 + 8;
        if (v29 > v23) {
          goto LABEL_103;
        }
        break;
      case 7:
        if (v22 + 9 > v23) {
          goto LABEL_103;
        }
        uint64_t v24 = *(void *)(v24 + v27);
        unsigned int v29 = v22 + 9;
        break;
      default:
        if (v27 >= v23) {
          goto LABEL_103;
        }
        LODWORD(v24) = *(unsigned __int8 *)(v24 + v27);
        unsigned int v29 = v22 + 2;
        break;
    }
    *(_DWORD *)(v2 + 260) = v29;
    if (v25) {
      uint64_t v31 = -256 << (8 * v28);
    }
    else {
      LODWORD(v31) = 0;
    }
    LODWORD(v26) = v24 | v31;
  }
  uint64_t v32 = *(void *)(v2 + 240);
  *(_DWORD *)uint64_t v20 = v26;
  *(_DWORD *)(v20 + 4) = 0;
  *(void *)(v20 + 8) = (*(uint64_t (**)(void, uint64_t, const char *, __n128))(v32 + 8))(*(void *)v32, 8 * v26, "Vector Storage (GLPASTNode *)", v21);
  if (v26)
  {
    uint64_t v33 = 0;
    uint64_t v34 = v26;
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 8 * v34;
    do
    {
      *(void *)(*(void *)(v20 + 8) + 8 * (*(_DWORD *)(v20 + 4))++) = 3730710945;
      v37 = *(void **)(a1 + 32);
      v38 = (void *)(*(void *)(v20 + 8) + v33);
      v40[0] = v35;
      v40[1] = 0x40000000;
      v40[2] = __deserialize_GLPASTNode_block_invoke;
      v40[3] = &__block_descriptor_tmp_16_0;
      v40[4] = v37;
      deserialize_pointer(v37, (uint64_t)v40, v38);
      v33 += 8;
    }
    while (v36 != v33);
  }
  return v20;
}

@end