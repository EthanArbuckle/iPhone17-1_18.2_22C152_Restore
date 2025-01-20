uint64_t getDigestSizeForDigestInfo(uint64_t a1)
{
  return *(void *)(a1 + 8) + *(void *)(a1 + 16) + 12;
}

uint64_t SPAKE2CtxSize()
{
  uint64_t v0 = ccspake_cp_256();
  return MEMORY[0x1F40CB200](v0);
}

uint64_t SPAKE2Alishaz0Size()
{
  uint64_t v0 = ccspake_cp_256();
  return MEMORY[0x1F40CB210](v0);
}

uint64_t AESLubyRackoffContextSize()
{
  return 40;
}

uint64_t keyIsCompactRepresentable()
{
  id v0 = (id)MEMORY[0x1F4188790]();
  [v0 length];
  id v1 = v0;
  [v1 bytes];

  if (ccec_x963_import_pub()) {
    return 0;
  }
  uint64_t result = ccec_validate_pub();
  if (result)
  {
    MEMORY[0x1F4188790]();
    ccn_sub();
    return (int)ccn_cmp() >= 0;
  }
  return result;
}

uint64_t ccss_sizeof_parameters_fix(uint64_t a1)
{
  return MEMORY[0x1F40CB2E8]((a1 + 7) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t init_ccec_ctx_pub(uint64_t result, void *a2)
{
  *a2 = result;
  return result;
}

uint64_t init_ccec_ctx_full(uint64_t result, void *a2)
{
  *a2 = result;
  return result;
}

uint64_t getGCMCtxSize()
{
  return MEMORY[0x1F40CAC80]();
}

unint64_t getHMACContextSizeForDigestInfo(uint64_t a1)
{
  return ((*(void *)(a1 + 8) + *(void *)(a1 + 16) + 19) & 0xFFFFFFFFFFFFFFF8) + *(void *)(a1 + 8);
}

uint64_t getCMACContextSize()
{
  uint64_t v0 = *(void *)(ccaes_cbc_encrypt_mode() + 8);
  return v0 + *(void *)ccaes_cbc_encrypt_mode() + 80;
}

uint64_t getccec_full_ctx_size(void *a1)
{
  return (32 * *a1) | 0x10;
}

uint64_t getccec_pub_ctx_size(void *a1)
{
  return 24 * *a1 + 16;
}

uint64_t getContextSizeForECBMode()
{
  return MEMORY[0x1F40CABB8]();
}

uint64_t ccrng_generate_bridge(uint64_t (**a1)(void))
{
  uint64_t result = (*a1)();
  if (result) {
    abort();
  }
  return result;
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x1F40F6A00]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1F40CA6B8]();
}

uint64_t ccec_affinify()
{
  return MEMORY[0x1F40CA9C8]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1F40CAA10]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1F40CAA18]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1F40CAA20]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1F40CAA40]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1F40CAA48]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1F40CAA50]();
}

uint64_t ccec_full_add()
{
  return MEMORY[0x1F40CAAC0]();
}

uint64_t ccec_full_sub()
{
  return MEMORY[0x1F40CAAC8]();
}

uint64_t ccec_generate_scalar_fips_retry()
{
  return MEMORY[0x1F40CAAF0]();
}

uint64_t ccec_mult_blinded()
{
  return MEMORY[0x1F40CAB10]();
}

uint64_t ccec_projectify()
{
  return MEMORY[0x1F40CAB20]();
}

uint64_t ccec_raw_import_priv_only()
{
  return MEMORY[0x1F40CAB28]();
}

uint64_t ccec_raw_import_pub()
{
  return MEMORY[0x1F40CAB30]();
}

uint64_t ccec_validate_pub()
{
  return MEMORY[0x1F40CAB70]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1F40CAB90]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1F40CAB98]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1F40CABA8]();
}

uint64_t ccn_cmp()
{
  return MEMORY[0x1F40CAFA0]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1F40CAFB0]();
}

uint64_t ccn_sub()
{
  return MEMORY[0x1F40CAFC0]();
}

uint64_t ccn_write_uint_padded_ct()
{
  return MEMORY[0x1F40CAFE8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccspake_cp_256()
{
  return MEMORY[0x1F40CB1A0]();
}

uint64_t ccss_shamir_share_export()
{
  return MEMORY[0x1F40CB298]();
}

uint64_t ccss_shamir_share_import()
{
  return MEMORY[0x1F40CB2C8]();
}

uint64_t ccss_shamir_share_init()
{
  return MEMORY[0x1F40CB2D0]();
}

uint64_t ccss_shamir_share_sizeof_y()
{
  return MEMORY[0x1F40CB2D8]();
}

uint64_t ccss_sizeof_share()
{
  return MEMORY[0x1F40CB2F8]();
}

uint64_t cczp_add()
{
  return MEMORY[0x1F40CB328]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1F40CB330]();
}

uint64_t cczp_inv()
{
  return MEMORY[0x1F40CB338]();
}

uint64_t cczp_mod()
{
  return MEMORY[0x1F40CB340]();
}

uint64_t cczp_mul()
{
  return MEMORY[0x1F40CB348]();
}

uint64_t cczp_n()
{
  return MEMORY[0x1F40CB350]();
}

uint64_t cczp_sub()
{
  return MEMORY[0x1F40CB358]();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint64_t map_to_curve_sswu()
{
  return MEMORY[0x1F40CCC58]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}